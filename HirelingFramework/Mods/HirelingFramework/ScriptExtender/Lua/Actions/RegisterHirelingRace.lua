--- Register each template/flag one-at-a-time
--- @param hirelingTemplate string
--- @param hirelingHackRaceFlagId string
--- @param genderHackFlag string
local function ActualRegistration(hirelingTemplate, hirelingHackRaceFlagId, genderHackFlag)
  if Conditions.IsHirelingDataValid(hirelingHackRaceFlagId, hirelingTemplate) then
    Osi.DB_Hirelings_HACK_PlayerRoots(hirelingTemplate, hirelingHackRaceFlagId, genderHackFlag)
  else
    CLUtils.Error(Strings.ERR_HirelingDataInvalid ..
      ": Flag " .. hirelingHackRaceFlagId .. ", Template ID " .. hirelingTemplate)
  end
end

--- Action to register Hirelings to DB_Hirelings_HACK_PlayerRoots
--- @param hirelingTemplates table<string> Table of Name_UUIDs of race templates
--- @param hirelingHackRaceFlagId string Name_UUID of Flag for Hirelin
function Actions.RegisterHireling(hirelingTemplates, hirelingHackRaceFlagId)
  ActualRegistration(hirelingTemplates.RaceTemplateIdF, hirelingHackRaceFlagId,
    "Hirelings_HACK_CreateFemale_9e093d5e-1dd1-4f74-8fd1-2ad724ae33ca")
  ActualRegistration(hirelingTemplates.RaceTemplateIdM, hirelingHackRaceFlagId,
    "Hirelings_HACK_CreateMale_2ab637f5-3153-4892-a92a-0d72eb944a57")
end
