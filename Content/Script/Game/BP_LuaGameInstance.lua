--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--
require('socket.core')
require("Debugger.LuaPanda").start("127.0.0.1", 8818)

---@type BP_LuaGameInstance_C
local M = UnLua.Class()

function M:ReceiveInit()
    local LuaChild = require("LuaClass.LuaChild").New()
    LuaChild:Func1()
end

return M