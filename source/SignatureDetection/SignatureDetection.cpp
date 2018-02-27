#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include <map>

using namespace llvm;
namespace {
	struct SignatureDetection : public FunctionPass {
		std::map<std::string, int> opCounter;
		static char ID;
		SignatureDetection() : FunctionPass(ID) {}

		bool runOnFunction(Function &F) override {
			errs() << "~ Identifying Signature for: ";
			errs().write_escaped(F.getName()) << '\n';
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
