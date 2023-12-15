interface Generator
    exposes [
        genU64,
        genStr,
    ]
    imports [Effect, InternalTask, Task.{ Task }]

genU64 : Task U64 *
genU64 =
    Effect.genU64
    |> Effect.map Ok
    |> InternalTask.fromEffect

genStr : Task Str *
genStr =
    Effect.genStr
    |> Effect.map Ok
    |> InternalTask.fromEffect
