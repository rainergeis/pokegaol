@echo off

set nonet=0

where dotnet.exe >nul 2>nul
IF ERRORLEVEL 1 (
	set nonet=1
)

IF %nonet%==0 (
	dotnet --list-runtimes | findstr /I /c:"Microsoft.WindowsDesktop.App 6.0" > nul
	IF ERRORLEVEL 1 (
		set nonet=1
	)
)

IF %nonet%==1 (
	echo This tool requires an additional download:
	echo:
	echo .NET Core 6 Desktop Runtime
	echo:
	echo Please download it from the following link:
	echo:
	echo https://aka.ms/dotnet-core-applaunch?framework=Microsoft.WindowsDesktop.App^&framework_version=6.0.0
	echo:
	echo A browser window will now try to open with the download page.
	pause
	start "" https://aka.ms/dotnet-core-applaunch?framework=Microsoft.WindowsDesktop.App^&framework_version=6.0.0
	exit
)

.\menu\deploy\Gideon.exe --user --project "%*"