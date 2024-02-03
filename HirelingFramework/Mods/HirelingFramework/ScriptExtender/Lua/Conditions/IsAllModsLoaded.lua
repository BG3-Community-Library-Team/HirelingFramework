function Conditions.IsAllModsLoaded(modGuids)
  local res = true
  local missingMods = {}
  for _, uuid in pairs(modGuids) do
    if not Ext.Mod.IsModLoaded(uuid) then
      res = false
      table.insert(missingMods, uuid .. "_" .. CLUtils.RetrieveModHandleAndAuthor(uuid))
    end
  end

  return res, missingMods
end
