{ pkgs, ... }:

let
  InputXSLT  = pkgs.callPackage ../InputXSLT  { };
  StaticXSLT = pkgs.callPackage ../StaticXSLT { };
  BuildXSLT  = pkgs.callPackage ../BuildXSLT  { };
in pkgs.writeScriptBin
  "makeweb"
  ''
    #!/bin/sh
    ${InputXSLT}/bin/ixslt --input make.xml --transformation ${BuildXSLT}/build.xsl --include ${StaticXSLT}/
  ''
