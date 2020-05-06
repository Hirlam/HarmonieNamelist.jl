#!/usr/bin/env julia

using HarmonieNamelist, JSON


io = stdout
# println(typeof(ARGS))
for arg in ARGS
    schema2namelist(io, JSON.parsefile(arg))
end

