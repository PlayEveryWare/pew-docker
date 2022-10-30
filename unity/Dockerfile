FROM ghcr.io/playeveryware/unity-hub:3.3.0 as hub

SHELL ["cmd", "/c"]

ARG UNITY_VERSION
ARG UNITY_CHANGESET
RUN echo "Installing unity version $ENV:UNITY_VERSION with changeset $ENV:UNITY_CHANGESET"
RUN "C:\Program Files\Unity Hub\Unity Hub.exe" -- \
	--headless install \
	--version $ENV:UNITY_VERSION \
	--changeset $ENV:UNITY_CHANGESET \
	&& if ( $LastExitCode -eq 1 ) { exit 0 }

RUN move "C:\Program Files\Unity\Hub\Editor\$ENV:UNITY_VERSION" C:\Unity

FROM ghcr.io/playeveryware/builder:vs2019
LABEL org.opencontainers.image.authors="Matthew Endsley (mendsley@gmail.com)"

COPY --from=hub "C:\Unity" "C:\Unity"

# Unity won't enable licensing without these services T__T
RUN Set-Service nlasvc -StartupType Automatic
RUN Set-Service netprofm -StartupType Automatic

