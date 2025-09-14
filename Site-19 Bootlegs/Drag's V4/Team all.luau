local replicated_storage = cloneref(game:GetService("ReplicatedStorage"));
local remote = replicated_storage.AdminEvent;
for _,v in cloneref(game:GetService('Players')):GetPlayers() do
	remote:FireServer("setTeam", tostring(v), "MTF Alpha-1");
end;
