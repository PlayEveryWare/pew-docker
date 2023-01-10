FROM ghcr.io/playeveryware/unity-hub:3.3.0 as hub

ARG UNITY_VERSION
ARG UNITY_CHANGESET
RUN Write-Host "Installing unity version $ENV:UNITY_VERSION with changeset $ENV:UNITY_CHANGESET"
COPY build.ps1 C:/build.ps1
RUN C:\build.ps1

FROM ghcr.io/playeveryware/builder:vs2019
LABEL org.opencontainers.image.authors="Matthew Endsley (mendsley@gmail.com)"

COPY --from=hub "C:\Unity" "C:\Unity"

# Unity won't enable licensing without these services T__T
RUN Set-Service nlasvc -StartupType Automatic
RUN Set-Service netprofm -StartupType Automatic

