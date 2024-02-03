function Conditions.IsHirelingDataValid(flags, templates)
  local found = true

  for _, flag in pairs(flags) do
    if not Ext.StaticData.Get(flag, "Flag") then
      found = false
    end
  end

  for _, template in pairs(templates) do
    local templateId = string.sub(template, -36)
    if not Ext.Templates.Get(templateId) then
      found = false
    end
  end

  return found
end
