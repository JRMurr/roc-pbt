platform "pbt"
    requires {} { main : Task {} I32 }
    exposes [
        Task,
    ]
    packages {}
    imports [
        Task.{ Task },
        # Http.{ Request, Method, Response },
    ]
    provides [mainForHost]

mainForHost : Task {} I32 as Fx
mainForHost = main
