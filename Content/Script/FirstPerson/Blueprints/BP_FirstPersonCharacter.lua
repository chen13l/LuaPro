--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_FirstPersonCharacter_C
local BP_FirstPersonCharacter = UnLua.Class()

function BP_FirstPersonCharacter:ReceivePossessed(newController)
    if newController:IsPlayerController() then
        local playerController = newController:Cast(UE.APlayerController)
        if UE.UGameplayStatics.GetPlatformName() == "Windows" or UE.UGameplayStatics.GetPlatformName() == "Default" then
            local subsystem = UE.USubsystemBlueprintLibrary.GetLocalPlayerSubSystemFromPlayerController(playerController,UE.UEnhancedInputLocalPlayerSubsystem)
            if UE.UKismetSystemLibrary.IsValid(subsystem) then 
                local mappingContextPath = "/Game/Input/IMC_MouseLook.IMC_MouseLook"
                local mappingContext = UE.UObject.Load(mappingContextPath)
                if mappingContext ~= nil then
                    subsystem:AddMappingContext(mappingContext,0,UE.FModifyContextOptions())
                end
            end
        end
    end
end

function BP_FirstPersonCharacter:Move(horizon,vertical)
    local rightDirection = self:GetActorRightVector()
    self:AddMovementInput(rightDirection,horizon)
    local forwardDirection = self:GetActorForwardVector()
    self:AddMovementInput(forwardDirection,vertical)
end

function BP_FirstPersonCharacter:Look(yaw,pitch)
    self:AddControllerYawInput(yaw)
    self:AddControllerPitchInput(pitch)
end

local BindAction = UnLua.Enhancedinput.BindAction

local IA_Jump = "/Game/Input/Actions/IA_Jump.IA_Jump"
BindAction(BP_FirstPersonCharacter,IA_Jump,"Started",function (self,ActionValue,ElapsedSeconds,TriggeredSecongds,InputAction)
    self:Jump()
end)
BindAction(BP_FirstPersonCharacter,IA_Jump,"Completed",function (self,ActionValue,ElapsedSeconds,TriggeredSecongds,InputAction)
    self:StopJumping()
end)

local IA_Move = "/Game/Input/Actions/IA_Move.IA_Move"
BindAction(BP_FirstPersonCharacter,IA_Move,"Triggered",function (self,ActionValue,ElapsedSeconds,TriggeredSecongds,InputAction)
    self:Move(ActionValue.X,ActionValue.Y)
end)

local IA_Look = "/Game/Input/Actions/IA_Look.IA_Look"
local IA_MouseLook = "/Game/Input/Actions/IA_MouseLook.IA_MouseLook"
BindAction(BP_FirstPersonCharacter,IA_Look,"Triggered",function (self,ActionValue,ElapsedSeconds,TriggeredSecongds,InputAction)
    self:Look(ActionValue.X,ActionValue.Y)
end)
BindAction(BP_FirstPersonCharacter,IA_MouseLook,"Triggered",function (self,ActionValue,ElapsedSeconds,TriggeredSecongds,InputAction)
    self:Look(ActionValue.X,ActionValue.Y)
end)

-- function BP_FirstPersonCharacter:Initialize(Initializer)
-- end

-- function BP_FirstPersonCharacter:UserConstructionScript()
-- end

-- function BP_FirstPersonCharacter:ReceiveBeginPlay()
-- end

-- function BP_FirstPersonCharacter:ReceiveEndPlay()
-- end

-- function BP_FirstPersonCharacter:ReceiveTick(DeltaSeconds)
-- end

-- function BP_FirstPersonCharacter:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
-- end

-- function BP_FirstPersonCharacter:ReceiveActorBeginOverlap(OtherActor)
-- end

-- function BP_FirstPersonCharacter:ReceiveActorEndOverlap(OtherActor)
-- end

return BP_FirstPersonCharacter
