local LuaParent = require("LuaClass.LuaClass")("LuaParent")

function LuaParent:__init()
    self.a = 1
    print("LuaParent initialized: " .. self.a)
end

function LuaParent:__delete()
    print("LuaParent deleted")
end

LuaParent.Func1 =  function ()
    print("LuaParent Func1 called")
end

return LuaParent