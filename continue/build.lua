
--[=========================[--
   L3BUILD FILE FOR CONTINUE
--]=========================]--

module  = "continue"
version = "0.2"
pkgdate = "2018/12/09"
copyrightyear = "2015"
gittag  = module.."-v"..version

uploadconfig = {
  version     = version,
  author      = "Peter R Wilson; Don­ald Arse­neau; Luca Mer­ci­adri; Will Robertson",
  license     = "lppl1.3c",
  summary     = "Prints ‘continuation’ marks on pages of multipage documents",
  ctanPath    = "/macros/latex/contrib/continue",
  repository  = "https://github.com/wspr/herries-press/",
  bugtracker  = "https://github.com/wspr/herries-press/issues",
  description = [[
    This pack­age pro­vides for a va­ri­ety of con­tin­u­a­tion in­di­ca­tors on pages when the text con­tin­ues on the fol­low­ing page. The de­fault is to only mark odd pages, but all pages can be marked and the mark­ing can be stopped or started at any point.
  ]]
}


announce = {}
announce["0.3"] = [[
  New maintainer (Will Robertson).
]]
uploadconfig.announcement = announce[version]



require("../build-herries.lua")

--[===================[--
   WSPR UPLOAD DETAILS
--]===================]--

local function prequire(m) -- from: https://stackoverflow.com/a/17878208
  local ok, err = pcall(require, m)
  if not ok then return nil, err end
  return err
end

prequire("l3build-wspr.lua")
