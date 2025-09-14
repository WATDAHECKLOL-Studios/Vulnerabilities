for _,v in workspace.Interact:GetChildren() do
	game:GetService("ReplicatedStorage")["Atlas/Replicated"].Functions.Player.Interaction.InteractionFE:FireServer(v)
end;
