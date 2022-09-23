# Use this windows image as a source of our opengl DLLs
FROM mcr.microsoft.com/windows:1809 as windows

FROM mcr.microsoft.com/windows/servercore:ltsc2019
LABEL org.opencontainers.image.authors="Matthew Endsley (mendsley@gmail.com)"

# Install chocolately
SHELL ["powershell", "-Command"]
RUN Set-ExecutionPolicy Bypass -Scope Process -Force; \
	 [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
	iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

SHELL ["cmd", "/C"]

# Install dependencies
RUN choco install --no-progress -y \
	git \
	vcredist2010 \
	msvisualcplusplus2013-redist

COPY --from=windows \
		c:/windows/system32/glu32.dll \
		c:/windows/system32/opengl32.dll \
		c:/windows/system32/
