local ohTable1 = {
    ["Type"] = "Tool",
    ["Name"] = "COMBATIVE MEDKIT",
    ["Cost"] = 20,
    ["Tool"] = game:GetService("ReplicatedStorage").CreditsTools["[C] Healing Kit"],
    ["Description"] = "ONE LIFE ITEM"
};
for _,v in workspace:GetDescendants() do
    ohTable1.Cost = 0;
    ohTable1.Tool = v;
    game:GetService("ReplicatedStorage").EventStorage.CreditsEvent:FireServer(ohTable1);
    task.wait(0.05);
end;