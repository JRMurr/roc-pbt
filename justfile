
# https://github.com/casey/just

default:
    @just --list


simple:
    roc run examples/simple.roc

gen-glue:
    #!/usr/bin/env bash
    set -euxo pipefail
    cd platform
    roc glue "$ROC_SRC_CODE_PATH/crates/glue/src/RustGlue.roc" crates/glue/
