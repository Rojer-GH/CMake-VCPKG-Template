@echo off

rem This file is responsible for managing the python virutal environment.

rem Push the root directory

echo.

pushd "../.."

rem Clean py-venv if necessary

if "%~1"=="clean" (
	call :PRINT %highlight%Cleaning Python...
	echo.
	call :clean
	goto :exit
)

rem Build pyenv if necessary, and install all needed libraries/tools

if "%~1"=="build" (
	call :PRINT %highlight%Building Python...
	echo.
	call :build
	goto :exit
)

rem Rebuild, yes very hacky I know

if "%~1"=="rebuild" (
	call :PRINT %highlight%Rebuilding Python...
	echo.
	call :clean
	call :build
	goto :exit
)

rem If everything else didn't execute, show help message:

call :print %error%Select a valid option: {%highlight%build%error%, %highlight%rebuild%error%, %highlight%clean%error%}
goto :exit

:build
	if not exist %deps% (
		mkdir %deps%
		cd %deps%
		mkdir %pybin%
		cd %pybin%
		curl -o python.zip -J -L -k "https://www.python.org/ftp/python/3.10.7/python-3.10.7-embed-amd64.zip"
		tar -xf python.zip
		cd "..\.."
		move %deps%\%pybin%\python310._pth %deps%\%pybin%\python310.pth
		call %deps%\%pybin%\python scripts\python\get-pip.py --no-warn-script-location
		call %deps%\%pybin%\python -m pip install --upgrade pip setuptools wheel --no-warn-script-location
		call %deps%\%pybin%\python -m pip install virtualenv --no-warn-script-location
		call %deps%\%pybin%\python -m virtualenv %deps%\%pylib%
		call %deps%\%pylib%\Scripts\activate
		call python -m pip install --upgrade pip
		call pip install argparse requests sphinx breathe exhale sphinx-book-theme cpplint
		call pip list
		call deactivate
	) else (
		call :print %highlight%"%deps%" %error%already exists!
	)
	exit /b 0

:clean
	if not exist %deps% (
		call :print %highlight%"%deps%" %error%does not exist...
	) else (
		rmdir /S /Q "%deps%"
		call :print Removed %highlight%"%deps%"
	)
	exit /b 0

:exit
	popd
	exit /b 0

:PRINT
	echo %text%%* %reset%
	exit /b 0
