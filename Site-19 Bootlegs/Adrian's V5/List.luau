-- 1. Open all doors
local Event = game:GetService("ReplicatedStorage")["Flux/Events"].Interaction.InteractionFE;
for _,v in (workspace.Interact:GetChildren()) do
    Event:FireServer(v);
end;
-- 2. Server Crasher
local replicated_storage = cloneref(game:GetService("ReplicatedStorage"));
local event = replicated_storage.Events.TeamChangerFE;
local wait = task.wait;
local teams = cloneref(game:GetService("Teams"));
while (true) do
    wait(0.05);
    for i = 1, 7 do
         event:FireServer(teams["Security Department"]);
    end;
end;


-- 3. Kill all
local event = cloneref(game:GetService("ReplicatedStorage")).DamageEvent;
local players = cloneref(game:GetService("Players"));
local player = players.LocalPlayer;
for _,v in (players:GetPlayers()) do
    if (v == player or not v.Character or not v.Character:FindFirstChild("Humanoid")) then continue; end;
    event:FireServer(v.Character.Humanoid);
end;

