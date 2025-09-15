local syn_secure_call = @native function(func: (...any) -> (...any), target_script: BaseScript?, ...: any): any
	assert(func and typeof(func) == "function", `invalid argument #1 to 'secure_call' (function expected, got {typeof(func)})`);
	local env;
	if not target_script then
		for _,v in getscripts() do
			local _: unknown, value = pcall(@native function(...) 
				return getsenv(value);
			end);
			if type(value) == "table" then env = value; break; end;
		end;
	end;
	local results: {} = {};
	local args: {[any]: any} = {...};
	local _: unknown, value: {[string]: any} = pcall(@native function(...): ()
		return getsenv(target_script);
	end);
	env = value;
	if type(env) ~= "table" then env = getfenv(func); end;
	coroutine.wrap(@native function(_: unknown) 
		setthreadidentity(2);
		local handler = @native function(...: any)
			return func(...);
		end;
		setfenv(handler, env);
		results = {handler(table.unpack(args))} :: {[any]: any};		
	end)();
	return table.unpack(results);
end;
local replicated_storage = cloneref(game:GetService("ReplicatedStorage"));
local atlas = syn_secure_call(require, nil, replicated_storage.Atlas);
local event = syn_secure_call(rawget(atlas, "GetObject"), replicated_storage.Atlas, atlas, "AdminAction");
for _,v in cloneref(game:GetService("Players")):GetPlayers() do
	event:FireServer("SetTeam", v, "MTF Alpha-1");
end;
