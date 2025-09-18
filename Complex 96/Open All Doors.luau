for _,v in workspace.Map.Map_Interactions:GetChildren() do
    game:GetService("ReplicatedStorage").EventStorage.Interaction:FireServer(v)
end;
