{ pkgs, ... }:

let
  InputXSLT  = pkgs.callPackage ../input-xslt  { };
  BuildXSLT  = pkgs.callPackage ../build-xslt  { };
  StaticXSLT = pkgs.callPackage ../static-xslt { };
in pkgs.writeScriptBin
  "make-xslt"
  ''
    #!/bin/sh
    ${InputXSLT}/bin/ixslt --input make.xml --transformation ${BuildXSLT}/build.xsl --include ${StaticXSLT}/
  ''
