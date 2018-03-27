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
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/MemoryBuffer.h"

#include "llvm/Bitcode/BitcodeReader.h"
#include "llvm/Bitcode/BitcodeWriter.h"

#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LLVMContext.h"

#include "llvm/Transforms/Utils/Cloning.h"


#include "llvm/Pass.h"


using namespace llvm;
namespace {
	struct SignatureDetection : public FunctionPass {
		std::vector<std::string> seen_functions; 						// So not to loop over.
		static char ID; 												// ID of pass.

		SignatureDetection() : FunctionPass(ID) {}

		bool runOnFunction(Function &F) override {

			std::string err_str; 										// For error notifications.
			std::map<std::string, int> opCounter; 						// for testing purposes.
			ValueToValueMapTy vmap;
			bool emptyArgs; 											// if function arg list is empty.

			srand(time(NULL));

			if(F.getName() != "main" && F.getName() != "test_loop") { 	// Ignoring main function (as we are going to separately parse each function.)

				errs() << " ~  Identifying Signature for:   "; 			// first identify function 
				errs().write_escaped(F.getName()) << '\n'; 				// ...

				for(Function::iterator bb  = F.begin(), be = F.end(); bb != be; ++bb) {
					errs() << " ~ --> Modifying Basic Block.\n";
					int rand_num_1 = rand()%100;
					int rand_num_2 = rand()%100;

					Instruction *is = bb->getFirstNonPHIOrDbg();
					Instruction *curOpS = dyn_cast<Instruction>(is);
					Value* V1 = ConstantInt::get(Type::getInt32Ty(bb->getContext()), rand_num_1);
					Value* V2 = ConstantInt::get(Type::getInt32Ty(bb->getContext()), rand_num_2);
					BinaryOperator::Create(Instruction::Add, V1, V2, "canary", curOpS);

					Instruction *ie = bb->getTerminator();
					Instruction *curOpE = dyn_cast<Instruction>(ie);
					Value* V3 = ConstantInt::get(Type::getInt32Ty(bb->getContext()), rand_num_1);
					Value* V4 = ConstantInt::get(Type::getInt32Ty(bb->getContext()), rand_num_2);
					BinaryOperator::Create(Instruction::Add, V3, V4, "check_canary", curOpE);					



					Instruction *ci;

					for(BasicBlock::iterator inst_b = bb->begin(), inst_e = bb->end(); inst_b != inst_e; ++inst_b ) {
						Instruction *i = &(*inst_b);

						if( isa<llvm::BinaryOperator>(i) && !(isa<CmpInst>(i)) && !(isa<BranchInst>(i)) && !(isa<ReturnInst>(i)) && !(isa<CallInst>(i)) && i != 0 ){


							if(strncmp((i->getName().str()).c_str(),"canary", 6) == 0){
								errs() << i->getName() << "\n";
								ci = dyn_cast<Instruction>(i);

							} else if(strncmp((i->getName().str()).c_str(),"check", 5) == 0) {
								errs() << "-- check this\n";
							} else {
								errs() << *i << "\n";
								Instruction *curOp = dyn_cast<Instruction>(i);
								if(!curOp) {
									errs() << "Skipping instruction...\n";
								}
								BinaryOperator::Create(Instruction::Xor, i, ci, "canary", curOp->getNextNode());
							}
						}
					}
				}

				for(BasicBlock &sbb : F) {
					for(Instruction &i : sbb){
						errs() << "[i]" << i <<"\n";
					}
					errs() << "\n";
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
