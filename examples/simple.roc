app "simple"
    packages { pf: "../platform/main.roc" }
    imports [
    ]
    provides [main] to pf

main = \{} -> 
    dbg ("a dbg message")

    "lets go"

