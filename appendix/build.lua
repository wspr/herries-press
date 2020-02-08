
--[=========================[--
   L3BUILD FILE FOR APPENDIX
--]=========================]--

module  = "appendix"
version = "1.2c"
pkgdate = "2020/02/08"
gittag  = module.."-v"..version

uploadconfig = {
  version     = version,
  author      = "Peter R Wilson; Will Robertson",
  license     = "lppl1.3c",
  summary     = "Extra control of appendices",
  ctanPath    = "/macros/latex/contrib/"..module,
  repository  = "https://github.com/wspr/herries-press/",
  bugtracker  = "https://github.com/wspr/herries-press/issues",
  description = [[
The appendix package provides various ways of formatting the titles of appendices.
Also (sub)appendices environments are provided that can be used, for example, for
per chapter/section appendices. The word ‘Appendix’ or similar can be prepended to
the appendix number for article class documents. The word ‘Appendices’ or similar
can be added to the table of contents before the appendices are listed. The word
‘Appendices’ or similar can be typeset as a \part-like heading (page) in the body.
An appendices environment is provided which can be used instead of the \appendix
command.
  ]]
}

announce = {}
announce["1.2c"] = [[
  * Fix bug with hyperref.
]]
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
