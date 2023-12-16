app "simple"
    packages { pf: "../platform/main.roc" }
    imports [
        pf.Task.{ Task },
        pf.Generator,
        pf.Stdout,
    ]
    provides [main] to pf

dbge = \x ->
    dbg x

    x

main : Task {} I32
main =
    val <- Generator.genStr |> dbge |> Task.onErr (\e -> dbge e) |> Task.await
    numVal <- Generator.genU64 |> dbge |> Task.await

    {} <- Stdout.line ("\(val)\t\(Num.toStr numVal)") |> dbge |> Task.await
    Task.err 0

