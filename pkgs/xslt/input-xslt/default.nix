{ stdenv, fetchFromGitHub, cmake, boost, xalanc, xercesc, discount }:

stdenv.mkDerivation rec {
  name = "input-xslt";

  src = fetchFromGitHub {
    owner = "KnairdA";
    repo = "InputXSLT";
    rev = "master";
    sha256 = "1p2y1m65h1k3g0nj8sgc05f9w880wngrd2n1b53dhhqq4scsj2a7";
  };

  buildInputs = [ cmake boost xalanc xercesc discount ];

  meta = with stdenv.lib; {
    description = "InputXSLT";
    homepage    = https://github.com/KnairdA/InputXSLT/;
    license     = stdenv.lib.licenses.asl20;
  };
}
