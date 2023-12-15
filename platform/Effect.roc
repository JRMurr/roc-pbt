hosted Effect
    exposes [
        Effect,
        after,
        map,
        always,
        forever,
        loop,
    ]
    imports [
        # InternalHttp.{ Request, Response },
        # InternalFile,
        # InternalDir,
        # InternalTcp,
        # InternalCommand,
    ]
    generates Effect with [after, map, always, forever, loop]
