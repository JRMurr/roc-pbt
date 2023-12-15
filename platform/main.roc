platform "pbt"
    requires {} { main : {} -> Str }
    exposes [
    ]
    packages {}
    imports [
        # Task.{ Task },
        # Http.{ Request, Method, Response },
    ]
    provides [mainForHost]

mainForHost : {} -> Str
mainForHost = \{} ->
    main {}
