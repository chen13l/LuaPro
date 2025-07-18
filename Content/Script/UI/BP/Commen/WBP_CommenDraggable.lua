--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type WBP_CommenDraggable_C
local WBP_CommenDraggable = UnLua.Class()

--function WBP_CommenDraggable:Initialize(Initializer)
--end

--function WBP_CommenDraggable:PreConstruct(IsDesignTime)
--end

-- function WBP_CommenDraggable:Construct()
-- end

--function WBP_CommenDraggable:Tick(MyGeometry, InDeltaTime)
--end

function WBP_CommenDraggable:OnMouseButtonDown(myGeometry, mouseEvent)
    return UE.UWidgetBlueprintLibrary.DetectDragIfPressed(mouseEvent, self, UE.EKeys.LeftMouseButton)
end

function WBP_CommenDraggable:OnDragDetected(myGeometry,pointerEvent)
    return self:CustomCreateDDO(nil, "Lua.UI.Draggable", self, self.Image, nil, nil)
end

function WBP_CommenDraggable:OnDrop(myGeometry, pointerEvent, operation)
    if operation.Tag == "Lua.UI.Draggable" then
        self:SetIcon(operation.payload.Icon)
        operation.payload:SetIcon(nil)
        return true
    end
    return false
end

function WBP_CommenDraggable:CustomCreateDDO(class, tag, payload, defaultDragVisula, pivot, offset)
    -- local object = NewObject(UE.UDragDropOperation)
    local DDO = UE.UWidgetBlueprintLibrary.CreateDragDropOperation()
    
    DDO.Tag = tag or ""
    DDO.Payload = payload
    DDO.DefaultDragVisual = defaultDragVisula
    DDO.Pivot = pivot
    DDO.Offset = offset

    return DDO
end

return WBP_CommenDraggable
