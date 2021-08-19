{ pkgs, ... }:

pkgs.stdenv.mkDerivation rec {
  name = "build-xslt";

  src = pkgs.fetchFromGitHub {
    owner = "KnairdA";
    repo = "BuildXSLT";
    rev = "master";
    sha256 = "09kxhvhzn0r62l39zgj1kc21rb565fnc1y3sg48p4gi4v15xjmc6";
  };

  installPhase = ''
    mkdir $out
    cp -r * $out/
  '';

  meta = with pkgs.stdenv.lib; {
    description = "BuildXSLT";
    homepage    = https://github.com/KnairdA/BuildXSLT/;
    license     = pkgs.stdenv.lib.licenses.mit;
  };
}
