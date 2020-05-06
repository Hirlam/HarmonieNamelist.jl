module HarmonieNamelist

export schema2namelist

tofortran(val::Bool) =  val ? ".TRUE."  :  ".FALSE."
tofortran(val::Number) = val
tofortran(val::AbstractString) = "'$val'"
tofortran(val::Nothing) = ""

function schema2namelist(io::IO, d::AbstractDict)
    println(io, "# $(d["description"])")
    for link in d["links"]
        println(io,"# $(link["rel"])")
        println(io,"# $(link["href"])")
        println(io,"")
    end
    println(io,"&$(d["title"])   ")
    for (key,property) in d["properties"]        
        default     = tofortran(get(property,"default","")) 
        description = property["description"]
        keydefault  = rpad("$key=$default",25)
        enum        = join(tofortran.(get(property,"enum",nothing)),", ")
        println(io, "  $keydefault  # $description [$enum]")
    end    
    println(io, "/")
    println(io,"")
end 

end # module
