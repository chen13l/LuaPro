

local GameInstanceService = UnLua.Class();

local UIManager = require("Service.UIManager");
function GameInstanceService:LuaInit ()
    print("LuaGameInstanceService initialized")
    _G.GameInstanceService = self;
    _G.UIManager = UIManager
end

function GameInstanceService:LuaDeInit ()
    print("LuaGameInstanceService deinitialized")
end

function _G.ReceiveNotifyFromC ()
    print("ReceiveNotifyFromC called")
    -- EventSys:Dispatch(eventname,...);
end

return GameInstanceService;