#include "Service/LuaWorldService.h"

#include "Blueprint/UserWidget.h"


bool ULuaWorldService::ShouldCreateSubsystem(UObject* Outer) const
{
	return true;
}

void ULuaWorldService::Initialize(FSubsystemCollectionBase& Collection)
{
	Super::Initialize(Collection);

	LuaInit();
}

void ULuaWorldService::PostInitialize()
{
	Super::PostInitialize();

	LuaPostInit();
}

void ULuaWorldService::OnWorldBeginPlay(UWorld& InWorld)
{
	Super::OnWorldBeginPlay(InWorld);

	LuaOnWorldBeginPlay();
}


void ULuaWorldService::Deinitialize()
{
	LuaDeinit();

	Super::Deinitialize();
}

UUserWidget* ULuaWorldService::GetUserWidgetByPath(FString Path)
{
	UClass* WidgetClass = LoadObject<UClass>(nullptr, *Path);
	if (WidgetClass)
	{
		UUserWidget* Widget = CreateWidget(GetWorld(), WidgetClass);
		return Widget;
	}
	return nullptr;
}

/*ULevelStreamingDynamic* ULuaWorldService::LoadLevelByPath(FString Path, FVector Pos, FRotator Rptator)
{
}*/
