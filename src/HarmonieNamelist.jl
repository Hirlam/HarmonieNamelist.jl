module HarmonieNamelist

export schema2namelist


const moduledir=@__DIR__ 

const NAMELIST_DIR = "$moduledir/namelists/"
const SCHEMA_DIR="$moduledir/jsonschema"

tofortran(val::Bool) =  val ? ".TRUE."  :  ".FALSE."
tofortran(val::Number) = val
tofortran(val::AbstractString) = "'$val'"


function schema2namelist(io::IO, d::AbstractDict)
    out = String[]
    println(io, "# $(d["description"])")
    for link in d["links"]
        println(io,"# $(link["rel"])")
        println(io,"# $(link["href"])")
        println(io,"")
    end
    println(io,"&$(d["title"])   ")
    prop= d["properties"]
    descriptions = ["# $(get(val,"description",""))"  for (key,val) in prop]
    defaults     = ["# $(get(val,"defaults",""))"     for (key,val) in prop]
    keys         = ["$key ="                          for (key,val) in prop]
    for (key,property) in d["properties"]        
        default = tofortran(get(property,"default","")) 
        description = property["description"]
        keydefault=rpad("$key=$default",25)
        enum= join(get(property,"enum",""),", ")
        println(io, "  $keydefault  # $description [$enum]")
    end    
    println(io, "/")
    println(io,"")
end 

end # module
