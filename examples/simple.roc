app "simple"
    packages { pf: "../platform/main.roc" }
    imports [
        pf.Task,
        pf.Generator,
    ]
    provides [main] to pf

dbge = \x ->
    dbg x

    x

main =
    dbg "test"

    val <- Generator.genStr |> Task.await

    dbg val

    Task.err 1

# val <- Generator.genU64 |> Task.await
# dbg
#     val
# [val, 10]
# |> dbge
# |> List.sum
# |> Num.toI32
# |> dbge
# |> Task.err

