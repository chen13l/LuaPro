--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type WBP_CommenButtonText_C
local M = UnLua.Class()

--function M:Initialize(Initializer)
--end

--function M:PreConstruct(IsDesignTime)
--end

 function M:Construct()
    self.Button.OnClicked:Add(self,self.OnBtnClicked)
 end

 function M:OnListItemObjectSet(Obj)
    self._data = Obj;
    self.TextBlock:SetText(Obj.Name);

    local ObjClass = UE.LoadObject('/Game/Assets/UI/Icon/Star.Star');
    if Obj.IconPath then
        local IconTexture = UE.LoadObject(Obj.IconPath);
        self.Image:SetBrushFromTexture(IconTexture);
    end

    self._binObj  = Obj.BinObj;
    self._binParam = Obj.Param or {};
    self._callBack = Obj.Func;
 end
--function M:Tick(MyGeometry, InDeltaTime)
--end

function M:OnBtnClicked()
    if self._callBack then
        self._callBack( self._binObj,self._binParam)
    end
end

return M
