Globals = {}
HF = {}
HF.UUID = "0119681e-9ea0-4b24-8009-bc13da121229"
HF.modTableKey = "HirelingFramework"
HF.modPrefix = "HF"
HF.modVersion = Ext.Mod.GetMod(HF.UUID).Info.ModVersion

Mods.HF = Mods.HirelingFramework
Globals.InfoOverride = false

local clImports = {}
clImports[1] = "Globals"
clImports[2] = "Utils"

CLGlobals, CLUtils = Mods.CommunityLibrary.Import(clImports)

Globals.HirelingsToRegister = {
  Class = {},
  Race = {}
}

Globals.HirelingClassDataExpectedFields = {
  "OriginClassGlobalTemplateeId",
  "HackClassRecruitedFlagId",
  "HackClassFlagId"
}
Globals.HirelingRaceDataExpectedFields = {
  "RaceTemplateIdF",
  "RaceTemplateIdM",
  "HackRaceFlagId"
}

Globals.HirelingGenderStrings = {
  Femme = "Hirelings_HACK_CreateFemale_9e093d5e-1dd1-4f74-8fd1-2ad724ae33ca",
  Masc = "Hirelings_HACK_CreateMale_2ab637f5-3153-4892-a92a-0d72eb944a57"
}