--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type WBP_MainOverlay_C
local M = UnLua.Class()

--function M:Initialize(Initializer)
--end

--function M:PreConstruct(IsDesignTime)
--end

function M:Construct()
    self.Button.OnClicked:Add(self,self.PrintMessage)
end

function M:PrintMessage()
    print("Button clicked!")
    self.TextBlock_Title:SetText("Button was clicked!");
end

--function M:Tick(MyGeometry, InDeltaTime)
--end

return M
