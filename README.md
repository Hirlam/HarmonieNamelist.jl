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


## Conversion to namelist

To create namelist with comments and urls for 

```bash
julia --project scr/schema2namelist.jl src/jsonschema/*
```

## Example

```bash
julia --project scr/schema2namelist.jl src/jsonschema/nam_teb.schema.json 

# Namelist for town energy balance
# 4.1.6. Namelist NAM_TEB
# http://www.umr-cnrm.fr/surfex/spip.php?article236

&NAM_TEB   
  NFLOOR_LAYER=5             # number of layers in floors []
  LGREENROOF=.FALSE.         # logical to call ISBA from TEb for GREENROOF []
  NROAD_LAYER=5              # number of layers in roads []
  NTEB_PATCH=1               # number of TEB patches (corresponding to the roads orientations) []
  CHEAT_COIL='IDEAL '        # type of heating coil ['IDEAL ', 'FINCAP']
  LAUTOSIZE=.FALSE.          # flag to activate autosize calculations []
  LHYDRO=.FALSE.             # urban subsoil and hydrology processes (not implemented yet) []
  LSOLAR_PANEL=.FALSE.       # solar panels on roofs []
  CBEM='DEF'                 # option for the building energy model ['DEF', 'BEM']
  NROOF_LAYER=5              # number of layers in roofs []
  NWALL_LAYER=5              # number of layers in walls []
  CCOOL_COIL='IDEAL '        # type of cooling coil ['IDEAL ', 'DXCOIL']
/
```