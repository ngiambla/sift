#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;
namespace {
	struct SignatureDetection : public FunctionPass {
		static char ID;
		SignatureDetection() : FunctionPass(ID) {}

		bool runOnFunction(Function &F) override {
			errs() << "#############################\n";
			errs() << "~ Identifying Signatures\n";
			errs().write_escaped(F.getName()) << '\n';
			errs() << "#############################\n";
			return false;
		}
	};
}

char SignatureDetection::ID = 0;
static RegisterPass<SignatureDetection> X("signatureDetection", "Acquiring Signuature Detection", false, false);
