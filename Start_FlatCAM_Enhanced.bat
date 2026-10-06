@echo off
title FlatCAM 8.994 Enhanced
cd /d "%~dp0"
call venv\Scripts\activate.bat
python FlatCAM.py
