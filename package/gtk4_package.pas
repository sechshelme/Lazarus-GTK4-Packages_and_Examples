{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit GTK4_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  GDK4, GDK4_broadway, GSK4, GSK4_broadway, GTK4, GTK4_unix_print, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('GTK4_package', @Register);
end.
