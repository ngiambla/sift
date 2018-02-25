#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {
	struct SignatureDetection : public FunctionPass {
		static char ID;
		SignatureDetection() : FunctionPass(ID) {}

		bool runOnFunction(Function &F) override {
			errs() << "~ Identifying Signatures";
			errs().write_escaped(F.getName()) << '\n';
			return false;
		}
	};
}

char SignatureDetection::ID = 0;
static RegisterPass<SignatureDetection> X("signatureDetection", "Acquiring Signuature Detection", false, false);
