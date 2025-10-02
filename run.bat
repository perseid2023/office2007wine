@echo off

:: Set source and destination directories
set src_system32=%~dp0system32
set dest_system32=%windir%\System32
set src_syswow64=%~dp0syswow64
set dest_syswow64=%windir%\SysWOW64

:: Copy system32 directory
xcopy /s /y /i "%src_system32%\*" "%dest_system32%"

:: Copy syswow64 directory
xcopy /s /y /i "%src_syswow64%\*" "%dest_syswow64%"

:: Import registry file
reg import reg.reg

if %errorlevel%==0 (
  echo Files copied and registry file imported successfully.
) else (
  echo Error importing registry file.
)
pause
