local syn_secure_call = @native function(func: (...any) -> (...any), env: {[string]: any}, ...: any): any
	local results: {} = {};
	local args = {...};
	coroutine.wrap(@native function(_: unknown) 
		setthreadidentity(2);
		local handler = @native function(...: any)
			return func(...);
		end;
		setfenv(handler, env);
		results = {handler(table.unpack(args))};		
	end)();
	return table.unpack(results);
end;
local random_env;
local replicated_storage = cloneref(game:GetService("ReplicatedStorage"));
for _,v in getscripts() do
	local _: unknown, env: any = pcall(@native function(...: any) 
		return getsenv(v);
	end);
	if type(env) == "table" then random_env = env; break; end;
end;
local atlas = syn_secure_call(require, random_env, replicated_storage.Atlas);
local event = syn_secure_call(rawget(atlas, "GetObject"), random_env, atlas, "CITeamEvent", nil);

event:FireServer()
