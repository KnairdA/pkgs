{ pkgs, ... }:

pkgs.stdenv.mkDerivation rec {
  name = "input-xslt";

  src = pkgs.fetchFromGitHub {
    owner = "KnairdA";
    repo = "InputXSLT";
    rev = "master";
    sha256 = "1p2y1m65h1k3g0nj8sgc05f9w880wngrd2n1b53dhhqq4scsj2a7";
  };

  buildInputs = with pkgs; [ cmake boost xalanc xercesc discount ];

  meta = with pkgs.stdenv.lib; {
    description = "InputXSLT";
    homepage    = https://github.com/KnairdA/InputXSLT/;
    license     = pkgs.stdenv.lib.licenses.asl20;
  };
}
