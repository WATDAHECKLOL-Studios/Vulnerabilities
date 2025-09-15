-- run infinite yield's freeze command then run this, then run iy reset command
local send_count = 999999;
local wait = task.wait;
for _,v in getgc(false) do
    if type(v) == "function" and debug.info(v, "n") == "_createBlood" then
        local hook; hook = hookfunction(v, newlclosure(function(...)
            for i = 1, send_count do
                wait();
                hook(...);
            end;
            return hook(...)
        end));
    end;
end;
