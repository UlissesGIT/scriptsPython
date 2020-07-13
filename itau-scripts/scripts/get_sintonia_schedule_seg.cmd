
set d=%~dp0
set d=%d:~0,-1%

set get_script=%d%\get_sintonia_zip_seg.cmd
set unx=c:\utils\bin



if not exist %get_script%  goto :EOF

if not exist log  mkdir log
if not exist log  goto :EOF

%unx%\test.exe -d log
if %ERRORLEVEL% NEQ 0   goto :EOF

set LOGFILE=

for /f %%i in ('%unx%\gdate.exe +sintonia_seg.%%Y-%%m-%%d.log') do set LOGFILE=log\%%i

if not defined LOGFILE     goto :EOF

for /f "tokens=*" %%i in ('%unx%\gdate.exe "+%%d/%%m/%%Y %%H:%%M:%%S"') do (echo. && echo %%i Iniciando processamento de %get_script%) >>%LOGFILE%

cmd /c %get_script%  >>%LOGFILE% 
