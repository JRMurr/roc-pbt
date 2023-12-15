
# https://github.com/casey/just

default:
    @just --list

simple:
    roc dev examples/simple.roc

gen-glue:
    #!/usr/bin/env bash
    set -euxo pipefail
    cd platform
    roc glue "$ROC_SRC_CODE_PATH/crates/glue/src/RustGlue.roc" crates/glue/


roc-clean:
    rm platform/{dynhost,libapp.so,linux-x64.rh,metadata_linux-x64.rm}
