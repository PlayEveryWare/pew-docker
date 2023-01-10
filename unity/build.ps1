Start-Process `
    -FilePath "C:\Program Files\Unity Hub\Unity Hub.exe" `
    -ArgumentList @( `
        "--"; `
        "--headless install"; `
        "--version $ENV:UNITY_VERSION"; `
        "--changeset $ENV:UNITY_CHANGESET" `
    ) `
    -Wait
if ( $LastExitCode -eq 1 ) {
    exit 0
}

move "C:\Program Files\Unity\Hub\Editor\$ENV:UNITY_VERSION" C:\Unity
