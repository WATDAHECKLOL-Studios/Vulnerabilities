local FireServer;
for _,v in getgc(false) do
    if type(v) == "function" and islclosure(v) and getfunctionhash(v) == "5a5a140321015b7965a7cf1e2f86e3472a226dd6b59c1f73e7248a062523059333c221f0a25e43bb157fa1acc82effc7" then
        FireServer = v;
        break;
    end;
end;
local Players = cloneref(game:GetService("Players"));
local Player = Players.LocalPlayer;

for _,v in Players:GetPlayers() do
    FireServer({}, "DischargeGun", Player.Character:FindFirstChildOfClass("Tool"), "Discharge", v.Character.Head.Position, v.Character.Head.Position, math.huge, v.Character.Head.Position, {
        Normal = Vector3.new(0, 0, 0);
        Instance = v.Character.Head;
        Position = v.Character.Head.Position;
    });
end;
