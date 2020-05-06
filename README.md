# HarmonieNamelist.jl
JSON schema files for Harmonie namelists

## Installation

```bash
git clone git@github.com:Hirlam/HarmonieNamelist.jl HarmonieNamelist
```

To install the dependencies
```bash
julia --project -e 'using Pkg; Pkg.instantiate()'
```


# Conversion to namelist

Create namelist with comments and urls 

```bash
julia --project scr/schema2namelist.jl src/jsonschema/*
```
