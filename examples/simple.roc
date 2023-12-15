app "simple"
    packages { pf: "../platform/main.roc" }
    imports [
    ]
    provides [main] to pf

dbge = \x ->
    dbg x

    x

main = \{} ->
    [1, 2, 3, 4]
    |> dbge
    |> List.map (\x -> x * 100)
    |> List.sum
    |> Num.toStr

