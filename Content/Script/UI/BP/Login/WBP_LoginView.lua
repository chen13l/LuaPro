--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

local LoginData = {
    [1] = {
        Name = "新游戏",
        Index = 1,
        IconPath = '/Game/Assets/UI/Icon/Star.Star'
    },
    [2] = {
        Name = "继续游戏",
        Index = 2,
        IconPath = '/Game/Assets/UI/Icon/Star.Star'
    },
    [3] = {
        Name = "设置",
        Index = 3,
        IconPath = '/Game/Assets/UI/Icon/Star.Star'
    },
    [4] = {
        Name = "退出游戏",
        Index = 4,
        IconPath = '/Game/Assets/UI/Icon/Star.Star'
    }
}

---@type WBP_LoginView_C
local M = UnLua.Class()

--function M:Initialize(Initializer)
--end

--function M:PreConstruct(IsDesignTime)
--end

function M:Construct()
    --创建数据
    for i=1, #LoginData do
        local ObjClass = UE.LoadObject('/Game/UI/BP/Obj/BP_ItemData.BP_ItemData_C');
        local Obj = NewObject(ObjClass);
        Obj.Name = LoginData[i].Name;
        Obj.Func = self.HandleItemClicked;
        Obj.BinObj = self;
        Obj.Param = LoginData[i].Index;
        Obj.IconPath = LoginData[i].IconPath;
        
        self.ListView:AddItem(Obj);
    end
end

--function M:Tick(MyGeometry, InDeltaTime)
--end

function M:HandleItemClicked(Index)
    if Index <= #LoginData then 
        print(LoginData[Index].Name .. " clicked")

        if Index == 1 then 
            UE.UGameplayStatics.OpenLevel(self, "DemoMap1");
        else 
            UIManager:RemoveWidgetByName("LoginView");
        end
    end
end

return M
