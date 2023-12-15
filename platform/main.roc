platform "pbt"
    requires {} { main : Task {} I32 }
    exposes [
        Task,
        Generator,
    ]
    packages {}
    imports [
        Task.{ Task },
    ]
    provides [mainForHost]

mainForHost : Task {} I32 as Fx
mainForHost = main
