@echo off

py -3.8 -m venv venv

call venv\Scripts\activate.bat

python -m pip install -r flatcam_8.994_working.txt
python -m pip check

pause
exit