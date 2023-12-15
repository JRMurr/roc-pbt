app "simple"
    packages { pf: "../platform/main.roc" }
    imports [
    ]
    provides [main] to pf

main = \{} -> "lets go"

