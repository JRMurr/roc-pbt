hosted Effect
    exposes [
        Effect,
        after,
        map,
        always,
        forever,
        loop,

        # rust exposed generators
        genU64,
        genStr,
    ]
    imports [
        # InternalHttp.{ Request, Response },
        # InternalFile,
        # InternalDir,
        # InternalTcp,
        # InternalCommand,
    ]
    generates Effect with [after, map, always, forever, loop]

genU64 : Effect U64

genStr : Effect Str
