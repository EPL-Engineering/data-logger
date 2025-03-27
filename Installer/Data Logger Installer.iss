; -- Elektra Installer.iss --

; Set the following three variables
#define exeName "DataLogger.exe" ; i.e.: the "Target filename" set in the LabVIEW project explorer
#define appName "Data Logger"    ; this is arbitrary. It controls the install folder location and the desktop shortcut name
#define iconName "movie.ico"

; In normal use, should not need to edit below here

; Extracts the semantic version from the executable. Only retains the patch number if it is greater than zero.
#define SemanticVersion() \
   GetVersionComponents("..\Build\" + exeName, Local[0], Local[1], Local[2], Local[3]), \
   Str(Local[0]) + "." + Str(Local[1]) + ((Local[2]>0) ? "." + Str(Local[2]) : "")
    
; The installer contains the semantic version number, but replaces the dots with dashes so it doesn't look like a file extension.
#define installerName StringChange(appName, ' ', '_') + "_" + StringChange(SemanticVersion(), '.', '-')


[Setup]
AppName={#appName}
AppVerName={#appName} V{#SemanticVersion()}
DefaultDirName={commonpf}\EPL\{#appName}\V{#SemanticVersion()}
OutputDir=.\Output
DefaultGroupName=EPL
AllowNoIcons=yes
OutputBaseFilename={#installerName}
UsePreviousAppDir=no
UsePreviousGroup=no
DisableProgramGroupPage=yes
PrivilegesRequired=admin

[Files]
Source: "..\Build\*.*"; DestDir: "{app}"; Flags: replacesameversion
Source: "D:\Development\epl-vi-lib\Utility VIs\Error Handling VIs\epl-vi-lib-errors.ini"; DestDir: "{app}"; Flags: replacesameversion

[Icons]
Name: "{commondesktop}\{#appName}"; Filename: "{app}\{#exeName}"; IconFilename: "{app}\{#iconName}"; IconIndex: 0;

