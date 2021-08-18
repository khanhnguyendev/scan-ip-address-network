@echo off
set local EnableDelayedExpansion
set "xNext="
set "xComputer="
echo Startting
echo { >> %CD%\ipList.txt
for /f %%A in ('net view /all') do (
  set "xComputer=%%~A"
  if "!xComputer:~0,2!"=="\\" for /f "token=2,* delims=. " %%X in ('nslookup %%A') do (
    if "!xNext!"=="1" (
      echo "%%X.%%Y":"!xComputer!", >> %CD%ipList.txt
    )
    if "!xComputer:~2!"=="%%~X" set "xNext=1"|
  )
)
echo } >> %CD%\ipList.txt
endlocal
pause
