; -- Elektra Installer.iss --

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!
#define semver "1.1"
#define verStr_ StringChange(semver, '.', '-')


[Setup]
AppName=Data Logger
AppVerName=Data Logger {#semver}
DefaultDirName={commonpf}\EPL\Data Logger\v{#semver}
OutputDir=.\Output
DefaultGroupName=EPL
AllowNoIcons=yes
OutputBaseFilename=Data_Logger_TDT_{#verStr_}
UsePreviousAppDir=no
UsePreviousGroup=no
DisableProgramGroupPage=yes
PrivilegesRequired=admin

[Files]
Source: "..\Build\*.*"; DestDir: "{app}"; Flags: replacesameversion
Source: "..\rpfiles\*.*"; DestDir: "{app}\rpfiles"; Flags: replacesameversion
Source: "D:\Development\epl-vi-lib\Utility VIs\Error Handling VIs\epl-vi-lib-errors.ini"; DestDir: "{app}"; Flags: replacesameversion

[Icons]
Name: "{commondesktop}\Data Logger"; Filename: "{app}\Data-Logger-TDT.exe"; IconFilename: "{app}\movie.ico"; IconIndex: 0;



