local replicated_storage = cloneref(game:GetService("ReplicatedStorage"));
local remote = replicated_storage.AdminEvent;
remote:FireServer("SetTK", tostring(game.Players.LocalPlayer), 3);
