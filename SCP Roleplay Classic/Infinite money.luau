local remote: RemoteEvent = cloneref(game:GetService("ReplicatedStorage").PurchaseItem);
local operand: number = (math.abs(90000)*-1);
remote:FireServer("Card-L5", operand, "Card-L5");
