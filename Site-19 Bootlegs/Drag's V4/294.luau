for _,v in cloneref(game:GetService("Players")):GetPlayers() do
	game:GetService("ReplicatedStorage")["Atlas/Replicated"].Functions.SCPs.Enable294:FireServer(v);
end;
