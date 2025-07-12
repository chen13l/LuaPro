#pragma once

#include "CoreMinimal.h"
#include "UnLuaInterface.h"
#include "UnLuaEx.h"
#include "Subsystems/WorldSubsystem.h"
#include "LuaWorldService.generated.h"

class ULevelStreamingDynamic;

UCLASS()
class LUAFRAMEWORK_API ULuaWorldService : public UWorldSubsystem, public IUnLuaInterface
{
	GENERATED_BODY()

public:
	virtual FString GetModuleName_Implementation() const override
	{
		return "Plugins.LuaFramework.Service.LuaWorldService";
	};
	UFUNCTION(BlueprintImplementableEvent)
	void LuaInit();
	UFUNCTION(BlueprintImplementableEvent)
	void LuaDeinit();
	UFUNCTION(BlueprintImplementableEvent)
	void LuaPostInit();
	UFUNCTION(BlueprintImplementableEvent)
	void LuaOnWorldBeginPlay();

	virtual bool ShouldCreateSubsystem(UObject* Outer) const override;
	virtual void Initialize(FSubsystemCollectionBase& Collection) override;
	virtual void PostInitialize() override;
	virtual void OnWorldBeginPlay(UWorld& InWorld) override;
	virtual void Deinitialize() override;

	UFUNCTION()
	UUserWidget* GetUserWidgetByPath(FString Path);

	/*UFUNCTION()
	ULevelStreamingDynamic* LoadLevelByPath(FString Path, FVector Pos, FRotator Rptator);*/
};
