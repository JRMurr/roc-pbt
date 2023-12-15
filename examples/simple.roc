app "simple"
    packages { pf: "../platform/main.roc" }
    imports [
        pf.Task,
    ]
    provides [main] to pf

dbge = \x ->
    dbg x

    x

main =
    [1, 2, 3, 4]
    |> dbge
    |> List.sum
    |> Num.toI32
    |> Task.err

