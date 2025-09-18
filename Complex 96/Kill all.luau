for _,v in game:GetService("Players"):GetPlayers() do
    workspace.GunHandler.DamageRemoteEvent:FireServer(v.Character.Humanoid, 100)
end;