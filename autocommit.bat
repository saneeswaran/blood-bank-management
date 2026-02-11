@echo off
title Git Auto Commit Tool

:START
cls
echo ==========================
echo      GIT AUTO COMMIT
echo ==========================
echo.

set /p msg=Enter commit message (Press ENTER for default "updated"): 

if "%msg%"=="" (
    set msg=updated
)

echo.
echo Committing with message: "%msg%"
echo.

git add .
git commit -m "%msg%"
git push origin main

echo.
echo ==========================
set /p reload=Do you want to run again? (y/n): 

if /i "%reload%"=="y" goto START

echo.
echo Exiting...
pause
