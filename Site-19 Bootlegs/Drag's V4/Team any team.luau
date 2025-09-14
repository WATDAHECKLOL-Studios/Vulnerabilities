local replicated_storage = cloneref(game:GetService("ReplicatedStorage"));
local remote = replicated_storage.AdminEvent;
remote:FireServer("setTeam", tostring(game.Players.LocalPlayer), "MTF Alpha-1");
