@echo off
powershell.exe -command "cd %~dp0; powershell.exe -executionpolicy bypass -noexit -file upload.ps1"