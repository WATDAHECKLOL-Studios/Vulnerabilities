loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Adonis-actul-bypass-20697"))()
task.wait(1);
for _,v in getgc(false) do
	if type(v) == "function" and islclosure(v) and getfunctionhash(v) == "C2F145740ACC2023BC19919605F97D3E54AA381DFEF4A995B6E25D750B32CB5A5842D0B6A1612AFE4CC112C9CD0FC95A" then
		hookfunction(v, newlclosure(function(operand: any): boolean
			return false;
		end));
	end;
end;
local players = game:GetService("Players");
local player = players.LocalPlayer :: Player;
local namecall; namecall = hookmetamethod(game, "__namecall", newcclosure(@native function(...)
	if getthreadidentity() ~= 2 then return namecall(...); end;
	local args = {...};
	local self = args[1];
	local method = string.lower(getnamecallmethod());
	if self and type(self) == "userdata" and typeof(self) == "Instance" and self == player and method == "kick" then return; end;
	return namecall(...);
end));
local kick; kick = hookfunction(player.Kick, newcclosure(@native function(...)
	if getthreadidentity() ~= 2 then return kick(...); end;
	local self: Player, reason: string? = ...;
	if self and type(self) == "userdata" and typeof(self) == "Instance" and self == player then return; end;
	return kick(...);
end));

