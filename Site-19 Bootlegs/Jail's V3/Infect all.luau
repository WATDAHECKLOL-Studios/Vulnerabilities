local syn = {};
local scall = @native function(func: (...any) -> (...any), env: {[string]: any}, ...: any): any
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
syn.secure_call = scall;
local env;
for _,v in getscripts() do
	local _: unknown, fenv: {[string]: any} = pcall(@native function(...) 
		return getsenv(v);	
	end);
	if type(v) == "table" then env = fenv; break; end;
end;
local replicated_storage = cloneref(game:GetService("ReplicatedStorage"));
local atlas = syn.secure_call(require, env, replicated_storage.Atlas);
local event = syn.secure_call(rawget(atlas, "GetObject"), env, atlas, "008Remote");
for _,v in cloneref(game:GetService("Players")):GetPlayers() do
	event:FireServer(v);
end;
