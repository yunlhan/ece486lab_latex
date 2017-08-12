rem This is Windows *.bat file for launching portable emacs 
rem Set emacs HOME as current directory
set HOME=%~dp0
rem Launch emacs. Note '%*' for situations where input args are present
"%~dp0bin\runemacs.exe" %*

