local LuaParent = require("LuaClass.LuaParent")
local LuaChild = require("LuaClass.LuaClass")("LuaChild",LuaParent)

function LuaChild:__init()
    print("LuaChild initialized: " .. self.a)
end

function LuaChild:__delete()
    print("LuaChild deleted")
end

function LuaChild:Func1()
    print("LuaChild Func1 Called")
end

return LuaChild