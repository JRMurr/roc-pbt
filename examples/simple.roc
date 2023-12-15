app "simple"
    packages { pf: "../platform/main.roc" }
    imports [
        pf.Task,
        pf.Generator,
        pf.Stdout,
    ]
    provides [main] to pf

dbge = \x ->
    dbg x

    x

main =
    dbg "test"

    _ <- Stdout.line "test123" |> Task.await

    val <- Generator.genStr |> Task.await

    dbg val

    Task.ok {}

# val <- Generator.genU64 |> Task.await
# dbg
#     val
# [val, 10]
# |> dbge
# |> List.sum
# |> Num.toI32
# |> dbge
# |> Task.err

