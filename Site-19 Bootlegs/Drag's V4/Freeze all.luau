local replicated_storage = cloneref(game:GetService("ReplicatedStorage"));
local remote = replicated_storage.AdminEvents.FreezeEvent;

for _,v in cloneref(game:GetService("Players")):GetPlayers() do
	remote:FireServer(tostring(v), true)
end;
