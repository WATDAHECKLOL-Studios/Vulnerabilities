--!nocheck
--!native
if getgenv().yesloaded  then return; end;
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua", true))();

local fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))();
local savemanager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))();

local interfacemanager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))();
getgenv().yesloaded = true;

local window = fluent:CreateWindow({
	Title = "AB2 Sex Hub V1";
	SubTitle = "by WATDAHECKLOL Softworks",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.LeftControl
})
local Tabs = {
	Main = window:AddTab({Title = "Main", Icon = ""});
};

fluent:Notify({
	Title = "Notifcation";
	Content = "Sex has loaded.";
	Duration = 5;
})

local options = fluent.Options;
local toggle = Tabs.Main:AddToggle("KillAll", {Title = "Kill all", Default = false});

local kill_all: boolean = false;
toggle:OnChanged(function()
	kill_all = options.KillAll.Value;
end);

local wait = task.wait;
local players: Players = cloneref(game:GetService("Players"));

local player = players.LocalPlayer :: Player;
local replicated_storage: ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"));

local bullet_remote = replicated_storage.Remotes.ShootBullet;
local pick_up: RemoteFunction = replicated_storage.Remotes.PickupItem;

local drop: RemoteFunction = replicated_storage.Remotes.DropItem
local drop_item = @native function(): ()
	for i = 1, 20 do
		pcall(@native function() drop:InvokeServer(i); end);
	end;

	return;
end;

Tabs.Main:AddButton({
	Title = "Destroy game";
	Description = "Literally destroys the entire game. (must be spawned)";
	Callback = @native function(): ()
		window:Dialog({
			Title = "Are you sure?";
			Content = "This action is irreversable";
			Buttons = {
				{
					Title = "Confirm";
					Callback = @native function()
						for _,v in game:GetDescendants() do
							if (v:IsA("RemoteEvent") or v:IsA("Remotefunction")) then
								pcall(@native function()
									pick_up:InvokeServer(v);
									drop_item();
								end);
							end;
						end;
					end,
				};
				{
					Title = "Cancel";
					Callback = @native function(): ()
						return;
					end,
				}
			}

		});
		return;
	end,
});

Tabs.Main:AddButton({
	Title = "Prevent joins (must be spawned)";
	Description = "Prevents new players from joining";
	Callback = @native function(): ()
		pick_up:InvokeServer(workspace.Configuration);
		return;
	end,
});

Tabs.Main:AddButton({
	Title = "Remove adonis (must be spawned)";
	Description = "Disable adonis";
	Callback = @native function(): ()
		for _: unknown, v: Instance in replicated_storage:GetChildren() do
			if (not string.find(string.lower(tostring(v)), "-") or not v:IsA("RemoteEvent")) then continue; end;
			pick_up:InvokeServer(v);
		end;
		return;
	end,
});
Tabs.Main:AddButton({
	Title = "Kick all players";
	Description = "Kick all the players in the game. (must be spawned)";
	Callback = @native function(): ()
		window:Dialog({
			Title = "Are you sure?";
			Content = "This action is irreversable";
			Buttons = {
				{
					Title = "Confirm";
					Callback = @native function()
						for i: number = 1, 20 do
							for _: unknown, v: Player in players:GetPlayers() do
								if (v == player) then continue; end;
								pcall(@native function()
									pick_up:InvokeServer(v);
									drop_item();
								end);
							end;
						end;
					end,
				};
				{
					Title = "Cancel";
					Callback = @native function(): ()
						return;
					end,
				}
			}

		});
		return;
	end,
});
local kill_all_func = @native function(): ()
	for _: unknown, v: Player in players:GetPlayers() do
		if (not v.Character or not v.Character:FindFirstChild("Head")) then continue; end;
		bullet_remote:FireServer(
			2,
			{
				{
					v.Character.Head;
					v.Character.Head.Position;
					true,
					1
				}
			},
			v.Character.Head.Position
		);
	end;

	return;
end;
while true do
	if (kill_all) then
		kill_all_func();
	end;
	wait(0.06);
end;
