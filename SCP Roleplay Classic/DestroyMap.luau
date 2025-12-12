local weld_remote: RemoteEvent = cloneref(game:GetService("ReplicatedStorage").GunFE.WeldArm);
local players: Players = cloneref(game:GetService("Players"));
local player = players.LocalPlayer :: Player;
for _: unknown, Part: Instance in  (workspace:GetChildren()) do
    if Part:IsA("BasePart") then
        weld_remote:FireServer(Part, player.Character:FindFirstChildWhichIsA("Tool"));
    end;
end;