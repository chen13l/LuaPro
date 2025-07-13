

local UIManager = UnLua.Class();

local LevelUIMap = {
    MainMap = {
        {
            Name = "LoginView",
            Path = '/Game/UI/BP/Login/WBP_LoginView.WBP_LoginView_C'
        }
    },
    DemoMap1 = {
        {
            Name = "DemoView",
            Path = '/Game/UI/BP/Demo/WBP_DemoView.WBP_DemoView_C'
        }
    }
}

function UIManager:LuaInit ()
    print("UIManager initialized")
    self._WidgetMap = {}
end

function UIManager:LuaPostinit()
    print("UIManager post-initialization")    
end

function UIManager:LuaOnWorldBeginPlay(InWorld)
    print("UIManager world begin play")

    local WorldName = UE.UKismetSystemLibrary.GetObjectName(InWorld)

    -- if WorldName == "MainMap" then
    --     local Path = '/Game/UI/BP/Login/WBP_LoginView.WBP_LoginView_C'
    --     self:OpenWidgetByPath(Path,"LoginView")
    -- end

    if LevelUIMap[WorldName] then
        for Key, Value in pairs(LevelUIMap[WorldName]) do
            self:OpenWidgetByPath(Value.Path, Value.Name)
        end
    end
end

function UIManager:LuaDeInit ()
    self:RemoveAllWidget();
    print("UIManager deinitialized")
end

function UIManager:OpenWidgetByPath(Path,Name)
    if self._WidgetMap[Name] then
        print("Widget already exists: " .. Name)
    else
        local Widget = LuaWorldService:GetUserWidgetByPath(Path);
        Widget:AddToViewport();
        self._WidgetMap[Name] = Widget
    end

    return self._WidgetMap[Name]
end
function UIManager:RemoveWidgetByName(Name)
    if self._WidgetMap[Name] then
        self._WidgetMap[Name]:RemoveFromViewport()
        self._WidgetMap[Name] = nil
    end
end

function UIManager:RemoveAllWidget()
    for Name, Widget in pairs(self._WidgetMap) do
        self:RemoveWidgetByName(Name)
    end
end

return UIManager;