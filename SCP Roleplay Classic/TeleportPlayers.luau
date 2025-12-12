local weld_remote: RemoteEvent = cloneref(game:GetService("ReplicatedStorage").GunFE.WeldArm);
local players: Players = cloneref(game:GetService("Players"));
local player = players.LocalPlayer :: Player;
for _: unknown, plr: Player in  (players:GetPlayers()) do
    if (not plr.Character) then
        continue;
    end;
    weld_remote:FireServer(plr.Character.HumanoidRootPart, player.Character:FindFirstChildWhichIsA("Tool"));
end;