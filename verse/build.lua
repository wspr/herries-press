
--[=========================[--
   L3BUILD FILE FOR VERSE
--]=========================]--

module  = io.popen("basename `pwd`"):read()
version = "2.4c"
pkgdate = "2024/02/12"
gittag  = module.."-v"..version

uploadconfig = {
  version     = version,
  author      = "Peter R Wilson; Will Robertson",
  license     = "lppl1.3c",
  summary     = "Aids for typesetting simple verse",
  ctanPath    = "/macros/latex/contrib/"..module,
  repository  = "https://github.com/wspr/herries-press/",
  bugtracker  = "https://github.com/wspr/herries-press/issues",
  description = [[
The package documentation discusses approaches to the problem; the package is strong on layout, from simple alternate-line indentation to the Mouse's tale from Alice in Wonderland.
  ]]
}

announce = {}
announce["2.4c"] = [[
  * Avoid conflict with experimental LaTeX tagging code.
]]


--[=================[--
     MORE SETTINGS
--]=================]--

uploadconfig.announcement = announce[version]

checkruns = 3
recordstatus = true
textfiles    = {"README"}
tagfiles     = {"*.dtx"}

--[=================[--
     CUSTOMISATION
--]=================]--

today = os.date("%Y/%m/%d")
if pkgdate ~= today then
  print("Package date is not today:"..
        "\nPkg date: "..pkgdate..
        "\nToday:    "..today)
end

require("l3build-wspr.lua")

--[===========[--
     TAGGING
--]===========]--

status_bool = false

function check_status()
  if status_bool then
    return true
  end

  local handle = io.popen('git status --porcelain --untracked-files=no')
  local gitstatus = string.gsub(handle:read("*a"),'%s*$','')
  handle:close()
  if gitstatus=="" then
    print("Checking git status: clean")
    status_bool = true
    return status_bool
  else
    print("ABORTING, git status is not clean:")
    print(gitstatus)
    status_bool = false
    return status_bool
  end
end

function tag_hook(tagname)
  if check_status() then
    os.execute('git commit -a -m "Step release tag"')
    os.execute('git tag -a -m "" ' .. gittag)
  end
end


function update_tag(file,content,tagname,tagdate)
  if content==nil then
    print("content should not be nil!")
  end

  if not(check_status()) then
    return content
  end

  if string.match(file, "%.sty$") then
    local findpattern = "%d%d%d%d/%d%d/%d%d%sv%d.%d%S%s"
    local foundtag = content:match(findpattern)
    print("Old package date/version: " .. foundtag)
    local newtag = pkgdate .. " v" .. version .. " "
    print("Replaced with:            " .. newtag)
    local newcontent = content:gsub(findpattern,newtag)
    return newcontent
  end
  return content
end
