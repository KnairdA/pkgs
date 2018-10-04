{ stdenv, fetchFromGitHub, cmake, boost, xalanc, xercesc, discount }:

stdenv.mkDerivation rec {
  name = "input-xslt";

  src = fetchFromGitHub {
    owner = "KnairdA";
    repo = "InputXSLT";
    rev = "master";
    sha256 = "1pjhq1jjfdhd0k3fckvir465l34wkbvqp47r7r6qdd93fg6kw3x8";
  };

  buildInputs = [ cmake boost xalanc xercesc discount ];

  meta = with stdenv.lib; {
    description = "InputXSLT";
    homepage    = https://github.com/KnairdA/InputXSLT/;
    license     = stdenv.lib.licenses.asl20;
  };
}
