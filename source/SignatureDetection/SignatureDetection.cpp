#include <string>
#include <memory>
#include <map>
#include <unistd.h>
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
#include "llvm/Support/raw_ostream.h"

using namespace llvm;
namespace {
	struct SignatureDetection : public FunctionPass {
		std::map<std::string, int> opCounter;
		
		static char ID;
		SignatureDetection() : FunctionPass(ID) {}

		bool runOnFunction(Function &F) override {

			std::string err_str; 						// 

			errs() << "~ Identifying Signature for: "; 		// first identify function 
			errs().write_escaped(F.getName()) << '\n'; 		//

			InitializeNativeTarget(); 						// initialize target
    		InitializeNativeTargetAsmPrinter();
			InitializeNativeTargetAsmParser();
			
			LLVMContext context; 							// 
  			
  			char buff[255];
  			GetCurrentDir( buff, FILENAME_MAX );
  			std::string current_working_dir(buff);
			
			errs() << "~ Checking Directory: " << current_working_dir<< "\n";
			
			auto membuf = MemoryBuffer::getFile("test_me.bc");
		
			if(std::error_code ec = membuf.getError()) {
				errs() << " ERR: " << ec.message() << "\n";
				return false;
			}	

			errs() << "~ Beginning Bitcode parsing.\n";

			auto m = parseBitcodeFile(*std::move(membuf.get()), context);


			if(auto err = m.takeError()) {
				errs() << "Error Occured\n";
				return 1;
			} else {
				errs() << "~ About to test: " << m.get()->getName() << "\n";
			}
 			// auto targetMachine = EngineBuilder().selectTarget();
			try{

				ExecutionEngine* ee = EngineBuilder(std::move(m.get())).setErrorStr(&err_str).create();

				if(!ee){
					errs() << "Failed to construct ExecutionEngine: " << err_str << "\n";
					return 1;
				} else {
					errs() << "~ ExecutionEngine constructed.\n";
				}
				
				Function* func = ee->FindFunctionNamed(F.getName());
				errs() << "-- function found.\n";


				typedef void (*PFN)();
				PFN pfn = reinterpret_cast<PFN>(ee->getPointerToFunction(func));
				pfn();
				delete ee;
			} catch(const std::exception& e) {
				errs() << e.what();
				return false;
			}

			for(Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb) {
				BasicBlock &b = *bb;
				for(BasicBlock::iterator i = b.begin(), e2 = b.end(); i != e2; ++i) {
					if ( opCounter.find(i->getOpcodeName()) == opCounter.end() ) {
						opCounter[i->getOpcodeName()] = 1; //New OpCode in the list
					} else {
						opCounter[i->getOpcodeName()] += 1; //Incrementing the old one
					}
				}
			}
			errs() << "~ Checking OP usages...";
			for(auto const& key : opCounter) {
				errs() << key.first << " : " << key.second << "\n";
			}
			return false;
		}
	};
}

char SignatureDetection::ID = 0;
static RegisterPass<SignatureDetection> X("signatureDetection", "Acquiring Signuature Detection", false, false);
