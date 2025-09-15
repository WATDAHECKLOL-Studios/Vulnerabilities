--[[local env;
for _,v in getgc(false) do
    if type(v) == "function" and islclosure(v) and debug.info(v, "n") == "SendSignalE" then
        env = getfenv(v);
        break;
    end;
end;
task.spawn(function()
    while true do
        task.wait();
        local code = rawget(env, "SelectedCode");
        if code then
            table.insert(security_codes, code);
        end;
    end;
end);]]
local security_codes = {};
local replicated_storage = cloneref(game:GetService("ReplicatedStorage")) :: ReplicatedStorage;
local door_remote: RemoteEvent = replicated_storage.DoorUniversalEvent;
local doors = {};
for _,v in workspace:GetDescendants() do
    if v:FindFirstChild("DoorEvent") then
        table.insert(doors, v.Parent);
    end;
end;
for _,v in getconnections(door_remote.OnClientEvent) do
    local func = v.Function;
    if isfunctionhooked(func) then restorefunction(func); end;
    
    local hook; hook = hookfunction(func, newlclosure(@native function(action: string, ...: any)
        local args: {[number]: any} = {...};
        if action == "MOUSEHOVER_1" then
            local door_object: any = args[1];
            local security_code: number = args[2];
            
            warn("mmmmm yummy snack! :3", security_code);
            security_codes[door_object.Parent] = security_code;
        end;
        return hook(action, ...);
    end));
    break;
end;
for _,v in doors do
    for _,v: ClickDetector in v:GetDescendants() do
        if v:IsA("ClickDetector") then
            --replicatesignal(v.MouseHoverEnter, v); -- replicate signal god.
            fireclickdetector(v, 50, "MouseHoverEnter");
        end;
    end;
end;
task.wait(2);

-- this is where the fun begins >:3
while true do
for _,v in doors do
        if security_codes[v] then
            v.Configuration.DoorEvent:FireServer("Interacted", security_codes[v]);
            task.wait(0.04); -- udmux be like
        end;    
    end;
end;
