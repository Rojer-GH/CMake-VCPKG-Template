@echo off

rem Push the root directory, enter python dev env, and call our python script with <batch-file-name> and all passed arguments

pushd "../.."

if exist "%deps%\%pylib%" (
	call %deps%\%pylib%\Scripts\activate
	call python scripts\python\wizard.py -d %deps% cmake %*
	call deactivate
) else (
	call :print %highlight%Python %error%is not setup. Run %highlight%python build
)

popd
