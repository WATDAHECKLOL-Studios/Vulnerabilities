-- Re-Release, see the short inner workings of the vulnerability that managed to kill SCP AL2! almost 3 months later.
local replicated_storage = cloneref(game:GetService("ReplicatedStorage")) :: ReplicatedStorage;
local Event: RemoteFunction = replicated_storage.Remotes.PickupItem;
local drop: RemoteFunction = replicated_storage.Remotes.DropItem;
local players = cloneref(game:GetService("Players")) :: Players;
local drop_item = function(): ()
    for i: number = 1, 20 do
        pcall(function() drop:InvokeServer(i); end);
    end;
end;
for _: unknown, v: Player in players:GetPlayers() do
    if v == players.LocalPlayer then continue; end;
    pcall(function()
        Event:InvokeServer(v);
        drop_item();
    end);
end;
