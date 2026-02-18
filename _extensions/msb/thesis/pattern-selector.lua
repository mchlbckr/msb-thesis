local MAX_PATTERNS = 12
local SUPPORTED_LANGS = { de = true, en = true }

local function stringify(meta_value)
  return pandoc.utils.stringify(meta_value)
end

local function title_style(meta)
  local style = meta["title-style"]
  if not style then
    return "fh-pattern"
  end
  local s = stringify(style)
  if s == "" then
    return "fh-pattern"
  end
  return s
end

function Meta(meta)
  if not meta["msb-thesis"] then
    return meta
  end

  -- Detect language; warn for unsupported codes and fall back to German
  local lang = meta["lang"] and stringify(meta["lang"]) or "de"
  local lang_prefix = lang:match("^(%a%a)") or "de"
  if not SUPPORTED_LANGS[lang_prefix] then
    io.stderr:write("msb-thesis: unsupported language '" .. lang .. "', defaulting to German\n")
  end
  meta["lang-english"] = pandoc.MetaBool(lang_prefix == "en")

  if title_style(meta) == "classic" then
    return meta
  end

  if not meta["title-pattern-file"] then
    local selected = meta["title-pattern"]
    local n = 10
    if selected then
      local parsed = tonumber(stringify(selected))
      if parsed and parsed >= 1 and parsed <= MAX_PATTERNS then
        n = math.floor(parsed)
      end
    end
    local index = string.format("%02d", n)
    local pattern_path = "figures/pattern/pdf/Pattern_A4_CMYK_Blau_" .. index .. ".pdf"
    -- Warn if the pattern file is missing so the build doesn't fail silently
    local f = io.open(pattern_path, "r")
    if f then
      f:close()
    else
      io.stderr:write("msb-thesis: pattern file not found: " .. pattern_path .. "\n")
    end
    meta["title-pattern-file"] = pandoc.MetaString(pattern_path)
  end

  return meta
end

function Header(el)
  if el.level ~= 1 then
    return el
  end

  local title = stringify(el):lower()
  local is_refs =
    el.identifier == "literaturverzeichnis" or
    el.identifier == "references" or
    title == "literaturverzeichnis" or
    title == "references"

  if is_refs then
    el.classes:insert("unnumbered")
  end

  return el
end
