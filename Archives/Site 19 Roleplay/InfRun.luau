local Players = game:GetService("Players");
local Player = Players.LocalPlayer;
local do_stuff; do_stuff = function(): ()
    for _,v in getgc(true) do
    if type(v) == "table" and rawget(v, "Sprint") and type(rawget(v, "Sprint")) == "number" then
        v.Sprint = math.huge;
        end;
    end;
end;
do_stuff();
Player.Character:Connect(function(): ()
    do_stuff();
end);
