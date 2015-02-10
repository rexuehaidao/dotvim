:: auto install and config vim
@echo off

:: change directory to home
cd /d %USERPROFILE%

set DOTVIM=%USERPROFILE%\.vim


call :IsExist git.exe
if %errorlevel% == 0 goto gitget
echo git.exe not exist, must install git tools first.
exit /b 1

:gitget

call :GitClone https://github.com/gmarik/vundle.git "%DOTVIM%\bundle\vundle"

call :GitClone https://github.com/rexuehaidao/dotvim.git "%DOTVIM%\dotvim"

copy /y "%DOTVIM%\dotvim\vimrc" %USERPROFILE%\_vimrc

vim +BundleInstall +qall

:eof
exit /b 0


:IsExist
::echo "%~$PATH:1"
if not exist "%~$PATH:1" exit /b 1
exit /b 0
:EndIsExist


:GitClone
set GIT_URL=%1
set GIT_PATH=%2
if exist %GIT_PATH% goto gitupdate

echo git clone %GIT_URL% %GIT_PATH%
git clone %GIT_URL% %GIT_PATH%
if not %errorlevel%==0 goto gitupdate
if %errorlevel% == 0 echo git clone successed
exit /b

:gitupdate
set OLDDIR=%cd%
cd /d %GIT_PATH%
echo git.exe pull %GIT_PATH%
git.exe pull -v --no-rebase --progress
if %errorlevel% == 0 echo git pull successed
cd /d %OLDDIR%
exit /b
:EndGitClone
