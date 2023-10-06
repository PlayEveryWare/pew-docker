# Use this windows image as a source of our opengl DLLs
FROM mcr.microsoft.com/windows:1809 as windows

FROM mcr.microsoft.com/windows/servercore:ltsc2022
LABEL org.opencontainers.image.authors="Matthew Endsley (mendsley@gmail.com)"

# Install chocolately
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
RUN Set-ExecutionPolicy Bypass -Scope Process -Force; \
	 [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
	iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install dependencies
RUN Set-Service -Name wuauserv -StartupType Manual
RUN choco install --no-progress -y \
	git \
	vcredist2010 \
	msvisualcplusplus2013-redist \
	dotnet3.5
RUN Install-PackageProvider nuget -force
RUN Install-Module -Confirm PowerHTML

COPY --from=windows \
		c:/windows/system32/glu32.dll \
		c:/windows/system32/opengl32.dll \
		c:/windows/system32/
