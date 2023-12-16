app "simple"
    packages { pf: "../platform/main.roc" }
    imports [
        pf.Task.{Task},
        pf.Generator,
        pf.Stdout,
    ]
    provides [main] to pf

dbge = \x ->
    dbg x

    x

main : Task {} I32
main =
    val <- Generator.genStr |> dbge |> Task.await 
    {} <- Stdout.line val |> dbge |> Task.await
    Task.err 500

