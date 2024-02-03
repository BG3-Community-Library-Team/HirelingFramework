Actions.RegisterHireling = {}

--- Action to register Hirelings to DB_Hirelings_HACK_PlayerRoots
--- @param data table<string> Table of Name_UUIDs of race templates
--- @param flag string Name_UUID of Flag for Hirelin
function Actions.RegisterHireling.Race(data, flag)
  if Conditions.IsHirelingDataValid({ flag }, data) then
    Osi.DB_Hirelings_HACK_PlayerRoots(data.RaceTemplateIdF, flag, Globals.HirelingGenderStrings.Femme)
    Osi.DB_Hirelings_HACK_PlayerRoots(data.RaceTemplateIdM, flag, Globals.HirelingGenderStrings.Masc)
  else
    CLUtils.Error(Strings.ERR_HirelingDataInvalid ..
      ": Flag " .. flag .. ", Template ID " .. table.concat(data, ", "))
  end
end

--- Action to register Hirelings to DB_Hirelings_HACK_PlayerRoots
--- @param data table<string> Table of Name_UUIDs of Origin Global template and Flag for Recruited
--- @param flag string Name_UUID of Flag for Hireling Class
function Actions.RegisterHireling.Class(data, flag)
  local flags = { flag, data.RecruitedFlag }
  if Conditions.IsHirelingDataValid(flags, { data.OriginGlobalTemplate }) then
    Osi.DB_Hirelings_HACK_Classes(flag, data.OriginGlobalTemplate,
      data.RecruitedFlag)
  else
    CLUtils.Error(Strings.ERR_HirelingDataInvalid ..
      ": Flags " .. table.concat(flags, ", ") .. ", Template ID " .. data.OriginGlobalTemplate)
  end
end
