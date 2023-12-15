platform "pbt"
    requires {} { main : Task {} I32 }
    exposes [
        Task,
        Generator,
        Stdout,
    ]
    packages {}
    imports [
        Task.{ Task },
    ]
    provides [mainForHost]

mainForHost : Task {} I32
mainForHost = main
