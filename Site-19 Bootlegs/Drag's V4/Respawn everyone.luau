local replicated_storage = cloneref(game:GetService("ReplicatedStorage"));
local players = cloneref(game:GetService("Players"));

local player = players.LocalPlayer :: Player;
local event = replicated_storage.AdminEvents.RespawnEvent;

for _,v in players:GetPlayers() do
	if v == player then continue; end;
	event:FireServer(v);
end;
