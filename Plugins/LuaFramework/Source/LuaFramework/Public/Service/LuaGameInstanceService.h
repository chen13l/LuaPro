#pragma once

#include "CoreMinimal.h"
#include "UnLuaInterface.h"
#include "UnLuaEx.h"
#include "Subsystems/GameInstanceSubsystem.h"
#include "LuaGameInstanceService.generated.h"

UCLASS()
class LUAFRAMEWORK_API ULuaGameInstanceService : public UGameInstanceSubsystem, public IUnLuaInterface
{
	GENERATED_BODY()

public:
	virtual FString GetModuleName_Implementation() const override
	{
		return "Plugins.LuaFramework.Service.LuaGameInstanceService";
	};
	UFUNCTION(BlueprintImplementableEvent)
	void LuaInit();
	UFUNCTION(BlueprintImplementableEvent)
	void LuaDeinit();

	virtual bool ShouldCreateSubsystem(UObject* Outer) const override;
	virtual void Initialize(FSubsystemCollectionBase& Collection) override;
	virtual void Deinitialize() override;

	template <typename... T>
	void NotifyEventToLua(const char* EventName, T&&... Args)
	{
		FString EventNameStr(EventName);

		lua_State* L = UnLua::GetState();
		if (L)
		{
			const UnLua::FLuaRetValues LuaRetValue = UnLua::Call(L, "ReceiveNotifyFromC",TCHAR_TO_ANSI(*EventNameStr), Forward<T>(Args)...);
		}
	};
};
