{ pkgs, ... }:

{
  packages = [
    pkgs.maven
  ];

  languages.java.enable = true;
  languages.java.jdk.package = pkgs.temurin-bin-21;

  enterShell = ''
    java -version
  '';
}
