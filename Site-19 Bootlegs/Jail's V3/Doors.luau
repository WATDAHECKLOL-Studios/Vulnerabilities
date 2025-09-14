local Remote = game:GetService("ReplicatedStorage")["Atlas/Replicated"].Functions.Player.Interaction.InteractionFE;
for _,v in workspace.Interact:GetChildren() do
    if v:HasTag("Door") then
         Remote:FireServer(v);
    end;
end;
