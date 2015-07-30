#!/usr/bin/env texlua

module = "tocloft"
txtfiles = {“README”}

checkruns = 3

kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
