@REM code started from here
@echo off
@color 07
@Title aConsolePassX 1.0 -Console Password Manager
Set "Path=%Path%;%cd%;%cd%\AppsDataBase"
Batbox /h 0

@REM setting configurations environment variables
set ScreenBufferSize=655294584
set fname=aConsolePassX-1.0
set CursorColor=4294967295
set WindowSize=1966200
set FontWeight=1536
set WindowAlpha=221
set CursorSize=25
set CursorType=2
set WindowMode=2
set WinDefault=0
set endswith=cmd
set AutoBackup=1
set bg_color=7
set fg_color=0
set Restore=0
set filename=
set RunApp=1
set Update=0
set color=70
set configname=
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
set rnd=
set opt=

@REM setting other environment variables
set restore_bak=cpdata
set backup=cpdata
set errorcode=
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
echo %date% ^|^|%time% : aConsolePassX 1.0 was started.>>AppsDataBase\log.txt

@REM main user interface starts from here
:start_main
cls
echo ==============================================================================
echo.                   aConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. aConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. Starting aConsolePassX ...
if exist temp.bat del temp.bat >nul
timeout /t 1 /nobreak >nul
echo. Checking AppsDataBase ...
if not exist AppsDataBase\7z.exe ( set errorcode=1 && goto check_error )
if not exist AppsDataBase\batbox.exe ( set errorcode=2 && goto check_error )
if not exist AppsDataBase\button.bat ( set errorcode=3 && goto check_error )
if not exist AppsDataBase\Getinput.exe ( set errorcode=4 && goto check_error )
if not exist AppsDataBase\Te.exe ( set errorcode=5 && goto check_error )
echo. Loading configuration ...
if not exist AppsDataBase\config.ini (
   echo. Generating file "config.ini" ...
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
	echo.                   aConsolePassX -Console Password Manager.
	echo ==============================================================================
	echo.
	echo. aConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. Error found, error code is 0x001
	echo. File missing from AppsDataBase folder [File name = 7z.exe].
	echo. Please reinstall aConsolePassX on the same folder to fix this error.
	echo. aConsolePassX cannot run without [7z.exe], press any key to exit app.
	pause >nul && exit
)  else if %errorcode% == 2 (
	echo %date% ^|^|%time% : Error, batbox.exe  missing from AppsDataBase folder.>>AppsDataBase\log.txt
	cls
	echo ==============================================================================
	echo.                   aConsolePassX -Console Password Manager.
	echo ==============================================================================
	echo.
	echo. aConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. Error found, error code is "0x002"
	echo. File missing from AppsDataBase folder [File name = batbox.exe].
	echo. Please reinstall aConsolePassX on the same folder to fix this error.
	echo. aConsolePassX cannot run without [batbox.exe], press any key to exit app.
	pause >nul && exit
) else if %errorcode% == 3 (
	echo %date% ^|^|%time% : Error, button.bat  missing from AppsDataBase folder.>>AppsDataBase\log.txt
	cls
	echo ==============================================================================
	echo.                   aConsolePassX -Console Password Manager.
	echo ==============================================================================
	echo.
	echo. aConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. Error found, error code is "0x003"
	echo. File missing from AppsDataBase folder [File name = button.bat].
	echo. Please reinstall aConsolePassX on the same folder to fix this error.
	echo. aConsolePassX cannot run without [button.bat], press any key to exit app.
	pause >nul && exit
) else if %errorcode% == 4 (
	echo %date% ^|^|%time% : Error, Getinput.exe  missing from AppsDataBase folder.>>AppsDataBase\log.txt
	cls
	echo ==============================================================================
	echo.                   aConsolePassX -Console Password Manager.
	echo ==============================================================================
	echo.
	echo. aConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. Error found, error code is "0x004"
	echo. File missing from AppsDataBase folder [File name = Getinput.exe].
	echo. Please reinstall aConsolePassX on the same folder to fix this error.
	echo. aConsolePassX cannot run without [Getinput.exe], press any key to exit app.
	pause >nul && exit
) else if %errorcode% == 5 (
	echo %date% ^|^|%time% : Error, Te.exe  missing from AppsDataBase folder.>>AppsDataBase\log.txt
	cls
	echo ==============================================================================
	echo.                   aConsolePassX -Console Password Manager.
	echo ==============================================================================
	echo.
	echo. aConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. Error found, error code is "0x005"
	echo. File missing from AppsDataBase folder [File name = Te.exe].
	echo. Please reinstall aConsolePassX on the same folder to fix this error.
	echo. aConsolePassX cannot run without [Te.exe], press any key to exit app.
	pause >nul && exit
) else if errorlevel == 6 (
	echo %date% ^|^|%time% : Error, Incorrect State value found in config.ini.>>AppsDataBase\log.txt
	cls
	echo ==============================================================================
	echo.                   aConsolePassX -Console Password Manager.
	echo ==============================================================================
	echo.
	echo. aConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. There is a mistake in configuration under [\aConsolePassX\State\].
	echo. "State" value is invalid, you can manually set it to 1 or 2.
	echo. Else aConsolePassX will automatically try to fix this error.
	echo. Press any key to automatically fix this mistake ...
	pause >nul && goto generate_cgf
) else if %errorcode% == 7 (
	cls
	echo ==============================================================================
	echo.                   aConsolePassX -Console Password Manager.
	echo ==============================================================================
	echo.
	echo. aConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. Warning : critical error "0x007"
	echo. Cannot auto recover file ...
	echo.
	echo. Put backups file [*.backup] in current folder if you have.
	echo.
	echo. Steps for manual recovery :
	echo. Step 01 : Install aConsolePassX 1.0 in another folder.
	echo. Step 02 : Create another account with same name and password.
	echo. Step 03 : Open AppsDataBase folder and locate file 71a.op in new one.
	echo. Step 04 : Copy file and paste it in old aConsolePassX's AppsDataBase folder.
	echo. Step 05 : Run old aConsolePassX app and you should be able to proceed.
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
) else if %errorcode% == 8 (
	cls
	echo ==============================================================================
	echo.                   aConsolePassX -Console Password Manager.
	echo ==============================================================================
	echo.
	echo. aConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. Warning : critical error "0x008"
	echo. Cannot auto recover file ... :^(
	echo.
	echo. Put backups file [*.backup] in current folder if you have.
	echo. If you dont have backup file then unfortunately you have lost it.
	echo.
	echo. [Notice : its not an app error, 1 file was missing
	echo.           "71b.op" from AppsDataBase folder.]
	echo.
	echo. Info : you were told the beginning to make backup and be carefull
	echo. about not getting any files deleted from AppsDataBase folder.
	echo. its not apps error so you cannot blame developer of this app
	echo. Please make sure you understand that.
	echo. Press any key to try loading backup ...
	pause >nul
	goto restore_backup
) else if %errorcode% == 9 (
	cls
	echo ==============================================================================
	echo.                   aConsolePassX -Console Password Manager.
	echo ==============================================================================
	echo.
	echo. Seems like login data file is corrupted.
	echo. ConsolePassX will try to fix this automatically.
	echo. If failed you might have to load any of you manually made backup.
	echo. And if you have changed password last time you have to use last password.
	echo. If you forgot that you can reset it again.
	echo. Press any key to try to fix this automatically ...
	pause >nul
	goto fix_corrupted
)
   goto check_user_state

:fix_corrupted
	cls
	echo ==============================================================================
	echo.                   aConsolePassX -Console Password Manager.
	echo ==============================================================================
	echo.
	if exist AppsDataBase\A.bak (
		copy AppsDataBase\A.bak
		AppsDataBase\7z.exe e -t7z -mx9 -sccUTF-8 -ssp -y -bd -scsUTF-16LE A.bak >nul
		move /y 71a.op AppsDataBase\ && del 71b.op && del A.bak
	) else (
		echo. Sorry file couldnt be recovered.
		echo. Load backup if you have ...
		echo. There is another way, read below :
		echo.
		echo. Steps for manual recovery :
		echo. Step 01 : Install aConsolePassX 1.0 in another folder.
		echo. Step 02 : Create another account with same name and password.
		echo. Step 03 : Open AppsDataBase folder and locate file 71a.op in new one.
		echo. Step 04 : Copy file and paste it in old aConsolePassX's AppsDataBase folder.
		echo. Step 05 : Run old aConsolePassX app and you should be able to proceed.
		echo. Step 06 : Login with your name and password and it should look normal.
		echo.
		echo. If you don't remember you password then you cannot recover passwords.
		echo. Then only option will be to use backup if you have made earlier.
		echo.
		echo. Best of luck on getting your passwords back :^)
		echo. We are really sorry for this inconvenience ...
		echo. Press any key to restart app
		pause >nul
		goto start_main
    )

@REM generate config.ini and change setting automatically if needed
:generate_cgf
if exist AppsDataBase\71a.op ( set state=2 )
if not exist AppsDataBase\71a.op ( set state=1 )
echo #=Press [Ctrl + X] then [N] to go back to aConsolePassX from setting.  >AppsDataBase\config.ini
echo #=Press [Ctrl + X] then [Y] then [Enter] to save changes.              >>AppsDataBase\config.ini
echo #=Some changes only applies when you run aConsolePassX next time.      >>AppsDataBase\config.ini
echo #=Change "Restore" value to 1 if you want to restore default settings. >>AppsDataBase\config.ini
echo #=Don't forget to change "Update" value at the end.                    >>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=[\aConsolePassX\Sys\]                                                >>AppsDataBase\config.ini
echo #=Valid value for "State" is 1 and 2, don't change manually.           >>AppsDataBase\config.ini
echo State=^%state%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=AutoBackup will make automatic backup of database files.             >>AppsDataBase\config.ini
echo #=Set value to 0 if you want to turn off, valid value [0 and 1].       >>AppsDataBase\config.ini
echo AutoBackup=^%AutoBackup%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=[\Window\Configuration\]                                             >>AppsDataBase\config.ini
echo #=Do not change ScreenBufferSize value for maximum password limit.     >>AppsDataBase\config.ini
echo ScreenBufferSize=^%ScreenBufferSize%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=CursorColor can be any RGB color code to decimal converted value.    >>AppsDataBase\config.ini
echo #=Red[255], Green[65280], Blue[16711680], Yellow[65535], Aqua[16776960]>>AppsDataBase\config.ini
echo #=White[16777215], Black[0], Orange{42495], Brown[7482] etc.           >>AppsDataBase\config.ini
echo CursorColor=^%CursorColor%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=WindowSize has many options, better not to change for best size.     >>AppsDataBase\config.ini
echo #=Instead you can change "WindowMode" to see which one you like.       >>AppsDataBase\config.ini
echo WindowSize=^%WindowSize%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=FontWeight can be minimum 256 to maximum 2304 [text thickness].      >>AppsDataBase\config.ini
echo FontWeight=^%FontWeight%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=WindowAlpha can be 170, 187, 204, 221, 238 and 255. [transparency]   >>AppsDataBase\config.ini
echo WindowAlpha=^%WindowAlpha%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=CursorSize can be minimum 25 to maximum 100. [cursor height]         >>AppsDataBase\config.ini
echo #=This doesn't work all "CursorType", doesn't work with default[2]     >>AppsDataBase\config.ini
echo CursorSize=^%CursorSize%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=CursorType can be minimum 0 to maximum 5. [cursors design]           >>AppsDataBase\config.ini
echo CursorType=^%CursorType%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=bg_color can range from 1-7 and A-F. [window background]             >>AppsDataBase\config.ini
echo bg_color=^%bg_color%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=fg_color can range from 1-7 and A-F. [Window text color]             >>AppsDataBase\config.ini
echo #=bg_color and fg_color cannot have same value.                        >>AppsDataBase\config.ini
echo fg_color=^%fg_color%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=WindowMode can have value 1-3. [Window mode/Window size]             >>AppsDataBase\config.ini
echo #=Value 1 and 3 will disable "WindowSize" and "ScreenBufferSize"       >>AppsDataBase\config.ini
echo WindowMode=^%WindowMode%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=WinDefault value must be 0 for all settings to work.                 >>AppsDataBase\config.ini
echo #=WinDefault value can be 0 or 1. [1 will disable other settings]      >>AppsDataBase\config.ini
echo WinDefault=^%WinDefault%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=[\Files\Name\]>>AppsDataBase\config.ini
echo #=fname means file name, it can be anything you want.                  >>AppsDataBase\config.ini
echo fname=%fname%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=endswith value can only be [cmd] or [bat], else file will not run.   >>AppsDataBase\config.ini
echo endswith=%endswith%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=[\Support\RunApp]>>AppsDataBase\config.ini
echo #=RunApp value must be higher then 1 for app to run.                   >>AppsDataBase\config.ini
echo RunApp=^%RunApp%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=[Update\Settings]>>AppsDataBase\config.ini
echo #=Set "Restore" value to 1 if you want to restore default settings.    >>AppsDataBase\config.ini
echo Restore=^%Restore%>>AppsDataBase\config.ini
echo.>>AppsDataBase\config.ini
echo #=Set Update value to 1 everytime you change any settings.             >>AppsDataBase\config.ini
echo #=Else setting will not be updated, you can come back if you forget.   >>AppsDataBase\config.ini
echo Update=^%Update%>>AppsDataBase\config.ini
goto check_configuration

@REM check if there is any mistake in configuration
:check_configuration
for /f "delims=" %%L in ( AppsDataBase\config.ini ) do set %%L >nul
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

@REM load configuration from AppsDataBase\config.ini
:load_configuration
set filename=%~nx0 && set configname=%fname%.%endswith%
set appname=%configname: =%
if %filename% NEQ %appname% goto change_filename
set string=%bg_color%%fg_color%
set color=%string: =%
@color %color%
set hovercolor=%fg_color%%bg_color%
set hovercolor=%hovercolor: =%
if %Update% GTR 0 goto update_regestry
if %Update% LSS 1 goto check_user_state

@REM change main files name if needed due to config.ini
:change_filename
echo. Problem found, file name needs to be changed.
echo. from %filename% to %appname%.
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
for /f "delims=" %%L in ( AppsDataBase\config.ini ) do set %%L >nul
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
set fname=aConsolePassX-1.0
set endswith=cmd
set RunApp=1
set Restore=0
set Update=1

@REM check %State% value to find if account exists
@REM if exists goto old user else goto new user
:check_user_state
if %State% EQU 1 goto new_user
if %State% EQU 2 goto old_user
set errorcode=6 && goto check_error

@REM Interface for new users
:new_user
cls 
echo ==============================================================================
echo.                   aConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo.   Select any of the options from below:
echo.
Call Button 2 6 "Create account         [ Default  ]" 2 9 "Look at functions      [ Guest    ]" 2 12 "I already have account [ Error?   ]" 2 15 "Exit aConsolePassX     [ Why now? ]" 2 18 "Restore backup         [ *.backup ]" # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 5 goto restore_backup
if errorlevel == 4 goto exit_app_guest
if errorlevel == 3 goto configerror
if errorlevel == 2 goto as_guest
if errorlevel == 1 goto create_ac

@REM Create aConsolePassX account
:create_ac
Batbox /h 1
cls
echo ==============================================================================
echo.                   aConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
set /p name="Enter your nick/user name : " && echo.
if %name% == 0 (
	echo Name cannot have value 0.
	echo Press any key to start over ...
	pause >nul && goto create_ac
)
set /p pass="Create a new master password : " && echo.
if %pass% == 0 (
	echo Password cannot have value 0.
	echo Press any key to start over ...
	pause >nul && goto create_ac
)
echo This is required for password recovery option.
set /p keys="Type your phone number : "
set keys=%keys: =%
if %keys% == 0 (
	echo Phone number cannot have value 0.
	echo Press any key to start over ...
	pause >nul && goto create_ac
)
Batbox /h 0
cls
echo ==============================================================================
echo.                   aConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Is everything correct?
echo.
echo ------------------------------------------------------------------------------
echo ^|   Name     :  %name%
echo ^|   Password :  %pass%
echo ^|   Number   :  %keys%
echo ------------------------------------------------------------------------------
echo.
Call Button 1 12 " Yes " 11 12 " No " # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 2 cls && goto create_ac
set name=%name: =%
set pass=%pass: =%
cls
echo ==============================================================================
echo.                   aConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. aConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. -----------------------------------------------------------------------------
echo. Please do not delete any file from AppsDataBase Folder.
echo. This files are used by aConsolePassX to store all types of data.
echo. If you delete any file and loose your passwords its on you.
echo. Also make backups of files, sometimes that should help.
echo. -----------------------------------------------------------------------------
echo.
echo. If you agree press [Yes] else Press [No]
echo. Pressing [No] will Exit app without saving any setup progress.
Call Button 1 16 " Yes " 11 16 " No " # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 2 echo %date% ^|^|%time% : Account creation cancled.>>AppsDataBase\log.txt && exit
echo uname=%name%>AppsDataBase\T71a
echo upass=%pass%>>AppsDataBase\T71a
echo ukeys=%keys%>>AppsDataBase\T71a
set lockpass=%pass%
AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{default=N*lock*} -sdel -scsUTF-16LE "AppsDataBase\71a.op" "AppsDataBase\T71a" >nul
echo -------------------------------------------------------->AppsDataBase\T71b
echo -------------------------------------------------------->>AppsDataBase\T71b
AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{pass=%lockpass%} -sdel -scsUTF-16LE "AppsDataBase\71b.op" "AppsDataBase\T71b" >nul
set State=2 && cls && goto generate_cgf

@REM New users can look at all aConsolePassX's functions.
:as_guest
Batbox /h 0
cls
echo ==============================================================================
echo.                   aConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. aConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. You are about to enter guest mode now.
echo. You will be able to take a look at all the functions.
echo. Select any option from below ...
Call Button 1 9 " Ok lets go " 18 9 "  Go back   " # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 2 goto new_user
goto guest_main

:guest_main
Batbox /h 0
cls
echo ==============================================================================
echo.                   aConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Comment : This is the main screen preview after creating account.
echo.
echo.  Select any of the options from below:
Call Button 2 7 "Change configuration [ Advanced ]" 2 10 "Login to account     [ Default  ]" 2 13 "Forgot password      [ Usual    ]" 2 16 "Exit aConsolePassX   [ Why now? ]" 2 19 "Restore backup       [ *.backup ]" # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 5 goto restore_backup
if errorlevel == 4 goto exit_app_guest
if errorlevel == 3 goto forgotpass_guest
if errorlevel == 2 goto login_task_guest
if errorlevel == 1 goto change_config_guest

:change_config_guest
cls
echo ==============================================================================
echo.                   aConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo.  How do you want to open this file?
echo.
Call Button 2 6 "Using aConsolePassX's console" 2 9 "Using MS-Windows Notepad     " # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 2 goto editconfig_notepad_guest
if errorlevel == 1 goto editconfig_nano_guest

:editconfig_nano_guest
cls
echo ==============================================================================
echo.                   aConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Opening configuration file ...
timeout /T 1 /nobreak >nul
if %color% EQU 70 color 07
AppsDataBase\Te.exe AppsDataBase\config.ini
@color %color%
echo. Checking configuration ...
timeout /T 1 /nobreak >nul
for /f "delims=" %%L in ( AppsDataBase\config.ini ) do set %%L >nul
echo. Updating files ...
timeout /T 1 /nobreak >nul
goto check_configuration

:editconfig_notepad_guest
cls
echo ==============================================================================
echo.                   aConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Opening configuration file ...
timeout /T 1 /nobreak >nul
Notepad.exe AppsDataBase\config.ini
echo. Checking configuration ...
timeout /T 1 /nobreak >nul
for /f "delims=" %%L in ( AppsDataBase\config.ini ) do set %%L >nul
echo. Updating files ...
timeout /T 1 /nobreak >nul
goto check_configuration

:login_task_guest
Batbox /h 0
cls
echo ==============================================================================
echo.                   aConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Comment : You dont have account so you didn't have to login.
echo.  Select any of the options from below:
Call Button 2 6 "Change login information " 32 6 "Check saved passwords    " 2 9 "Edit password file       " 32 9 "Add new passwords        " 2 12 "Logout of account        " 32 12 "Logout and exit          " 2 15 "Check logs               " 32 15 "Make backup              " # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 8 goto backup_guest
if errorlevel == 7 goto read_log_guest
if errorlevel == 6 goto exit_app_guest
if errorlevel == 5 goto check_user_state
if errorlevel == 4 goto addpass_guest
if errorlevel == 3 goto edit_guest
if errorlevel == 2 goto check_guest
if errorlevel == 1 goto change_login_guest

:change_login_guest
cls
echo ==============================================================================
echo.                   aConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo Are you sure you want to reset all login information ?
echo.
Call Button 1 5 " Yes " 11 5 " No " # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 2 goto login_task_guest
if errorlevel == 1 goto change_guest
goto change_login_guest
:change_guest
set gname=Name
set gpass=Pass
set gkeys=0000
cls
echo ==============================================================================
echo.                   aConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Comment : Press [Enter] to move on.
set /p "guest=Type your current password : "
cls
echo ==============================================================================
echo.                   aConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Comment : You can type anything or just press [Enter].
set /p "gname=Type your new nick name : " && echo.
set /p "gpass=Type your new password : " && echo.
set /p "gkeys=Type your new number : " && echo.
cls
echo ==============================================================================
echo.                   aConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Is everything correct?
echo. 
echo ------------------------------------------------------------------------------
echo ^| New Name      :   %gname%
echo ^| New Password  :   %gpass%
echo ^| New Number    :   %gkeys%
echo ------------------------------------------------------------------------------
echo.
Call Button 1 12 " Yes " 11 12 " No " # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 2 goto change_guest
goto login_task_guest

:check_guest
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo Comment : This is what the format would look like ...
echo --------------------------------------------------------
echo --------------------------------------------------------
echo Platform     :     gConsolePassX
echo Page URL     :     https://github.com/MagenusSkyler
echo User Name    :     Your name
echo E-mail Id    :     your email id
echo Number       :     your phone number
echo Password     :     supersecretpassword
echo date         :     10/10/2021
echo --------------------------------------------------------
echo --------------------------------------------------------
echo Platform     :     gConsolePassX
echo Page URL     :     https://github.com/MagenusSkyler
echo User Name    :     Your name
echo E-mail Id    :     your email id
echo Number       :     your phone number
echo Password     :     supersecretpassword
echo date         :     10/10/2021
echo --------------------------------------------------------
echo --------------------------------------------------------
echo.
echo. Press mentioned key "[1]" to seletct corresponding option.
echo.
echo. ^| [1] Change login information. [2] Refresh password file. ^|
echo. ^| [3] Edit password file.       [4] Add new passwords.     ^|
echo. ^| [5] Logout of account.        [6] Logout and exit.       ^|
echo. ^| [7] Get back to options selection menu.                  ^|
echo. ^| [8] Fix file not found error. [ Rare ]                   ^|
echo.
choice /C:1234567 /N /M "->[Waiting for you to select]<-"
if errorlevel == 8 goto check_guest
if errorlevel == 7 goto login_task_guest
if errorlevel == 6 goto exit_app_guest
if errorlevel == 5 goto check_user_state
if errorlevel == 4 goto addpass_guest
if errorlevel == 3 goto edit_guest
if errorlevel == 2 goto check_guest
if errorlevel == 1 goto change_login_guest
pause >nul && goto login_task_guest

:edit_guest
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. How do you want to open this file?
echo.
Call Button 1 6 "Using gConsolePassX's console" 1 9 "Using MS-Windows Notepad     " # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 2 goto edit_notepad_guest
if errorlevel == 1 goto edit_nano_guest

:edit_nano_guest
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Reading database ...
echo. Creating editable file ...
echo Comment : this file will not be saved.>AppsDataBase\guest.txt
echo Comment : Press [ctrl + X] to exit.>>AppsDataBase\guest.txt
echo -------------------------------------------------------->>AppsDataBase\guest.txt
echo -------------------------------------------------------->>AppsDataBase\guest.txt
echo Platform     :     gConsolePassX>>AppsDataBase\guest.txt
echo Page URL     :     www.gConsolePassX.com>>AppsDataBase\guest.txt
echo User Name    :     Your name>>AppsDataBase\guest.txt
echo E-mail Id    :     your email id>>AppsDataBase\guest.txt
echo Number       :     your phone number>>AppsDataBase\guest.txt
echo Password     :     supersecretpassword>>AppsDataBase\guest.txt
echo date         :     10/10/2020>>AppsDataBase\guest.txt
echo -------------------------------------------------------->>AppsDataBase\guest.txt
echo -------------------------------------------------------->>AppsDataBase\guest.txt
if %color% EQU 70 color 07
AppsDataBase\TE.exe AppsDataBase\guest.txt
del AppsDataBase\guest.txt
@color %color%
echo. Updating file ...
timeout 1 /nobreak >nul
goto login_task_guest

:edit_notepad_guest
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Reading database ...
echo. Creating editable file ...
echo Comment : this file will not be saved.>AppsDataBase\guest.txt
echo -------------------------------------------------------->>AppsDataBase\guest.txt
echo -------------------------------------------------------->>AppsDataBase\guest.txt
echo Platform     :     gConsolePassX>>AppsDataBase\guest.txt
echo Page URL     :     www.gConsolePassX.com>>AppsDataBase\guest.txt
echo User Name    :     Your name>>AppsDataBase\guest.txt
echo E-mail Id    :     your email id>>AppsDataBase\guest.txt
echo Number       :     your phone number>>AppsDataBase\guest.txt
echo Password     :     supersecretpassword>>AppsDataBase\guest.txt
echo date         :     10/10/2020>>AppsDataBase\guest.txt
echo -------------------------------------------------------->>AppsDataBase\guest.txt
echo -------------------------------------------------------->>AppsDataBase\guest.txt
notepad AppsDataBase\guest.txt
echo. Updating file ...
del AppsDataBase\guest.txt
timeout 1 /nobreak >nul
goto login_task_guest

:addpass_guest
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Comment : password will not be added unless you create account.
echo.
set /p Gplatform="Platform     :     "
echo.
set /p Gpageurl="Page URL     :     "
echo.
set /p Gusername="User Name    :     "
echo.
set /p Gemailid="E-mail Id    :     "
echo.
set /p Ganumber="Number       :     "
echo.
set /p Gapasswd="Password     :     "
echo.
set /p Gadate="date         :     "
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Comment : password will not be added unless you create account.
echo. Is everything correct ?
echo.
echo   ^| Platform     :     %Gplatform%
echo   ^| Page URL     :     %Gpageurl%
echo   ^| User Name    :     %Gusername%
echo   ^| E-mail Id    :     %Gemailid%
echo   ^| Number       :     %Ganumber%
echo   ^| Password     :     %Gapasswd%
echo   ^| date         :     %Gadate%
echo.
Call Button 1 15 "Yes everything is correct" 1 18 "No there is a mistake    " # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 2 cls && goto addpass_guest
echo.
echo.
echo. No database file to save passwords into.
echo. Passwords not saved [needs account].
echo. Press any key to go back ...
pause >nul
goto login_task_guest

:exit_app_guest
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. gConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. Checking files ...
echo. Everything is ok ...
echo. Press any key to exit ...
pause >nul && exit

:read_log_guest
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
if not exist AppsDataBase\log.txt (
	echo %date% ^|^|%time% : Detected previous logs deleted.>>AppsDataBase\log.txt
	goto read_log_guest
) else (
	type AppsDataBase\log.txt
	echo.
	echo. Press mentioned key "[1]" to seletct corresponding option.
	echo.
	echo. ^| [1] Change login information. [2] Check password file. ^|
	echo. ^| [3] Edit password file.       [4] Add new passwords.   ^|
	echo. ^| [5] Logout of account.        [6] Logout and exit.     ^|
	echo. ^| [7] Get back to options selection menu.                ^|
	echo. ^| [8] Clear all previous logs.                           ^| && echo.
	choice /C:12345678 /N /M "->[Waiting for you to select]<-"
	if errorlevel == 8 echo %date% ^|^|%time% : Cleared all previous logs.>AppsDataBase\log.txt && goto read_log_guest
	if errorlevel == 7 goto login_task_guest
	if errorlevel == 6 goto exit_app_guest
	if errorlevel == 5 goto check_user_state
	if errorlevel == 4 goto addpass_guest
	if errorlevel == 3 goto edit_guest
	if errorlevel == 2 goto check_guest
	if errorlevel == 1 goto change_login_guest
	goto login_task_guest
)

:backup_guest
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. You cannot make backup of database files without account.
echo. database is created when you create account.
echo. Press any key to go back ...
pause >nul && goto login_task_guest

:forgotpass_guest
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. gConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. Forgot password? Thats definitely why you use gConsolePassX.
echo. But don't worry you can reset you password easily.
echo. Just enter your name below and keep following ...
echo.
echo. Comment : Type anything or just press [Enter].
set /p "guest=Type out your nick/user name : "
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. We need to conform its you so type you phone number.
echo.
echo. Comment : Type anything or just press [Enter].
set /p "guest=Type your phone number : "
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. You have entered correct phone number.
echo. So now you can reset you password ...
echo.
echo. Comment : Type anything or just press [Enter].
set /p "gname=Type your new nick name : "
echo.
echo. Comment : Type anything or just press [Enter].
set /p "gpass=Please create a new master password : "
echo.
echo. Comment : Type anything or just press [Enter].
set /p "gkeys=Type your phone number : "
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Is everything correct?
echo.
echo ------------------------------------------------------------------------------
echo  ^| Name      :  %gname%
echo  ^| Password  :  %gpass%
echo  ^| Number    :  %gkeys%
echo ------------------------------------------------------------------------------
echo.
echo. Comment : Selecting 'Yes' does nothing as you dont have account.
Call Button 1 14 " Yes " 12 14 " No " # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 2 cls && goto forgotpass_guest
goto guest_main

:restore_backup
set restore_bak=cpdata
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Copy *.backup into same folder as gConsolePassX-1.0 file
echo. Make sure you dont place it in AppsDataBase folder
echo.
echo. Press [Enter] if file name is "cpdata.backup"
set /p "restore_bak=>Type backups file name : "
if not exist %restore_bak%.backup (
	echo.
	echo. %restore_bak%.backup does not exist on current folder.
	echo. Please recheck file name and try again.
	echo. Press any key to retry ... && pause >nul
	goto restore_backup
)
AppsDataBase\7z.exe e -t7z -mx9 -sccUTF-8 -ssp -y -bd -scsUTF-16LE "%restore_bak%.backup" >nul
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
if exist AppsDataBase\71a.op (
	echo. 71a.op already exists ...
)
if exist AppsDataBase\71b.op (
	echo. 71b.op already exists ...
)
if exist AppsDataBase\conf.ini (
	echo. conf.ini already exists ...
)
if not exist AppsDataBase\71a.op move 71a.op AppsDataBase\ >nul
if not exist AppsDataBase\71b.op move 71b.op AppsDataBase\ >nul
if not exist AppsDataBase\conf.ini move conf.ini AppsDataBase\ >nul
echo.
echo. If any file already exists gConsolePassX will not replace files.
echo. Please replace files manually if not done automatically.
echo. After you copy files to AppsDataBase folder-
echo. Press any key to load new files ...
pause >nul
goto check_user_state

:conferror
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Trying to look for a user account ...
timeout /t 1 /nobreak >nul
if exist AppsDataBase\71a.op (
	echo. Account was found ... && set State=2
	echo. Adding account ... && timeout /t 1 >nul
	goto generate_cgf
)
echo. Sorry, account was not found ...
echo. Press any key to go back ...
pause >nul && goto new_user

@REM start of main users interface
:old_user
if not exist AppsDataBase\71a.op ( set errorcode=4 && goto check_error )
if not exist AppsDataBase\71b.op ( set errorcode=5 && goto check_error )
AppsDataBase\7z.exe e -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{default=N*lock*} -sdel -scsUTF-16LE "AppsDataBase\71a.op" -oAppsDataBase\ >nul
for /f "delims=" %%L in ( AppsDataBase\T71a ) do set %%L
AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{default=N*lock*} -sdel -scsUTF-16LE "AppsDataBase\71a.op" "AppsDataBase\T71a" >nul
set lockpass=%upass%
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo.  Select any of the options from below:
Call Button 2 6 "Change configuration [ Advanced ]" 2 9 "Login to account     [ Default  ]" 2 12 "Forgot password      [ Usual    ]" 2 15 "Exit aConsolePassX   [ Why now? ]" 2 18 "Restore backup       [ *.backup ]" # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 5 goto restore_backup
if errorlevel == 4 goto end_process
if errorlevel == 3 goto forgotpass
if errorlevel == 2 set counter=4 && goto login_ac
if errorlevel == 1 goto change_conf

:change_conf
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. How do you want to open this file?
echo.
Call Button 2 6 "Using aConsolePassX's console" 2 9 "Using MS-Windows Notepad     " # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 2 goto editconf_notepad
if errorlevel == 1 goto editconf_nano

:editconf_nano
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Opening configuration file ...
timeout /T 1 /nobreak >nul
if %color% EQU 70 color 07
AppsDataBase\Te.exe AppsDataBase\conf.ini
@color %color%
echo. Checking configuration ...
timeout /T 1 /nobreak >nul
for /f "delims=" %%L in ( AppsDataBase\conf.ini ) do set %%L >nul
echo. Updating files ...
timeout /T 1 /nobreak >nul
goto check_configuration

:editconf_notepad
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Opening configuration file ...
timeout /T 1 /nobreak >nul
Notepad.exe AppsDataBase\conf.ini
echo. Checking configuration ...
timeout /T 1 /nobreak >nul
for /f "delims=" %%L in ( AppsDataBase\conf.ini ) do set %%L >nul
echo. Updating files ...
timeout /T 1 /nobreak >nul
goto check_configuration

:login_ac
Batbox /h 1
if %counter% EQU 1 goto lockout
if %uname% == 0 (
	set errorcode=6
	goto check_error
)
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
set /p login_name="Type your user name: "
set login_name=%login_name: =%

set "psCommand=powershell -Command " $pword = read-host 'Enter your password' -AsSecureString;^
  $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword);^
   [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
    for /f "usebackq delims=" %%p in (`%psCommand%`) do set login_pass=%%p
)

set login_pass=%login_pass: =%
if %login_name% == %uname% (
	if %login_pass% == %upass% echo %date% ^|^|%time% : Logged in to account successfully.>>AppsDataBase\log.txt && goto login_tasks
) else (
	goto wrong_login
)

:wrong_login
echo.
set /a counter-=1
echo Incorrect username or password.
if %counter% LSS 4 echo %counter% attempts left.
echo Press any key to try again ...
pause >nul
goto login_ac

:lockout
echo.
echo Too many incorrect attempts detected.
echo Please use forgot password option instead.
echo Please wait for 15 seconds before next try ...
echo %date% ^|^|%time% : Too many login attempts failed.>>AppsDataBase\log.txt
timeout /t 15 /nobreak >nul
set counter=3
goto old_user

:login_tasks
Batbox /h 0
if %AutoBackup% GEQ 1 (
	AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -scsUTF-16LE "AppsDataBase\A.bak" "AppsDataBase\71a.op" "AppsDataBase\71b.op" >nul
)
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo.  Select any of the options from below:
Call Button 2 5 "Change login information " 32 5 "Check saved passwords    " 2 8 "Edit password file       " 32 8 "Add new passwords        " 2 11 "Logout of account        " 32 11 "Logout and exit          " 2 14 "Check logs               " 32 14 "Make backup              " # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 8 goto make_backup
if errorlevel == 7 goto check_logs
if errorlevel == 6 goto end_process
if errorlevel == 5 goto old_user
if errorlevel == 4 goto add_pass
if errorlevel == 3 goto edit_pass
if errorlevel == 2 goto check_pass
if errorlevel == 1 goto change_login

:change_login
Batbox /h 1
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.

set "psCommand=powershell -Command " $pword = read-host 'Enter current password' -AsSecureString;^
  $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword);^
   [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
    for /f "usebackq delims=" %%p in (`%psCommand%`) do set current=%%p
)

if %current% NEQ %upass% echo You have typed incorrect password ... && echo Press any key to try again ... && pause >nul && goto change_login
if %current% == %upass% (
	echo.
	set /p opt_name="Type your new nick name : " && echo.
	set /p opt_pass="Type your new password : " && echo.
	set /p opt_keys="Type your new number : " && echo.
)

Batbox /h 0
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Is everything correct?
echo.
echo -------------------------------------------------------------------
echo ^| New Name      :   %opt_name%
echo ^| New Password  :   %opt_pass%
echo ^| New Number    :   %opt_keys%
echo -------------------------------------------------------------------
echo.
Call Button 1 12 " Yes " 11 12 " No " # Press
Getinput /m %Press% /h %hovercolor%

if errorlevel == 2 goto change_login
echo uname=%opt_name%>AppsDataBase\T71a
echo upass=%opt_pass%>>AppsDataBase\T71a
echo ukeys=%opt_keys%>>AppsDataBase\T71a
AppsDataBase\7z.exe e -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{pass=%lockpass%} -sdel -scsUTF-16LE "AppsDataBase\71b.op" -oAppsDataBase\ >nul
set lockpass=%opt_pass%
AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{pass=%lockpass%} -sdel -scsUTF-16LE "AppsDataBase\71b.op" "AppsDataBase\T71b" >nul
AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{default=N*lock*} -sdel -scsUTF-16LE "AppsDataBase\71a.op" "AppsDataBase\T71a" >nul
goto check_user_state
:check_pass
AppsDataBase\7z.exe e -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{pass=%lockpass%} -sdel -scsUTF-16LE "AppsDataBase\71b.op" -oAppsDataBase\ >nul
echo %date% ^|^|%time% : Checked Saved passwords.>>AppsDataBase\log.txt
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
Type AppsDataBase\T71b
AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{pass=%lockpass%} -sdel -scsUTF-16LE "AppsDataBase\71b.op" "AppsDataBase\T71b" >nul
echo.
echo. Press mentioned key "[1]" to seletct corresponding option.
echo.
echo. ^| [1] Change login information. [2] Refresh password file. ^|
echo. ^| [3] Edit password file.       [4] Add new passwords.     ^|
echo. ^| [5] Logout of account.        [6] Logout and exit        ^| 
echo. ^| [7] Get back to options selection menu.                  ^| 
echo. ^| [8] Fix file not found error. [ Rare ]                   ^| && echo.
choice /C:12345678 /N /M "->[Waiting for you to select]<-"
if errorlevel == 8 goto fix_notfound
if errorlevel == 7 goto login_tasks
if errorlevel == 6 goto end_process
if errorlevel == 5 goto check_user_state
if errorlevel == 4 goto add_pass
if errorlevel == 3 goto edit_pass
if errorlevel == 2 goto check_pass
if errorlevel == 1 goto change_login

:fix_notfound
if not exist AppsDataBase\A.bak (
	echo. Cannot fix without A.bak
	echo. Please load Backup ...
	pause >nul
	goto login_tasks
) else (
	copy AppsDataBase\A.bak
	AppsDataBase\7z.exe e -t7z -mx9 -sccUTF-8 -ssp -y -bd -scsUTF-16LE A.bak >nul
	move /y 71b.op AppsDataBase\ && del 71a.op && del A.bak
	goto check_pass
)

:edit_pass
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. How do you want to open this file?
echo.
Call Button 1 6 "Using gConsolePassX's console" 1 9 "Using MS-Windows Notepad     " # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 2 goto edit_notepad
if errorlevel == 1 goto edit_nano

:edit_nano
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Reading database ...
set /a rnd=(((%random% * 32768) + %random%) %%990000) + 10000
AppsDataBase\7z.exe e -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{pass=%lockpass%} -sdel -scsUTF-16LE "AppsDataBase\71b.op" -oAppsDataBase\ >nul
echo. Creating editable file ...
ren AppsDataBase\T71b %rnd% >nul
if %color% EQU 70 color 07
AppsDataBase\TE.exe AppsDataBase\%rnd%
ren AppsDataBase\%rnd% T71b
@color %color%
echo. Updating file ...
AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{pass=%lockpass%} -sdel -scsUTF-16LE "AppsDataBase\71b.op" "AppsDataBase\T71b" >nul
timeout 1 /nobreak >nul
goto login_tasks

:edit_notepad
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Reading database ...
set /a rnd=(((%random% * 32768) + %random%) %%990000) + 10000
AppsDataBase\7z.exe e -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{pass=%lockpass%} -sdel -scsUTF-16LE "AppsDataBase\71b.op" -oAppsDataBase\ >nul
echo. Creating editable file ...
ren AppsDataBase\T71b %rnd% >nul
notepad AppsDataBase\%rnd%
ren AppsDataBase\%rnd% T71b
echo. Updating file ...
AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{pass=%lockpass%} -sdel -scsUTF-16LE "AppsDataBase\71b.op" "AppsDataBase\T71b" >nul
timeout 1 /nobreak >nul
goto login_tasks

:add_pass
Batbox /h 1
cls
set platform=
set pageurl=
set username=
set emailid=
set anumber=
set apasswd=
set adate=
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
set /p platform="Platform     :     "
echo.
set /p pageurl="Page URL     :     "
echo.
set /p username="User Name    :     "
echo.
set /p emailid="E-mail Id    :     "
echo.
set /p anumber="Number       :     "
echo.
set /p apasswd="Password     :     "
echo.
set /p adate="date         :     "
Batbox /h 0
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Is everything correct ?
echo.
echo   ^| Platform     :     %platform%
echo   ^| Page URL     :     %pageurl%
echo   ^| User Name    :     %username%
echo   ^| E-mail Id    :     %emailid%
echo   ^| Number       :     %anumber%
echo   ^| Password     :     %apasswd%
echo   ^| date         :     %adate%
echo.
Call Button 1 14 "Yes everything is correct" 1 17 "No there is a mistake    " # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 2 cls && goto add_pass
AppsDataBase\7z.exe e -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{pass=%lockpass%} -sdel -scsUTF-16LE "AppsDataBase\71b.op" -oAppsDataBase\ >nul
echo %date% ^|^|%time% : New password added to database.>>AppsDataBase\log.txt
echo Platform     :     %platform%>>AppsDataBase\T71b
echo Page URL     :     %pageurl%>>AppsDataBase\T71b
echo User Name    :     %username%>>AppsDataBase\T71b
echo E-mail Id    :     %emailid%>>AppsDataBase\T71b
echo Number       :     %anumber%>>AppsDataBase\T71b
echo Password     :     %apasswd%>>AppsDataBase\T71b
echo date         :     %adate%>>AppsDataBase\T71b
echo -------------------------------------------------------->>AppsDataBase\T71b
echo -------------------------------------------------------->>AppsDataBase\T71b
AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{pass=%lockpass%} -sdel -scsUTF-16LE "AppsDataBase\71b.op" "AppsDataBase\T71b" >nul
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Password has been added.
timeout /t 3
goto login_tasks

:check_logs
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
if not exist AppsDataBase\log.txt (
	echo %date% ^|^|%time% : Detected previous logs deleted.>>AppsDataBase\log.txt
	goto read_log_guest
) else (
	type AppsDataBase\log.txt
	echo.
	echo. Press mentioned key "[1]" to seletct corresponding option.
	echo.
	echo. ^| [1] Change login information. [2] Check password file. ^|
	echo. ^| [3] Edit password file.       [4] Add new passwords.   ^|
	echo. ^| [5] Logout of account.        [6] Logout and exit.     ^|
	echo. ^| [7] Get back to options selection menu.                ^|
	echo. ^| [8] Clear all previous logs.                           ^| && echo.
	choice /C:12345678 /N /M "->[Waiting for you to select]<-"
	if errorlevel == 8 echo %date% ^|^|%time% : Cleared all previous logs.>AppsDataBase\log.txt && goto check_logs
	if errorlevel == 7 goto login_tasks
	if errorlevel == 6 goto end_process
	if errorlevel == 5 goto check_user_state
	if errorlevel == 4 goto add_pass
	if errorlevel == 3 goto edit_pass
	if errorlevel == 2 goto check_pass
	if errorlevel == 1 goto change_login
	goto login_tasks
)

:make_backup
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Type filename you want to use for backup ...
echo. Press [Enter] to ignore this ...
echo.
set /p "backup=>File name? : "
echo.
echo. Copying files ...
copy AppsDataBase\71a.op >nul
copy AppsDataBase\71b.op >nul
copy AppsDataBase\conf.ini >nul
echo. Compressing files ...
AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -scsUTF-16LE -sdel "%backup%.backup" 71a.op 71b.op conf.ini >nul
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Backup file placed on current folder : %~dp0
echo. File name is "%backup%.backup".
echo. press any key to go back ...
pause >nul
goto login_tasks

:forgotpass
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. gConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. Forgot password? Thats definitely why you use gConsolePassX.
echo. But don't worry you can reset you password easily.
echo. Just enter your name below and keep following ...
echo.
set /p "name=Type out your nick/user name : "
if %name% EQU %uname% (
	goto get_number
) else (
	echo Incorrect username.
	echo You might have misspelled.
	echo Press any key to try again ...
	pause >nul
	goto forgotpass
)

:get_number
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. We need to conform its you so type you phone number.
echo.
set /p "number=Type your phone number : "
if %number% == %ukeys% goto reset_passwd
echo You have entered incorrect number.
echo Please try again, press any key ...
pause >nul && goto get_number

:reset_passwd
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. You have entered correct phone number.
echo. So now you can reset you password ...
echo.
set /p "name=Type your new nick name : "
echo.
set /p "passwd=Please create a new master password : "
if %passwd% == %upass% (
	echo Fun fact, this is your old password :^)
	goto reset_number
)

:reset_number
echo.
echo Do you want to change phone Number ?
choice /C:yn /N /M "Press Y [For Yes] or N [For No]"
if errorlevel == 2 (
	goto save_forgoten_changes
) else (
	goto get_new_number
)
:get_new_number
echo.
echo Incase you forget password again ...
set /p "number=Type your phone number : "
goto save_forgoten_changes

:save_forgoten_changes
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. gConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. Is everything correct?
echo.
echo ------------------------------------------------------------------------------
echo  ^| Name      :  %name%
echo  ^| Password  :  %passwd%
echo  ^| Number    :  %number%
echo ------------------------------------------------------------------------------
echo.
Call Button 1 12 " Yes " 11 12 " No " # Press
Getinput /m %Press% /h %hovercolor%
if errorlevel == 2 cls && goto reset_passwd
echo. Saving changes ...
echo uname=%name%>AppsDataBase\T71a
echo upass=%passwd%>>AppsDataBase\T71a
echo ukeys=%number%>>AppsDataBase\T71a
AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{default=N*lock*} -sdel -scsUTF-16LE "AppsDataBase\71a.op" "AppsDataBase\T71a" >nul
AppsDataBase\7z.exe e -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{pass=%lockpass%} -sdel -scsUTF-16LE "AppsDataBase\71b.op" -oAppsDataBase\ >nul
set lockpass=%passwd%
AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{pass=%lockpass%} -sdel -scsUTF-16LE "AppsDataBase\71b.op" "AppsDataBase\T71b" >nul
echo %date% ^|^|%time% : Login info was forgotten so was reset.>>AppsDataBase\log.txt
timeout /t 1 /nobreak >nul
goto check_user_state

:end_process
cls
echo ==============================================================================
echo.                   gConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. gConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. Checking files ...
if exist AppsDataBase\T71a (
	AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{default=N*lock*} -sdel -scsUTF-16LE "AppsDataBase\71a.op" "AppsDataBase\T71a" >nul
)
if exist AppsDataBase\T71b (
	AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{pass=%lockpass%} -sdel -scsUTF-16LE "AppsDataBase\71b.op" "AppsDataBase\T71b" >nul
)
echo. Everything is ok ...
echo. Press any key to exit ...
pause >nul && exit



