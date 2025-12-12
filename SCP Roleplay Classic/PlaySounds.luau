local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local SoundPlay: RemoteEvent = ReplicatedStorage.GunFE.SoundPlay;


local Players = cloneref(game:GetService("Players"));
local Player = cloneref(Players.LocalPlayer);

local Bleh = workspace.Lockdown_Measures.Alerts.Nuke_Announce;
SoundPlay:FireServer(Bleh, Player.Character:FindFirstChildWhichIsA("Tool"));