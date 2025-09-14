local replicated_storage = cloneref(game:GetService("ReplicatedStorage"));
local players = cloneref(game:GetService("Players"));

local player = players.LocalPlayer :: Player;
local event = replicated_storage.AdminEvents.RespawnEvent;

while true do 
    task.wait();
    event:FireServer(player);
end;
