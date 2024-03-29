{ pkgs, ... }:

let
  katex-src = pkgs.stdenv.mkDerivation rec {
    name = "katex-src";

    src = pkgs.fetchzip {
      url    = "https://github.com/KaTeX/KaTeX/releases/download/v0.10.0/katex.tar.gz";
      sha256 = "0knmbzpqikw8iafsxnar96kxp0z0vdxng9bfzzrvqkbsxfs59cfy";
    };

    buildInputs = [ pkgs.nodejs ];

    installPhase = ''
      mkdir -p $out/share/katex
      cp katex.min.js $out/share/katex/
    '';

    meta = {
      description = "KaTeX";
      homepage    = https://github.com/Khan/KaTeX;
      license     = pkgs.stdenv.lib.licenses.mit;
      platforms   = pkgs.stdenv.lib.platforms.all;
    };
  };

in pkgs.writeTextFile {
  name        = "katex-wrapper";
  executable  = true;
  destination = "/bin/katex";

  text = ''
    #!${pkgs.nodejs}/bin/node

    var katex = require("${katex-src}/share/katex/katex.min.js");
    var input = "";

    var args = process.argv.slice(2);

    process.stdin.on("data", function(chunk) {
        input += chunk.toString();
    });

    process.stdin.on("end", function() {
        var options = {
            displayMode: args.indexOf("--display-mode") !== -1,
            throwOnError: false
        };
        var output = katex.renderToString(input, options);
        console.log(output);
    });
  '';
}
