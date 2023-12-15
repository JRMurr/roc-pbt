app "simple"
    packages { pf: "../platform/main.roc" }
    imports [
    ]
    provides [main] to pf

main = \{} ->
    dbg "a dbg message"

    [1, 2, 3, 4]
    |> List.sum
    |> Num.toStr

