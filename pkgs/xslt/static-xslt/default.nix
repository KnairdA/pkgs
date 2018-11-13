{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "static-xslt";

  src = fetchFromGitHub {
    owner = "KnairdA";
    repo  = "StaticXSLT";
    rev    = "0b84f519cb418d32c0fd62f9c6c852ee31f7c926";
    sha256 = "058kld9ysagzama0l6hnn6v6mm6jf29fbf78q0l92fxl0mlabd7n";
  };

  installPhase = ''
    mkdir $out
    cp -r * $out/
  '';

  meta = with stdenv.lib; {
    description = "StaticXSLT";
    homepage    = https://github.com/KnairdA/StaticXSLT/;
    license     = stdenv.lib.licenses.mit;
  };
}
