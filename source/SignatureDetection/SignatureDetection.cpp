#include <string>
#include <memory>
#include <string.h>
#include <map>
#include <ctime>
#include <unistd.h>
#include <cstdlib>
#include <stdarg.h>

#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Attributes.h"

#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"

#include "llvm/Pass.h"

#define llvm_printf(...) kprintf(__VA_ARGS__, NULL)


using namespace llvm;
namespace {
	struct SignatureDetection : public FunctionPass {
		std::vector<std::string> seen_functions; 						// So not to loop over.
		static char ID; 												// ID of pass.
		Module * mod_p; 
		BasicBlock * bb_p; 
		BasicBlock* killBB;

		
		SignatureDetection() : FunctionPass(ID) {}

		void kprintf(const char *format, ...)
		{
		    Function *func_printf = mod_p->getFunction("printf");
		    if (!func_printf) {
		        PointerType *Pty = PointerType::get(IntegerType::get(mod_p->getContext(), 8), 0);
		        FunctionType *FuncTy9 = FunctionType::get(IntegerType::get(mod_p->getContext(), 32), true);

		        func_printf = Function::Create(FuncTy9, GlobalValue::ExternalLinkage, "printf", mod_p);
		        func_printf->setCallingConv(CallingConv::C);

		        AttributeList func_printf_PAL;
		        func_printf->setAttributes(func_printf_PAL);
		    }


		    IRBuilder <> builder(bb_p->getContext());
		    builder.SetInsertPoint(bb_p);

		    Value *str = builder.CreateGlobalStringPtr(format);

		    std::vector <Value *> int32_call_params;
		    int32_call_params.push_back(str);


		    va_list ap;
		    va_start(ap, format);

		    do {
		      	Value *op = va_arg(ap, Value *);
		        if (op) {
		            int32_call_params.push_back(op);
		        } else {
		            break;
		        }
		    } while (1);

		    va_end(ap);

		    BasicBlock::iterator bip = bb_p->begin();

		    CallInst * int32_call = CallInst::Create(func_printf, int32_call_params, "call", &(*bip));
		}

		bool runOnFunction(Function &F) override {

			srand(time(NULL));
			bool kill_generated=false;

			if(F.getName() != "main") { 								// Ignoring main function (as we are going to separately parse each function.)

				errs() << " ~  Identifying Signature for:   "; 			// first identify function 
				errs().write_escaped(F.getName()) << '\n'; 				// ...

				for(Function::iterator bb  = F.begin(), be = F.end(); bb != be; ++bb) {
					for(BasicBlock::iterator inst_b = bb->begin(), inst_e = bb->end(); inst_b != inst_e; ++inst_b ) {
						Instruction *i = &(*inst_b);
						if(isa<PHINode>(i)) {
							errs() << "   +---Signature not computed for: ["<<F.getName() <<"]\n";
							return false;
						}
					}
				}

				for(Function::iterator bb  = F.begin(), be = F.end(); bb != be; ++bb) {

					if(strncmp((bb->getName().str()).c_str(),"term.bypass", 11) != 0 && strncmp((bb->getName().str()).c_str(),"term.kill", 9) != 0) {
				
						std::vector<Instruction *> canary_deps;						//canary dependencies 			

						int rand_num_1 = rand()%1000;
						int rand_num_2 = rand()%1000;

						Instruction *is = bb->getFirstNonPHIOrDbg();
						Instruction *curOpS = dyn_cast<Instruction>(is);
						Value* V1 = ConstantInt::get(Type::getInt32Ty(bb->getContext()), rand_num_1);
						Value* V2 = ConstantInt::get(Type::getInt32Ty(bb->getContext()), rand_num_2);
						BinaryOperator::Create(Instruction::Add, V1, V2, "canary", curOpS);

						Instruction *ie = (bb)->getTerminator();
						Instruction *curOpE = dyn_cast<Instruction>(ie);
						Value* V3 = ConstantInt::get(Type::getInt32Ty(bb->getContext()), rand_num_1);
						Value* V4 = ConstantInt::get(Type::getInt32Ty(bb->getContext()), rand_num_2);
						BinaryOperator::Create(Instruction::Add, V3, V4, "check_canary", curOpE);	
						

						Instruction *ci; 		// canary instruction
						Instruction *tci;		// terminating canary instruction

						for(BasicBlock::iterator inst_b = bb->begin(), inst_e = bb->end(); inst_b != inst_e; ++inst_b ) {
							Instruction *i = &(*inst_b);

							

							if( (isa<LoadInst>(i) || isa<llvm::BinaryOperator>(i)) && !(isa<CmpInst>(i)) && !(isa<BranchInst>(i)) && !(isa<ReturnInst>(i)) && !(isa<CallInst>(i)) && i != 0 ){


								if(strncmp((i->getName().str()).c_str(),"canary", 6) == 0){
									ci = dyn_cast<Instruction>(i);
								} else if(strncmp((i->getName().str()).c_str(),"check", 5) == 0) {
									tci = dyn_cast<Instruction>(i);
								} else {
									Instruction *curOp = dyn_cast<Instruction>(i);
									if(!curOp) {

									}
									if(i->getType()->isFloatTy() || i->getType()->isDoubleTy()) {
										CastInst* float_conv = new FPToSIInst(i, Type::getInt32Ty(F.getParent()->getContext()), "cnry.conv", curOp->getNextNode());
										canary_deps.push_back(float_conv);								
										BinaryOperator::Create(Instruction::Xor, float_conv, ci, "canary", float_conv->getNextNode());
									} else if(i->getType()->isIntegerTy(32)) {
											canary_deps.push_back(i);
											BinaryOperator::Create(Instruction::Xor, i, ci, "canary", curOp->getNextNode());
									
									}
								}
							}
						}

						for(Instruction * i : canary_deps) {
							BinaryOperator::Create(Instruction::Xor, i, ci, "canary", tci);
							ci = tci->getPrevNode();
						}
						CmpInst * compare = CmpInst::Create(Instruction::ICmp, CmpInst::ICMP_EQ, ci, tci, "res", tci->getNextNode());
						Module * m = F.getParent();
						mod_p = m;

						BasicBlock::iterator inst_e = bb->end();
						--inst_e;
						
						if(isa<ReturnInst>(inst_e) || isa<BranchInst>(inst_e)) {

							Instruction * old_inst = dyn_cast<Instruction>(&(*inst_e));

							BasicBlock* killBB = BasicBlock::Create(F.getParent()->getContext(), "term.kill", &F, 0);

	  						IRBuilder<> killBuilder(F.getParent()->getContext());
	  						killBuilder.SetInsertPoint(killBB);	
							std::vector<Type *> arg_type;
							std::vector<Value *> args;
							arg_type.push_back(Type::getInt32Ty(m->getContext()));
							Function *fun = Intrinsic::getDeclaration(F.getParent(), Intrinsic::trap);
							killBuilder.CreateBr(killBB);
							bb_p = killBB;
							llvm_printf("[err] - canary does not match.\n");	


							BasicBlock* bypassBB = BasicBlock::Create(F.getParent()->getContext(), "term.bypass", &F, 0);
	  						IRBuilder<> bypassBuilder(F.getParent()->getContext());
	  						bypassBuilder.SetInsertPoint(bypassBB);
	  						Value * v = ConstantInt::get(Type::getInt32Ty(bb->getContext()), 0);
	  						bypassBuilder.CreateAdd(v, v, "nop");

							ValueToValueMapTy vmap;
							auto *new_inst = old_inst->clone();
							bypassBuilder.Insert(new_inst);
							vmap[old_inst] = new_inst;
							RemapInstruction(new_inst, vmap, RF_NoModuleLevelChanges | RF_IgnoreMissingLocals);

	  						BranchInst *replacement = BranchInst::Create(bypassBB, killBB, compare, bb->getTerminator());
	  						bb->getTerminator()->eraseFromParent();
							bb_p = bypassBB;
							llvm_printf("[pass] status ~ OK.\n");	  
						}
					}
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
