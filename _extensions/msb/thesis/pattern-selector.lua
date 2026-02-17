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

  if title_style(meta) == "classic" then
    return meta
  end

  if not meta["title-pattern-file"] then
    local selected = meta["title-pattern"]
    local n = 1
    if selected then
      local parsed = tonumber(stringify(selected))
      if parsed and parsed >= 1 and parsed <= 12 then
        n = math.floor(parsed)
      end
    end
    local index = string.format("%02d", n)
    meta["title-pattern-file"] = pandoc.MetaString(
      "figures/pattern/pdf/Pattern_A4_CMYK_Blau_" .. index .. ".pdf"
    )
  end

  return meta
end
