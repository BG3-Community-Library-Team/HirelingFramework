--- API Function to Import Payload data into Globals.HirelingDataToRegister into Hireling Framework.
--- Recommended to utilize `HirelingFrameworkConfig.json` in your `ScriptExtender` folder,
--- rather than directly calling this API function.
--[[
  ```lua
  {
    modGuids = {},
    HirelingData = {
      {
        RaceTemplateIdF = "Name_UUID",
        RaceTemplateIdM = "Name_UUID",
        RaceHackFlagId = "Name_UUID"
      }
    }
  }
  ```
]]
--- @param payload table
function Api.ImportHirelingTemplates(payload)
  CLUtils.Info("Entering Api.ImportHirelingTemplates", Globals.InfoOverride)

  local found, missingMods = Conditions.IsAllModsLoaded(payload.modGuids)
  if found then
    for HackFlagId, data in pairs(payload.HirelingData) do
      if data.Type == "Race" then
        Globals.HirelingsToRegister.Race[HackFlagId] = {
          RaceTemplateIdF = data.Femme or nil,
          RaceTemplateIdM = data.Masc or nil
        }
      elseif data.data.Type == "Class" then
        Globals.HirelingsToRegister.Class[HackFlagId] = {
          OriginGlobalTemplate = data.OriginGlobalTemplate or nil,
          RecruitedFlag = data.RecruitedFlag or nil
        }
      end
    end
  else
    CLUtils.Warn(Strings.WARN_MODS_NOT_FOUND .. table.concat(missingMods, ", "))
  end
end
