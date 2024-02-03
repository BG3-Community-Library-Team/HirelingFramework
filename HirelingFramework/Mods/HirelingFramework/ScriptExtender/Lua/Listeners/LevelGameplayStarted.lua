Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function (_, _)
  CLUtils.Info("Entering LevelGameplayStarted Listener", Globals.InfoOverride)
  LoadConfigFiles()

  for type, hirelingData in pairs(Globals.HirelingsToRegister) do
    for hirelingFlag, hirelingTemplates in pairs(hirelingData) do
      Actions.RegisterHireling[type](hirelingTemplates, hirelingFlag)
    end
  end
end)
