@REM code started from here
@echo off
@color 70
@setlocal DisableDelayedExpansion
set appsbase=AppsDataBase\;%appsbase%
@title ConsolePassWD 1.0 -Console Password Manager

@REM setting configurations environment variables
set ScreenBufferSize=655294584
set fname=ConsolePassWD-1.0
set CursorColor=4294967295
set WindowSize=1966200
set FontWeight=1536
set WindowAlpha=221
set CursorSize=25
set CursorType=2
set WindowMode=2
set WinDefault=0
set endswith=cmd
set bg_color=7
set fg_color=0
set Restore=0
set filename=
set RunApp=1
set Update=0
set color=70
set cfgname=
set appname=
set State=1

@REM setting user settings environment variables
set login_name=
set login_pass=
set lockpass=
set opt_name=
set opt_pass=
set opt_keys=
set platform=
set username=
set pageurl=
set emailid=
set anumber=
set apasswd=
set passwd=
set number=
set uname=0
set upass=0
set adate=
set ukeys=
set name=0
set pass=0
set keys=0
set name=
set rnd=
set opt=

@REM setting other environment variables
set restore_bak=opdata
set backup=opdata
set errorcode=0
set Gplatform=
set Gusername=
set psCommand=
set Gpageurl=
set Gemailid=
set Ganumber=
set Gapasswd=
set gname=--
set gpass=--
set gkeys=--
set guest=G
set Gadate=

@REM add app started info in log.txt 
@REM create log file if not exists
if not exist AppsDataBase\log.txt (
   echo %date% ^|^|%time% : No logs saved before this time.>>AppsDataBase\log.txt
)
echo %date% ^|^|%time% : ConsolePassWD 1.0 was started.>>AppsDataBase\log.txt

@REM main user interface starts from here
:start_main
cls
echo ==============================================================================
echo.                   ConsolePassWD -Console Password Manager.
echo ==============================================================================
echo.
echo. ConsolePassWD 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. Starting ConsolePassWD ...
if exist temp.bat del temp.bat >nul
timeout /t 1 /nobreak >nul
echo. Checking AppsDataBase ...
if not exist AppsDataBase\7z.exe ( set errorcode=1 && goto check_error )
if not exist AppsDataBase\TE.exe ( set errorcode=2 && goto check_error )
echo. Loading configuration ...
if not exist AppsDataBase\cfg.ini (
   echo. Generating file "cfg.ini" ...
   set Update=1
   goto generate_cgf
) else (
   goto check_configuration
)

@REM read %errorcode% value to show error
:check_error
if %errorcode% == 1 (
   echo %date% ^|^|%time% : Error, 7z.exe  missing from AppsDataBase folder.>>AppsDataBase\log.txt
   cls
	echo ==============================================================================
   echo.                   ConsolePassWD -Console Password Manager.
   echo ==============================================================================
   echo.
   echo. ConsolePassWD 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. Error found, error code is 0x001
	echo. File missing from AppsDataBase folder [File name = 7z.exe].
	echo. Please reinstall ConsolePassWD on the same folder to fix this error.
	echo. ConsolePassWD cannot run without [7z.exe], press any key to exit app.
	pause >nul && exit
) else if %errorcode% == 2 (
   echo %date% ^|^|%time% : Error, Te.exe  missing from AppsDataBase folder.>>AppsDataBase\log.txt
	cls
	echo ==============================================================================
   echo.                   ConsolePassWD -Console Password Manager.
   echo ==============================================================================
   echo.
   echo. ConsolePassWD 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. Error found, error code is "0x002"
	echo. File missing from AppsDataBase folder [File name = Te.exe].
	echo. Please reinstall ConsolePassWD on the same folder to fix this error.
	echo. ConsolePassWD cannot run without [Te.exe], press any key to exit app.
	pause >nul && exit
) else if errorlevel == 3 (
   echo %date% ^|^|%time% : Error, Incorrect State value found in cfg.ini.>>AppsDataBase\log.txt
	cls
	echo ==============================================================================
   echo.                   ConsolePassWD -Console Password Manager.
   echo ==============================================================================
   echo.
   echo. ConsolePassWD 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. There is a mistake in configuration under [\ConsolePassWD\State\].
	echo. "State" value is invalid, you can manually set it to 1 or 2.
	echo. Else ConsolePassWD will automatically try to fix this error ...
	echo. Press any key to automatically fix this mistake ...
	pause >nul && goto generate_cgf
) else if %errorcode% == 4 (
   cls
	echo ==============================================================================
   echo.                   ConsolePassWD -Console Password Manager.
   echo ==============================================================================
   echo.
   echo. ConsolePassWD 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. Warning : critical error "0x004"
	echo. Cannot auto recover file ...
	echo.
	echo. Put backups file [*.backup] in current folder if you have.
	echo.
	echo. Steps for manual recovery :
	echo. Step 01 : Install ConsolePassWD 1.0 in another folder.
	echo. Step 02 : Create another account with same name and password.
	echo. Step 03 : Open AppsDataBase folder and locate file 71a.op in new one.
	echo. Step 04 : Copy file and paste it in old ConsolePassWD's AppsDataBase folder.
	echo. Step 05 : Run old ConsolePassWD app and you should be able to proceed.
	echo. Step 06 : Login with your name and password and it should look normal.
	echo.
	echo. If you don't remember you password then you cannot recover passwords.
	echo. Then only option will be to use backup if you have made earlier.
	echo.
	echo. Best of luck on getting your passwords back :^)
	echo. Be carefull next time. its not an app error,
	echo. 1 file was missing [71a.op] from AppsDataBase folder.
	echo. Press any key to try loading backup ...
	pause >nul
	goto restore_backup
) else if %errorcode% == 5 (
   cls
	echo ==============================================================================
   echo.                   ConsolePassWD -Console Password Manager.
   echo ==============================================================================
   echo.
   echo. ConsolePassWD 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. Warning : critical error "0x005"
	echo. Cannot auto recover file ... :^(
	echo.
	echo. Put backups file [*.backup] in current folder if you have.
	echo. If you dont have backup file then unfortunately you have lost it.
	echo.
	echo. [Notice : its not an app error, 1 file was missing
	echo.           [71b.op] from AppsDataBase folder.]
	echo.
	echo. Info : you were told the beginning to make backup and be carefull
	echo. about not getting any files deleted from AppsDataBase folder.
	echo. its not apps error so you cannot blame developer of this app
	echo. Please make sure you understand that.
	echo. Press any key to try loading backup ...
	pause >nul
	goto restore_backup
)
   goto check_user_state

@REM generate cfg.ini and change setting automatically if needed
:generate_cgf
if exist AppsDataBase\71a.op ( set state=2 )
if not exist AppsDataBase\71a.op ( set state=1 )
echo #=Press [Ctrl + X] then [N] to go back to ConsolePassWD from setting.  >AppsDataBase\cfg.ini
echo #=Press [Ctrl + X] then [Y] then [Enter] to save changes.              >>AppsDataBase\cfg.ini
echo #=Some changes only applies when you run ConsolePassWD next time.      >>AppsDataBase\cfg.ini
echo #=Change "Restore" value to 1 if you want to restore default settings. >>AppsDataBase\cfg.ini
echo #=Don't forget to change "Update" value at the end.                    >>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=[\ConsolePassWD\State\]                                              >AppsDataBase\cfg.ini
echo #=Valid value for "State" is 1 and 2, don't change manually.           >>AppsDataBase\cfg.ini
echo State=^%state%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=[\Window\Configuration\]                                             >>AppsDataBase\cfg.ini
echo #=Do not change ScreenBufferSize value for maximum password limit.     >>AppsDataBase\cfg.ini
echo ScreenBufferSize=^%ScreenBufferSize%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=CursorColor can be any RGB color code to decimal converted value.    >>AppsDataBase\cfg.ini
echo #=Red[255], Green[65280], Blue[16711680], Yellow[65535], Aqua[16776960]>>AppsDataBase\cfg.ini
echo #=White[16777215], Black[0], Orange{42495], Brown[7482] etc.           >>AppsDataBase\cfg.ini
echo CursorColor=^%CursorColor%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=WindowSize has many options, better not to change for best size.     >>AppsDataBase\cfg.ini
echo #=Instead you can change "WindowMode" to see which one you like.       >>AppsDataBase\cfg.ini
echo WindowSize=^%WindowSize%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=FontWeight can be minimum 256 to maximum 2304 [text thickness].      >>AppsDataBase\cfg.ini
echo FontWeight=^%FontWeight%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=WindowAlpha can be 170, 187, 204, 221, 238 and 255. [transparency]   >>AppsDataBase\cfg.ini
echo WindowAlpha=^%WindowAlpha%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=CursorSize can be minimum 25 to maximum 100. [cursor height]         >>AppsDataBase\cfg.ini
echo #=This doesn't work all "CursorType", doesn't work with default[2]     >>AppsDataBase\cfg.ini
echo CursorSize=^%CursorSize%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=CursorType can be minimum 0 to maximum 5. [cursors design]           >>AppsDataBase\cfg.ini
echo CursorType=^%CursorType%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=bg_color can range from 1-7 and A-F. [window background]             >>AppsDataBase\cfg.ini
echo bg_color=^%bg_color%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=fg_color can range from 1-7 and A-F. [Window text color]             >>AppsDataBase\cfg.ini
echo #=bg_color and fg_color cannot have same value.                        >>AppsDataBase\cfg.ini
echo fg_color=^%fg_color%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=WindowMode can have value 1-3. [Window mode/Window size]             >>AppsDataBase\cfg.ini
echo #=Value 1 and 3 will disable "WindowSize" and "ScreenBufferSize"       >>AppsDataBase\cfg.ini
echo WindowMode=^%WindowMode%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=WinDefault value must be 0 for all settings to work.                 >>AppsDataBase\cfg.ini
echo #=WinDefault value can be 0 or 1. [1 will disable other settings]      >>AppsDataBase\cfg.ini
echo WinDefault=^%WinDefault%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=[\Files\Name\State\]>>AppsDataBase\cfg.ini
echo #=fname means file name, it can be anything you want.                  >>AppsDataBase\cfg.ini
echo fname=%fname%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=endswith value can only be [cmd] or [bat], else file will not run.   >>AppsDataBase\cfg.ini
echo endswith=%endswith%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=[\Support\RunApp]>>AppsDataBase\cfg.ini
echo #=RunApp value must be higher then 1 for app to run.                   >>AppsDataBase\cfg.ini
echo RunApp=^%RunApp%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=[Update\Settings]>>AppsDataBase\cfg.ini
echo #=Set "Restore" value to 1 if you want to restore default settings.    >>AppsDataBase\cfg.ini
echo Restore=^%Restore%>>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=Set Update value to 1 everytime you change any settings.             >>AppsDataBase\cfg.ini
echo #=Else setting will not be updated, you can come back if you forget.   >>AppsDataBase\cfg.ini
echo Update=^%Update%>>AppsDataBase\cfg.ini
goto check_configuration

@REM check if there is any mistake in configuration
:check_configuration
for /f "delims=" %%L in ( AppsDataBase\cfg.ini ) do set %%L >nul
if %RunApp% LSS 1 ( echo %date% ^|^|%time% : App exited due to configuration.>>AppsDataBase\log.txt && exit )
if %bg_color% EQU %fg_color% (
	echo. bg and fg color cannot not be same ...
	timeout /t 1 >nul
	set bg_color=7 && set fg_color=0
	goto generate_cgf
)
if %endswith% NEQ cmd (
	if %endswith% NEQ bat (
		echo. Invalid "endswith" value ...
		timeout /t 1 >nul
		set endswith=cmd && goto generate_cgf
	)
)
if %WindowAlpha% NEQ 170 (
	if %WindowAlpha% NEQ 187 (
		if %WindowAlpha% NEQ 204 (
			if %WindowAlpha% NEQ 221 (
				if %WindowAlpha% NEQ 238 (
					if %WindowAlpha% NEQ 255 (
						echo Invalid "WindowAlpha" value ...
						timeout /t 1 >nul
						set WindowAlpha=221 && goto generate_cgf
					)
				)
			)
		)
	)
)
if %CursorType% GTR 5 (
	echo Invalid "CursorType" value ...
	timeout /t 1 >nul
	set CursorType=2 && goto generate_cgf
)
if %CursorSize% LSS 25 (
	if %CursorSize% GTR 100 (
		echo Invalid "CursorSize" value ...
		timeout /t 1 >nul
		set CursorSize=25 && goto generate_cgf
	)
)
goto load_configuration

@REM load configuration from AppsDataBase\cfg.ini
:load_configuration
set filename=%~nx0 && set cfgname=%fname%.%endswith%
set appname=%cfgname: =%
if %filename% NEQ %appname% goto change_filename
set string=%bg_color%%fg_color%
set color=%string: =%
@color %color%
if %Update% GTR 0 goto update_regestry
if %Update% LSS 1 goto check_user_state

@REM change main files name if needed due to cfg.ini
:change_filename
echo. Problem found, file name needs to be changed ...
echo. from %filename% to %appname% ...
echo. Press any key to change file name ...
pause >nul && cls
echo @echo off>temp.bat
echo @color 70>>temp.bat
echo @title Please wait ...>>temp.bat
echo @echo. Please wait a sec ...>>temp.bat
echo ren %filename% %appname%>>temp.bat
echo timeout /T 1 /nobreak ^>nul>>temp.bat
echo %appname%>>temp.bat
echo exit>>temp.bat
temp.bat

@REM update regestry if %Update% value is 1
:update_regestry
if %Restore% GTR 0 set Update=1 && goto restore_default
if %WindowMode% LSS 2 (
	set WindowSize=1966160 && set ScreenBufferSize=655294544
)
if %WindowMode% EQU 2 (
	set WindowMode=%WindowMode%
)
if %WindowMode% GEQ 3 (
	set WindowSize=2359431 && set ScreenBufferSize=589889671
)
REG DELETE HKEY_CURRENT_USER\Console /f /reg:32 >nul
REG ADD HKEY_CURRENT_USER\Console\ /v ScreenBufferSize /t REG_DWORD /d %ScreenBufferSize% /f /reg:32 >nul
REG ADD HKEY_CURRENT_USER\Console\ /v WindowAlpha /t REG_DWORD /d %WindowAlpha% /f /reg:32 >nul
REG ADD HKEY_CURRENT_USER\Console\ /v CursorColor /t REG_DWORD /d %CursorColor% /f /reg:32 >nul
REG ADD HKEY_CURRENT_USER\Console\ /v CursorType /t REG_DWORD /d %CursorType% /f /reg:32 >nul
REG ADD HKEY_CURRENT_USER\Console\ /v CursorSize /t REG_DWORD /d %CursorSize% /f /reg:32 >nul
REG ADD HKEY_CURRENT_USER\Console\ /v FontWeight /t REG_DWORD /d %FontWeight% /f /reg:32 >nul
REG ADD HKEY_CURRENT_USER\Console\ /v WindowSize /t REG_DWORD /d %WindowSize% /f /reg:32 >nul
for /f "delims=" %%L in ( AppsDataBase\cfg.ini ) do set %%L >nul
if %WinDefault% GTR 0 REG DELETE HKCU\Console /f /reg:32 >nul
set Update=0 && goto generate_cgf
echo %date% ^|^|%time% : Updated regestry keys successfully.>>AppsDataBase\log.txt
goto check_user_state

@REM set all configuration to app default if %Restore% value is 1
:restore_default
set State=1
set ScreenBufferSize=655294584
set CursorColor=4294967295
set WindowSize=1966200
set FontWeight=1536
set WindowAlpha=221
set CursorSize=25
set CursorType=2
set bg_color=7
set fg_color=0
set WindowMode=2
set WinDefault=0
set fname=ConsolePassWD-1.0
set endswith=cmd
set RunApp=1
set Restore=0
set Update=1
goto generate_cgf

@REM check %State% value to find if account exists
@REM if exists goto old user else goto new user
:check_user_state
echo. Incomplete code ...
echo. File will be updated soon ...
echo. Press any key to exit ...
pause >nul




