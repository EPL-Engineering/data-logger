; -- Elektra Installer.iss --

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!
;#define semver "0.1.0"
#define verStr_ StringChange(semver, '.', '-')


[Setup]
AppName=Data Logger
AppVerName=Data Logger {#semver}
DefaultDirName={commonpf}\EPL\Data Logger\v{code:GetVersionFolder|{#semver}}
OutputDir=.\Output
DefaultGroupName=EPL
AllowNoIcons=yes
OutputBaseFilename=Data_Logger_{#verStr_}
UsePreviousAppDir=no
UsePreviousGroup=no
DisableProgramGroupPage=yes
PrivilegesRequired=admin

[Files]
Source: "..\Build\*.*"; DestDir: "{app}"; Flags: replacesameversion
Source: "D:\Development\epl-vi-lib\Utility VIs\Error Handling VIs\epl-vi-lib-errors.ini"; DestDir: "{app}"; Flags: replacesameversion

[Icons]
Name: "{commondesktop}\Data Logger"; Filename: "{app}\Data-Logger.exe"; IconFilename: "{app}\movie.ico"; IconIndex: 0;


[Code]

function IsTestVersion(Param : String): Boolean;
begin
    Result := False
    if (Pos('alpha', Param) > 0) or (Pos('beta', Param) > 0) then begin
      Result := True
    end;
end;

function GetVersionFolder(Param: String): String;
var
  idx : Integer;

begin
    Result := Param
    idx := Pos('alpha', Param)
    if idx > 0 then begin
      Result := Copy(Param, 1, idx + 4)
    end;
    idx := Pos('beta', Param)
    if idx > 0 then begin
      Result := Copy(Param, 1, idx + 3)
    end;
end;


