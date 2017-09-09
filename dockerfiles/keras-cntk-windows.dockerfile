FROM microsoft/windowsservercore
MAINTAINER chemso@gmx.de

# docker push chemsorly/keras-cntk-windows

SHELL ["powershell"]

# install anaconda2
RUN Invoke-WebRequest "https://repo.continuum.io/archive/Anaconda2-4.3.0.1-Windows-x86_64.exe" -OutFile "$env:TEMP\anaconda.exe" -UseBasicParsing
RUN Start-Process "$env:TEMP\anaconda.exe" '/S /InstallationType=AllUsers /AddToPath=1 /RegisterPython=1 /D=C:\ProgramData\Anaconda2' -wait

# set env variables
RUN setx PATH '%PATH%;C:\ProgramData\Anaconda2\Scripts'
RUN setx PATH '%PATH%;C:\ProgramData\Anaconda2'
RUN setx PYTHONIOENCODING UTF-8
RUN setx KERAS_BACKEND cntk

# install c++ redis for vs2015
RUN Invoke-WebRequest "https://download.microsoft.com/download/6/A/A/6AA4EDFF-645B-48C5-81CC-ED5963AEAD48/vc_redist.x64.exe" -OutFile "$env:TEMP\cpp2015_redist.exe" -UseBasicParsing
RUN Start-Process "$env:TEMP\cpp2015_redist.exe" '/install /quiet /norestart' -wait

# install cntk
RUN pip install https://cntk.ai/PythonWheel/GPU/cntk-2.1-cp27-cp27m-win_amd64.whl

# install keras
RUN pip install keras