

local WorldService = UnLua.Class();

function WorldService:LuaInit ()
    print("LuaWorldService initialized")
end

function WorldService:LuaDeInit ()
    print("LuaWorldService started")
end

function WorldService:LuaPostinit()
    print("LuaWorldService post-initialization") 
end

function WorldService:LuaOnWorldBeginPlay()
    print("LuaWorldService world begin play")

    local Path = '/Game/UI/BP/Login/WBP_LoginView.WBP_LoginView_C'
    local Widget  = self:GetUserWidgetByPath(Path)
    Widget:AddToViewport()
end

return WorldService;