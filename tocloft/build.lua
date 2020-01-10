
--[========================[--
   L3BUILD FILE FOR TOCLOFT
--]========================]--

module  = "tocloft"
version = "2.3j"
pkgdate = "2020/01/10"
gittag  = module.."-v"..version

uploadconfig = {
  version     = version,
  author      = "Peter R Wilson; Will Robertson",
  license     = "lppl1.3c",
  summary     = "Control table of contents, figures, etc",
  ctanPath    = "/macros/latex/contrib/tocloft",
  repository  = "https://github.com/wspr/herries-press/",
  bugtracker  = "https://github.com/wspr/herries-press/issues",
  description = [[
Provides control over the typography of the Table of Contents, List of Figures and List of Tables, and the ability to create new ‘List of ...’. The ToC \parskip may be changed.
  ]]
}

announce = {}
announce["v2.3j"] = [[
  * Add documentation around lofdepth and lotdepth when using subfigure captions.
  * Add new package option [titles-numbered] for using numbered section headings.
  * Allow paragraph skip to be set even if the [titles] option is in effect.
]]
uploadconfig.announcement = announce[version]

checkruns = 3
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
