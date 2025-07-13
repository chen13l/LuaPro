

local GameInstanceService = UnLua.Class();

function GameInstanceService:LuaInit ()
    print("LuaGameInstanceService initialized")
end

function GameInstanceService:LuaDeInit ()
    print("LuaGameInstanceService deinitialized")
end

function _G.ReceiveNotifyFromC ()
    print("ReceiveNotifyFromC called")
    -- EventSys:Dispatch(eventname,...);
end

return GameInstanceService;