@echo off
rem for echo to work inside if statement 
setlocal EnableDelayedExpansion

rem This is Windows *.bat file for launching portable emacs
rem by Yun Han@ECE 486 Lab
rem 2017-08-13

rem Create a shortcut to .\bin\emacsclientw.exe in SumatraPDF folder
rem for inverse search

rem Check if ..\SumatraPDF312\emacsclientw.exe shortcut exists
if exist "%~dp0..\SumatraPDF312\emacsclientw.exe.lnk" (
echo No need to create another shortcut.

) else (
echo Creating shortcut to .\bin\emacsclientw.exe in
echo ..\SumatraPDF312\emacsclientw.exe folder

rem Using powershell script to create the shortcut
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%~dp0..\SumatraPDF312\emacsclientw.exe.lnk');$s.TargetPath='%~dp0bin\emacsclientw.exe';$s.Save()"
echo Shortcut to .\bin\emacsclientw.exe has been created.
)

rem Set emacs HOME as current directory
set HOME=%~dp0
rem Add .\bin (emacs) and ..\SumatraPDF312 to PATH
set PATH=%~dp0bin;%~dp0..\SumatraPDF312;%PATH%
rem Add ..\miktex29\texmfs\install\miktex\bin to PATH
set PATH=%~dp0..\miktex29\texmfs\install\miktex\bin;%PATH%
rem Launch emacs. Note '%*' for situations where input args are present
"%~dp0bin\runemacs.exe" %*
