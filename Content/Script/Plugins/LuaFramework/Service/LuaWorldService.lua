

local LuaWorldService = UnLua.Class();

function LuaWorldService:LuaInit ()
    print("LuaWorldService initialized")

    UIManager:LuaInit();
    _G.LuaWorldService = self;
    self._NewWorldName = nil;
end

function LuaWorldService:LuaPostinit()
    print("LuaWorldService post-initialization") 
    UIManager:LuaPostinit();
end

function LuaWorldService:LuaDeInit ()
    print("LuaWorldService deinitialized")
    UIManager:LuaDeInit();
end

function LuaWorldService:LuaOnWorldBeginPlay(InWorld)
    print("LuaWorldService world begin play")

    UIManager:LuaOnWorldBeginPlay(InWorld);
end

function LuaWorldService:LuaOpenLevel(InWorldName)
    self._NewWorldName = InWorldName;
    UE.UKismetSystemLibrary.K2_SetTimerDelegate({self,self.LuaOpenLevelInner},0.5,false);
end

function LuaWorldService:LuaOpenLevelInner()
    if self._NewWorldName then
        UE.UGameplayStatics.OpenLevel(self, self._NewWorldName);
    end
end

return LuaWorldService;