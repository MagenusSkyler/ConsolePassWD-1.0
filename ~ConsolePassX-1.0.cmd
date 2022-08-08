@REM code started from here
@echo off
@color 70
@setlocal DisableDelayedExpansion
set appsbase=AppsDataBase\;%appsbase%
@title ~ConsolePassX 1.0 -Console Password Manager

@REM setting configurations environment variables
set ScreenBufferSize=655294584
set fname=~ConsolePassX-1.0
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
set rnd=
set opt=

@REM setting other environment variables
set restore_bak=cpdata
set backup=cpdata
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
echo %date% ^|^|%time% : ~ConsolePassX 1.0 was started.>>AppsDataBase\log.txt

@REM main user interface starts from here
:start_main
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. ~ConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. Starting ~ConsolePassX ...
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
   echo.                   ~ConsolePassX -Console Password Manager.
   echo ==============================================================================
   echo.
   echo. ~ConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. Error found, error code is 0x001
	echo. File missing from AppsDataBase folder [File name = 7z.exe].
	echo. Please reinstall ~ConsolePassX on the same folder to fix this error.
	echo. ~ConsolePassX cannot run without [7z.exe], press any key to exit app.
	pause >nul && exit
) else if %errorcode% == 2 (
   echo %date% ^|^|%time% : Error, Te.exe  missing from AppsDataBase folder.>>AppsDataBase\log.txt
	cls
	echo ==============================================================================
   echo.                   ~ConsolePassX -Console Password Manager.
   echo ==============================================================================
   echo.
   echo. ~ConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. Error found, error code is "0x002"
	echo. File missing from AppsDataBase folder [File name = Te.exe].
	echo. Please reinstall ~ConsolePassX on the same folder to fix this error.
	echo. ~ConsolePassX cannot run without [Te.exe], press any key to exit app.
	pause >nul && exit
) else if errorlevel == 3 (
   echo %date% ^|^|%time% : Error, Incorrect State value found in cfg.ini.>>AppsDataBase\log.txt
	cls
	echo ==============================================================================
   echo.                   ~ConsolePassX -Console Password Manager.
   echo ==============================================================================
   echo.
   echo. ~ConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. There is a mistake in configuration under [\~ConsolePassX\State\].
	echo. "State" value is invalid, you can manually set it to 1 or 2.
	echo. Else ~ConsolePassX will automatically try to fix this error.
	echo. Press any key to automatically fix this mistake ...
	pause >nul && goto generate_cgf
) else if %errorcode% == 4 (
   cls
	echo ==============================================================================
   echo.                   ~ConsolePassX -Console Password Manager.
   echo ==============================================================================
   echo.
   echo. ~ConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. Warning : critical error "0x004"
	echo. Cannot auto recover file ...
	echo.
	echo. Put backups file [*.backup] in current folder if you have.
	echo.
	echo. Steps for manual recovery :
	echo. Step 01 : Install ~ConsolePassX 1.0 in another folder.
	echo. Step 02 : Create another account with same name and password.
	echo. Step 03 : Open AppsDataBase folder and locate file 71a.op in new one.
	echo. Step 04 : Copy file and paste it in old ~ConsolePassX's AppsDataBase folder.
	echo. Step 05 : Run old ~ConsolePassX app and you should be able to proceed.
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
   echo.                   ~ConsolePassX -Console Password Manager.
   echo ==============================================================================
   echo.
   echo. ~ConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
	echo.
	echo. Warning : critical error "0x005"
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
)
   goto check_user_state

@REM generate cfg.ini and change setting automatically if needed
:generate_cgf
if exist AppsDataBase\71a.op ( set state=2 )
if not exist AppsDataBase\71a.op ( set state=1 )
echo #=Press [Ctrl + X] then [N] to go back to ~ConsolePassX from setting.  >AppsDataBase\cfg.ini
echo #=Press [Ctrl + X] then [Y] then [Enter] to save changes.              >>AppsDataBase\cfg.ini
echo #=Some changes only applies when you run ~ConsolePassX next time.      >>AppsDataBase\cfg.ini
echo #=Change "Restore" value to 1 if you want to restore default settings. >>AppsDataBase\cfg.ini
echo #=Don't forget to change "Update" value at the end.                    >>AppsDataBase\cfg.ini
echo.>>AppsDataBase\cfg.ini
echo #=[\~ConsolePassX\Sys\]                                                >>AppsDataBase\cfg.ini
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
echo #=[\Files\Name\]>>AppsDataBase\cfg.ini
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
set fname=~ConsolePassX-1.0
set endswith=cmd
set RunApp=1
set Restore=0
set Update=1
goto generate_cgf

@REM check %State% value to find if account exists
@REM if exists goto old user else goto new user
:check_user_state
if %State% EQU 1 goto new_user
if %State% EQU 2 goto old_user
set errorcode=3 && goto check_error

@REM Interface for new users
:new_user
cls 
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Press mentioned key "[1]" to seletct corresponding option.
echo.
echo. ^| [1] Create account                [ Default  ] ^|
echo. ^| [2] Look at functions             [ Guest    ] ^|
echo. ^| [3] I already have account        [ Error?   ] ^|
echo. ^| [4] Exit ~ConsolePassX            [ Why now? ] ^|
echo. ^| [5] Restore backup                [ *.backup ] ^|
echo.
choice /C:12345 /N /M "->[Waiting for you to select]<-"
if errorlevel == 5 goto restore_backup
if errorlevel == 4 goto exit_app_guest
if errorlevel == 3 goto cfgerror
if errorlevel == 2 goto as_guest
if errorlevel == 1 goto create_ac

@REM Create ~ConsolePassX account
:create_ac
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
set /p name="Enter your nick/user name : " && echo.
set name=%name: =%
if %name% == 0 (
	echo Name cannot have value 0.
	echo Press any key to start over ...
	pause >nul && goto create_ac
)
set /p pass="Create a new master password : " && echo.
set pass=%pass: =%
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
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
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
echo [Y = Yes] ^| [N = No], Select No if there is a mistake.
choice /C:yn /N /M "->[If this is correct Press 'Y' else Press 'N']<-"
if errorlevel == 2 cls && goto create_ac
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. ~ConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. -----------------------------------------------------------------------------
echo. Please do not delete any file from AppsDataBase Folder.
echo. This files are used by ~ConsolePassX to store all types of data.
echo. If you delete any file and loose your passwords its on you.
echo. Also make backups of files, sometimes that should help.
echo. -----------------------------------------------------------------------------
echo.
echo. If you agree press "Y" [For Yes] else Press "N" [For No]
echo. Pressing "N" will Exit app without saving any setup progress.
choice /C:yn /N /M "->[Waiting for choice 'Y' or 'N']<-"
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

@REM New users can look at all ~ConsolePassX's functions.
:as_guest
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. ~ConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. You are about to enter guest mode now.
echo. You will be able to take a look at all the functions.
echo. Press any key to start taking a look around ~ConsolePassX 1.0 ...
pause >nul
goto guest_main

:guest_main
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Comment : This is the main screen preview after creating account.
echo.
echo. Press mentioned key "[1]" to seletct corresponding option.
echo.
echo. ^| [1] Change configuration          [ Advanced ] ^|
echo. ^| [2] Login to account              [ Default  ] ^|
echo. ^| [3] Forgot password               [ Usual    ] ^|
echo. ^| [4] Exit ~ConsolePassX            [ Why now? ] ^|
echo. ^| [5] Restore backup                [ *.backup ] ^|
echo.
choice /C:12345 /N /M "->[Waiting for you to select]<-"
if errorlevel == 5 goto restore_backup
if errorlevel == 4 goto exit_app_guest
if errorlevel == 3 goto forgotpass_guest
if errorlevel == 2 goto login_task_guest
if errorlevel == 1 goto change_cfg_guest

:change_cfg_guest
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. How do you want to open this file?
echo.
echo. ^| [1] Using ~ConsolePassX's console ^|
echo. ^| [2] Using MS-Windows Notepad      ^|
echo.
choice /C:12 /N /M "->[Waiting for you to select]<-"
if errorlevel == 2 goto editcfg_notepad_guest
if errorlevel == 1 goto editcfg_nano_guest

:editcfg_nano_guest
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Opening configuration file ...
timeout /T 1 /nobreak >nul
if %color% EQU 70 color 07
AppsDataBase\Te.exe AppsDataBase\cfg.ini
@color %color%
echo. Checking configuration ...
timeout /T 1 /nobreak >nul
for /f "delims=" %%L in ( AppsDataBase\cfg.ini ) do set %%L >nul
echo. Updating files ...
timeout /T 1 /nobreak >nul
goto check_configuration

:editcfg_notepad_guest
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Opening configuration file ...
timeout /T 1 /nobreak >nul
Notepad.exe AppsDataBase\cfg.ini
echo. Checking configuration ...
timeout /T 1 /nobreak >nul
for /f "delims=" %%L in ( AppsDataBase\cfg.ini ) do set %%L >nul
echo. Updating files ...
timeout /T 1 /nobreak >nul
goto check_configuration

:login_task_guest
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Comment : You dont have account so you didn't have to login.
echo. Press mentioned key "[1]" to seletct corresponding option.
echo.
echo. ^| [1] Change login information.  ^|
echo. ^| [2] Check saved passwords.     ^|
echo. ^| [3] Edit password file.        ^|
echo. ^| [4] Add new passwords.         ^|
echo. ^| [5] Logout of account.         ^|
echo. ^| [6] Logout and exit.           ^|
echo. ^| [7] Check logs.                ^|
echo. ^| [8] Make backup.               ^|
echo.
choice /C:12345678 /N /M "->[Waiting for you to select]<-"
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
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo Are you sure you want to reset all login information ?
echo If yes then type "yes" letter by latter and press [Enter].
echo Else Type "no" and hit [Enter], you will be back to options menu.
echo.
set /p opt="Type 'yes' or 'no' : "
if %opt% == no goto login_task_guest
if %opt% == yes goto change_guest
goto change_login_guest
:change_guest
set gname=Name
set gpass=Pass
set gkeys=0000
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Comment : Press [Enter] to move on.
set /p "guest=Type your current password : "
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Comment : You can type anything or just press [Enter].
set /p "gname=Type your new nick name : " && echo.
set /p "gpass=Type your new password : " && echo.
set /p "gkeys=Type your new number : " && echo.
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
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
echo [Y = Yes] ^| [N = No], Select No if there is a mistake.
choice /C:yn /N /M "->[If this is correct Press 'Y' else Press 'N']<-"
if errorlevel == 2 goto change_guest
goto login_task_guest

:check_guest
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo Comment : This is what the format would look like ...
echo --------------------------------------------------------
echo --------------------------------------------------------
echo Platform     :     ~ConsolePassX
echo Page URL     :     https://github.com/MagenusSkyler
echo User Name    :     Your name
echo E-mail Id    :     your email id
echo Number       :     your phone number
echo Password     :     supersecretpassword
echo date         :     10/10/2021
echo --------------------------------------------------------
echo --------------------------------------------------------
echo Platform     :     ~ConsolePassX
echo Page URL     :     https://github.com/MagenusSkyler
echo User Name    :     Your name
echo E-mail Id    :     your email id
echo Number       :     your phone number
echo Password     :     supersecretpassword
echo date         :     10/10/2021
echo --------------------------------------------------------
echo --------------------------------------------------------
echo.
echo. ^| [1] Change login information. [2] Refresh password file. ^|
echo. ^| [3] Edit password file.       [4] Add new passwords.     ^|
echo. ^| [5] Logout of account.        [6] Logout and exit.       ^|
echo. ^| [7] Get back to options selection menu.                  ^|
echo.
choice /C:1234567 /N /M "->[Waiting for you to select]<-"
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
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. How do you want to open this file?
echo.
echo. ^| [1] Using ~ConsolePassX's console ^|
echo. ^| [2] Using MS-Windows Notepad      ^|
echo.
choice /C:12 /N /M "->[Waiting for you to select]<-"
if errorlevel == 2 goto edit_notepad_guest
if errorlevel == 1 goto edit_nano_guest

:edit_nano_guest
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Reading database ...
echo. Creating editable file ...
echo Comment : this file will not be saved.>AppsDataBase\guest.txt
echo Comment : Press [ctrl + X] to exit.>>AppsDataBase\guest.txt
echo -------------------------------------------------------->>AppsDataBase\guest.txt
echo -------------------------------------------------------->>AppsDataBase\guest.txt
echo Platform     :     ~ConsolePassX>>AppsDataBase\guest.txt
echo Page URL     :     www.~ConsolePassX.com>>AppsDataBase\guest.txt
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
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Reading database ...
echo. Creating editable file ...
echo Comment : this file will not be saved.>AppsDataBase\guest.txt
echo -------------------------------------------------------->>AppsDataBase\guest.txt
echo -------------------------------------------------------->>AppsDataBase\guest.txt
echo Platform     :     ~ConsolePassX>>AppsDataBase\guest.txt
echo Page URL     :     www.~ConsolePassX.com>>AppsDataBase\guest.txt
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
echo.                   ~ConsolePassX -Console Password Manager.
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
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Comment : password will not be added unless you create account.
echo Is everything correct ?
echo.
echo ^| Platform     :     %Gplatform%
echo ^| Page URL     :     %Gpageurl%
echo ^| User Name    :     %Gusername%
echo ^| E-mail Id    :     %Gemailid%
echo ^| Number       :     %Ganumber%
echo ^| Password     :     %Gapasswd%
echo ^| date         :     %Gadate%
echo.
echo [Y = Yes] ^| [N = No], Select No if there is a mistake.
choice /C:yn /N /M "->[Press 'Y' or 'N']<-"
if errorlevel == 2 cls && goto addpass_guest
echo.
echo. No database file to save passwords into.
echo. Passwords not saved [needs account].
echo. Press any key to go back ...
pause >nul
goto login_task_guest

:exit_app_guest
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. ~ConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. Checking files ...
echo. Everything is ok ...
echo. Press any key to exit ...
pause >nul && exit

:read_log_guest
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
if not exist AppsDataBase\log.txt (
	echo %date% ^|^|%time% : Detected previous logs deleted.>>AppsDataBase\log.txt
	goto read_log_guest
) else (
	type AppsDataBase\log.txt
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
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. You cannot make backup of database files without account.
echo. database is created when you create account.
echo. Press any key to go back ...
pause >nul && goto login_task_guest

:forgotpass_guest
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. ~ConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. Forgot password? Thats definitely why you use ~ConsolePassX.
echo. But don't worry you can reset you password easily.
echo. Just enter your name below and keep following ...
echo.
echo. Comment : Type anything or just press [Enter].
set /p "guest=Type out your nick/user name : "
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. We need to conform its you so type you phone number.
echo.
echo. Comment : Type anything or just press [Enter].
set /p "guest=Type your phone number : "
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
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
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Is everything correct?
echo.
echo ------------------------------------------------------------------------------
echo ^| Name      :  %gname%
echo ^| Password  :  %gpass%
echo ^| Number    :  %gkeys%
echo ------------------------------------------------------------------------------
echo.
echo. Comment : Selecting 'Y' does nothing as you dont have account.
echo [Y = Yes] ^| [N = No], Select No if there is a mistake.
choice /C:yn /N /M "->[Press 'Y' or 'N']<-"
if errorlevel == 2 cls && goto forgotpass_guest
goto guest_main

:restore_backup
set restore_bak=cpdata
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Copy *.backup into same folder as ~ConsolePassX-1.0 file
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
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
if exist AppsDataBase\71a.op (
	echo. 71a.op already exists ...
)
if exist AppsDataBase\71b.op (
	echo. 71b.op already exists ...
)
if exist AppsDataBase\cfg.ini (
	echo. cfg.ini already exists ...
)
if not exist AppsDataBase\71a.op move 71a.op AppsDataBase\ >nul
if not exist AppsDataBase\71b.op move 71b.op AppsDataBase\ >nul
if not exist AppsDataBase\cfg.ini move cfg.ini AppsDataBase\ >nul
echo.
echo. If any file already exists ~ConsolePassX will not replace files.
echo. Please replace files manually if not done automatically.
echo. After you copy files to AppsDataBase folder-
echo. Press any key to load new files ...
pause >nul
goto check_user_state

:cfgerror
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
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
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Press mentioned key "[1]" to seletct corresponding option.
echo.
echo. ^| [1] Change configuration          [ Advanced ] ^|
echo. ^| [2] Login to account              [ Default  ] ^|
echo. ^| [3] Forgot password               [ Usual    ] ^|
echo. ^| [4] Exit ~ConsolePassX            [ Why now? ] ^|
echo. ^| [5] Restore backup                [ *.backup ] ^|
echo.
choice /C:12345 /N /M "->[Waiting for you to select]<-"
if errorlevel == 5 goto restore_backup
if errorlevel == 4 goto end_process
if errorlevel == 3 goto forgotpass
if errorlevel == 2 set counter=4 && goto login_ac
if errorlevel == 1 goto change_cfg

:change_cfg
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. How do you want to open this file?
echo.
echo. ^| [1] Using ~ConsolePassX's console ^|
echo. ^| [2] Using MS-Windows Notepad      ^|
echo.
choice /C:12 /N /M "->[Waiting for you to select]<-"
if errorlevel == 2 goto editcfg_notepad
if errorlevel == 1 goto editcfg_nano

:editcfg_nano
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Opening configuration file ...
timeout /T 1 /nobreak >nul
if %color% EQU 70 color 07
AppsDataBase\Te.exe AppsDataBase\cfg.ini
@color %color%
echo. Checking configuration ...
timeout /T 1 /nobreak >nul
for /f "delims=" %%L in ( AppsDataBase\cfg.ini ) do set %%L >nul
echo. Updating files ...
timeout /T 1 /nobreak >nul
goto check_configuration

:editcfg_notepad
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Opening configuration file ...
timeout /T 1 /nobreak >nul
Notepad.exe AppsDataBase\cfg.ini
echo. Checking configuration ...
timeout /T 1 /nobreak >nul
for /f "delims=" %%L in ( AppsDataBase\cfg.ini ) do set %%L >nul
echo. Updating files ...
timeout /T 1 /nobreak >nul
goto check_configuration

:login_ac
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
set /p login_name="Type your user name: "
if %counter% EQU 1 goto lockout

set "psCommand=powershell -Command " $pword = read-host 'Enter your password' -AsSecureString;^
  $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword);^
   [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
    for /f "usebackq delims=" %%p in (`%psCommand%`) do set login_pass=%%p
)

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
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Press mentioned key "[1]" to seletct corresponding option.
echo.
echo. ^| [1] Change login information.  ^|
echo. ^| [2] Check saved passwords.     ^|
echo. ^| [3] Edit password file.        ^|
echo. ^| [4] Add new passwords.         ^|
echo. ^| [5] Logout of account.         ^|
echo. ^| [6] Logout and exit.           ^|
echo. ^| [7] Check logs.                ^|
echo. ^| [8] Make backup.               ^|
echo.
choice /C:12345678 /N /M "->[Waiting for you to select]<-"
if errorlevel == 8 goto make_backup
if errorlevel == 7 goto check_logs
if errorlevel == 6 goto end_process
if errorlevel == 5 goto old_user
if errorlevel == 4 goto add_pass
if errorlevel == 3 goto edit_pass
if errorlevel == 2 goto check_pass
if errorlevel == 1 goto change_login

:change_login
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
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
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
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
echo [Y = Yes] ^| [N = No], Select No if there is a mistake.
choice /C:yn /N /M "->[If this is correct Press 'Y' else Press 'N']<-"
if errorlevel == 2 goto change_user_info
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
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
Type AppsDataBase\T71b
AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -p{pass=%lockpass%} -sdel -scsUTF-16LE "AppsDataBase\71b.op" "AppsDataBase\T71b" >nul
echo.
echo. ^| [1] Change login information. [2] Refresh password file. ^|
echo. ^| [3] Edit password file.       [4] Add new passwords.     ^|
echo. ^| [5] Logout of account.        [6] Logout and exit        ^| 
echo. ^| [7] Get back to options selection menu.                  ^| && echo.
choice /C:1234567 /N /M "->[Waiting for you to select]<-"
if errorlevel == 7 goto login_tasks
if errorlevel == 6 goto end_process
if errorlevel == 5 goto check_user_state
if errorlevel == 4 goto add_pass
if errorlevel == 3 goto edit_pass
if errorlevel == 2 goto check_pass
if errorlevel == 1 goto change_login

:edit_pass
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. How do you want to open this file?
echo.
echo. ^| [1] Using ConsolePassX's console ^|
echo. ^| [2] Using MS-Windows Notepad     ^|
echo.
choice /C:12 /N /M "->[Waiting for you to select]<-"
if errorlevel == 2 goto edit_notepad
if errorlevel == 1 goto edit_nano

:edit_nano
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
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
echo.                   ~ConsolePassX -Console Password Manager.
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
echo.                   ~ConsolePassX -Console Password Manager.
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
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo Is everything correct ?
echo.
echo ^| Platform     :     %platform%
echo ^| Page URL     :     %pageurl%
echo ^| User Name    :     %username%
echo ^| E-mail Id    :     %emailid%
echo ^| Number       :     %anumber%
echo ^| Password     :     %apasswd%
echo ^| date         :     %adate%
echo.
echo [Y = Yes] ^| [N = No], Select No if there is a mistake.
choice /C:yn /N /M "->[Press 'Y' or 'N']<-"
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
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. Password has been added.
timeout /t 3
goto login_tasks

:check_logs
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
if not exist AppsDataBase\log.txt (
	echo %date% ^|^|%time% : Detected previous logs deleted.>>AppsDataBase\log.txt
	goto read_log_guest
) else (
	type AppsDataBase\log.txt
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
echo.                   ~ConsolePassX -Console Password Manager.
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
copy AppsDataBase\cfg.ini >nul
echo. Compressing files ...
AppsDataBase\7z.exe a -t7z -mx9 -sccUTF-8 -ssp -y -bd -sdel -scsUTF-16LE "%backup%.backup" 71a.op 71b.op cfg.ini >nul
cls
echo ==============================================================================
echo.                   ~ConsolePassX -Console Password Manager.
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
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. ~ConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. Forgot password? Thats definitely why you use ~ConsolePassX.
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
echo.                   ~ConsolePassX -Console Password Manager.
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
echo.                   ~ConsolePassX -Console Password Manager.
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
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. ~ConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
echo.
echo. Is everything correct?
echo.
echo ------------------------------------------------------------------------------
echo ^| Name      :  %name%
echo ^| Password  :  %passwd%
echo ^| Number    :  %number%
echo ------------------------------------------------------------------------------
echo.
echo [Y = Yes] ^| [N = No], Select No if there is a mistake.
choice /C:yn /N /M "->[Press 'Y' or 'N']<-"
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
echo.                   ~ConsolePassX -Console Password Manager.
echo ==============================================================================
echo.
echo. ~ConsolePassX 1.0 : Copyright 2021 - 2022 Abdullah Al Noman.
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

:: This is a incomplete project yet.
:: file will be updated soon ...


