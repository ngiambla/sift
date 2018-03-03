#include <string>
#include <memory>
#include <map>
#include <ctime>
#include <unistd.h>
#include <cstdlib>

#define GetCurrentDir getcwd


#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/ExecutionEngine/MCJIT.h"
#include "llvm/ExecutionEngine/Interpreter.h"
#include "llvm/Support/DynamicLibrary.h"

#include "llvm/Support/TargetSelect.h"
#include "llvm/Bitcode/BitcodeReader.h"
#include "llvm/Bitcode/BitcodeWriter.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/IR/LLVMContext.h"

#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Type.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;
namespace {
	struct SignatureDetection : public FunctionPass {
		std::vector<std::string> seen_functions; 						// So not to loop over.
		static char ID; 												// ID of pass.

		SignatureDetection() : FunctionPass(ID) {}

		bool runOnFunction(Function &F) override {

			std::string err_str; 										// For error notifications.
			std::map<std::string, int> opCounter; 						// for testing purposes.
			bool emptyArgs; 											// if function arg list is empty.

			srand(time(NULL));

			if(F.getName() != "main") { 								// Ignoring main function (as we are going to separately parse each function.)

				errs() << " ~  Identifying Signature for: "; 			// first identify function 
				errs().write_escaped(F.getName()) << '\n'; 				// ...

				InitializeNativeTarget(); 								// initialize target
	    		InitializeNativeTargetAsmPrinter();						// ...
				InitializeNativeTargetAsmParser();						// ...
				
				LLVMContext context;
	  			
	  			char buff[255];
	  			GetCurrentDir( buff, FILENAME_MAX ); 
	  			std::string current_working_dir(buff);
				
				errs() << " ~  Checking Directory: " << current_working_dir<< "\n";
				
				auto membuf = MemoryBuffer::getFile("test_me.bc"); 		// Loading in  bitcode. (Inefficient, consider revising) 
			
				if(std::error_code ec = membuf.getError()) { 			// ensure bitcode exists.
					errs() << "[!] ERR: " << ec.message() << "\n";
					return false;
				}	

				errs() << " ~  Beginning Bitcode parsing.\n";

				auto m = parseBitcodeFile(*std::move(membuf.get()), context); 


				if(auto err = m.takeError()) {
					errs() << "[!] Error Occured\n";
					return false; 
				}

				try{

					ExecutionEngine* ee = EngineBuilder(std::move(m.get())).setErrorStr(&err_str).create();

					if(!ee){
						errs() << "[!] Failed to construct ExecutionEngine: " << err_str << "\n";
						return false;
					}
					
					Function* func = ee->FindFunctionNamed(F.getName());

					
					errs() << " ~  About to execute: " << func->getName() <<"\n";

					ee->finalizeObject();
					
					errs() << " +-- Gathering Arguments.\n";

					int args = 0;
					for(auto arg = func->arg_begin(); arg != func->arg_end(); ++arg) {
						errs() << " | $(" << *arg << ")\n";
						++args;
					}
					if(args == 0) {
						errs() << " | $(VOID)\n";		
						emptyArgs = true;				
					}
					std::vector<GenericValue> arguments(args);
					errs() << " +-----------------------\n";


					Type* rt = func->getReturnType();

					// Check if return val is empty, and profile inside of code.
					if(rt->isEmptyTy() || rt->isVoidTy()) {
						errs() << "--> Function Return is Empty.\n";
						auto siftbuf = MemoryBuffer::getFile("SIFTUtils.bc");

						if(std::error_code ecs = siftbuf.getError()) {
							errs() << "[!] ERR: " << ecs.message() << "\n";
							return false;
						}	

						errs() << " ~  Fetching SIFT Bitcode.\n";
						auto siftm = parseBitcodeFile(*std::move(siftbuf.get()), context);

						if(auto err = siftm.takeError()) {
							errs() << "[!] Error Occured\n";
							return false; 
						}

						Function *sift_function = (siftm.get())->getFunction("test_loop");

						// for(Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb) {
						// 	for(Function::iterator sbb = sift_function->begin(), se = sift_function->end(); sbb != se; ++sbb) {
						// 		sbb->insertInto(&F, );
						// 	}
						// 	break;
						// }					
					}

					for(int i =0; i< 10; ++i) {
						args=0;

						for(auto arg = func->arg_begin(); arg != func->arg_end(); ++arg) {
							auto *AI = dyn_cast<Value>(arg);
							if(AI->getType()->isIntegerTy()) {
								arguments[args++].IntVal=APInt(32, rand()%50 );
							} else if (AI->getType()->isFloatTy()) {
								arguments[args++].FloatVal=rand()%50+0.0;							
							}  else if (AI->getType()->isDoubleTy()) {
								arguments[args++].DoubleVal=rand()%50+0.0;							
							}
						}
						
						auto ret = ee->runFunction(func, arguments);
						if(rt->isIntegerTy()) {
							errs() << "--> We got: " << ret.IntVal << "\n";
						} else if(rt->isFloatTy() || rt->isHalfTy()) {
							errs() << "--> We got: " << ret.FloatVal << "\n";														
						} else if(rt->isDoubleTy()) {
							errs() << "--> We got: " << ret.DoubleVal << "\n";
						} else if(rt->isStructTy()) {
							errs() << "[!] Not Handling Structs.\n";
						}

					}					

				} catch(const std::exception& e) {
					errs() << e.what();
					return false;
				}
				return true;
			} else {
				return false; 					// do not modify main
			}
		}
	};
}

char SignatureDetection::ID = 0;

static RegisterPass<SignatureDetection> X("signatureDetection", "Acquiring Signuature Detection", false, false);
