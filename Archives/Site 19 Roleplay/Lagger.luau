local LUA_GC = getgc(true);
local Network;
local newluaclosure = newlclosure;
for _,v in LUA_GC do
    if type(v) == "table" then
        if rawget(v, "InvokeServer") then
            Network = v;
        elseif rawget(v, "_discharge") then
            local hook; hook = hookfunction(rawget(v, "_discharge"), newluaclosure(function(gun_settings)
                print("ffffffffffffffff", Network.FireServer)
                Network:FireServer("setToolState", "Reload");
                Network:FireServer("setToolState", "Reloaded");
                gun_settings.Ammo = 999;
                hook(gun_settings);
            end));
        end;
    end;
end;
-- when my encryption sys so good the client can decode it
local decode_args;  decode_args = @native function(encoded: string, key: {number}, extra: number): string
    local decoded: string = "";
    local cut_off: number = #encoded;
    if not extra then
        cut_off = #encoded - key[5] ;
    end;
    for i = 1, cut_off do
        for mod = 0, 3 do
            if i % 4 == mod then
                local char: string = string.sub(encoded, i, i);
                local off_set: number = key[mod + 1];
                local code: number = string.byte(char) - 32;
                if extra then
                    off_set = -off_set;
                end;
                local original: number = (code - off_set) % 95 + 32;
                decoded = decoded .. string.char(original);
                break;
            end;
        end;
    end;
    return decoded;
end;
local lua_gc = getgc(true);
local FireServer;
for _,v in lua_gc do
    if type(v) == 'table' and rawget(v, "InvokeServer") and rawget(v, "FireServer") then
        FireServer = rawget(v, "FireServer")
        break;
    end;
end;
local up_values = debug.getupvalues(FireServer);
local net_encode = up_values[2];
local flux_encode;
local hook; hook = hookfunction(net_encode, newlclosure(function(...)
    local args = {...};
    if not flux_encode then
        -- warn("meow");
        flux_encode = args[2];
    end;
    return hook(...);
end));
repeat task.wait() until flux_encode;
local shoot_count = 400;
local hook; hook = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local Args: {any} = {...};
    local Self = Args[1];
    table.remove(Args, 1);
    if not checkcaller() and Self and typeof(Self) == "Instance" and getnamecallmethod() == "FireServer" or getnamecallmethod() == "InvokeServer" and Self.ClassName == "RemoteEvent" or Self.ClassName == "RemoteFunction" then
        local decoded_args = decode_args(Args[1], flux_encode, false);
        local remote_args = string.split(decoded_args, ",");
        if remote_args[3] == '"Discharge"' then
            for i = 1, shoot_count do
                hook(...);
            end;
        end;
    end;
    return hook(...);
end));
