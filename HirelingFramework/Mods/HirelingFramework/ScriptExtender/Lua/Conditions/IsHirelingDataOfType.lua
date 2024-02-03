function Conditions.IsHirelingDataOfType(hirelingData, modGuid, type)
  type = type or "Race"
  local found = true
  local missingFields = {}

  if not Globals.HirelingDataExpectedFields[type] then
    CLUtils.Error(Strings.ERR_InvalidHirelingDataType)
    found = false
  end

  for _, field in pairs(Globals.HirelingDataExpectedField[type]) do
    if not hirelingData[field] then
      CLUtils.AddToTable(missingFields, "HackClassFlagId")
    end
  end

  if missingFields then
    CLUtils.Error(Strings.ERR_MissingDataFields .. table.concat(missingFields, ", ") .. Strings.FRAG_FromMod .. modGuid)
  end

  return found
end
