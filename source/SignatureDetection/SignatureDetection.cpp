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
		std::vector<std::string> seen_functions; 				// So not to loop over.
		static char ID; 										// ID of pass.

		SignatureDetection() : FunctionPass(ID) {}

		bool runOnFunction(Function &F) override {

			std::string err_str; 
			srand(time(NULL));
			if(F.getName() != "main") {

				errs() << " ~  Identifying Signature for: "; 		// first identify function 
				errs().write_escaped(F.getName()) << '\n'; 		//

				InitializeNativeTarget(); 						// initialize target
	    		InitializeNativeTargetAsmPrinter();
				InitializeNativeTargetAsmParser();
				
				LLVMContext context;
	  			
	  			char buff[255];
	  			GetCurrentDir( buff, FILENAME_MAX );
	  			std::string current_working_dir(buff);
				
				errs() << " ~  Checking Directory: " << current_working_dir<< "\n";
				
				auto membuf = MemoryBuffer::getFile("test_me.bc");
			
				if(std::error_code ec = membuf.getError()) {
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
						++args;
					}

					std::vector<GenericValue> arguments(args);
					args=0;
					for(auto arg = func->arg_begin(); arg != func->arg_end(); ++arg) {
						errs() << " | $(" << *arg << ")\n";
						auto *AI = dyn_cast<Value>(arg);
						if(AI->getType()->isIntegerTy()) {
							arguments[args++].IntVal=APInt(32, rand()%50 );
						} else if (AI->getType()->isFloatTy()) {
							arguments[args++].FloatVal=rand()%50+0.0;							
						}

					}
					errs() << " +-----------------------\n";
					Type* rt = func->getReturnType();

					if(rt->isEmptyTy() || rt->isVoidTy()) {
						errs() << "--> Function Return is Empty.\n";
						auto siftbuf = MemoryBuffer::getFile("SIFTUtils.bc");
					
						if(std::error_code ecs = siftbuf.getError()) {
							errs() << "[!] ERR: " << ecs.message() << "\n";
							return false;
						}	

						errs() << " ~  Beginning Bitcode parsing.\n";

						auto siftm = parseBitcodeFile(*std::move(siftbuf.get()), context);


						if(auto sifterr = siftm.takeError()) {
							errs() << "[!] Error Occured\n";
							return false; 
						}
					}

					for(int i =0; i< 10; ++i) {
						args=0;
						auto ret = ee->runFunction(func, arguments);
						if(rt->isIntegerTy()) {
							errs() << "--> We got: " << ret.IntVal << "\n";
						} else if(rt->isFloatTy() || rt->isHalfTy()) {
							errs() << "--> We got: " << ret.FloatVal << "\n";
						} else if(rt->isDoubleTy()) {
							errs() << "--> We got: " << ret.FloatVal << "\n";
						} else if(rt->isStructTy()) {
							errs() << "[!] Not Handling Structs.\n";
						}

						for(auto arg = func->arg_begin(); arg != func->arg_end(); ++arg) {
							auto *AI = dyn_cast<Value>(arg);
							if(AI->getType()->isIntegerTy()) {
								arguments[args++].IntVal=rand()%50;
							} else if (AI->getType()->isFloatTy()) {
								arguments[args++].FloatVal=rand()%50+0.0;							
							}
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
