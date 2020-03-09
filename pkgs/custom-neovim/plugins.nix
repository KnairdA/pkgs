{ pkgs, fetchgit }:

let
  buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
in {

  vim-unimpaired = buildVimPlugin {
    name = "vim-unimpaired";
    src  = fetchgit {
      url    = "https://github.com/tpope/vim-unimpaired";
      rev    = "bacf1543cc957d47aa70c1dc0bcf99392925b008";
      sha256 = "0jx9xybjswnaa6v7hhfqm2nyd5v54xjd02ikw56wm7h6sfgchllx";
    };
  };

  vim-counterpoint = buildVimPlugin {
    name = "vim-counterpoint";
    src  = fetchgit {
      url    = "https://github.com/jpetrie/vim-counterpoint";
      rev    = "93d8fd9d18a378ab3db39411300716129358211c";
      sha256 = "02spr4mhj2035q45j8bf502jgpq76a518nv913zx46byfbl69lps";
    };
  };

  vim-mundo = buildVimPlugin {
    name = "vim-mundo";
    src  = fetchgit {
      url    = "https://github.com/simnalamburt/vim-mundo";
      rev    = "v3.0.1";
      sha256 = "052ywnd5r6ksiz1lsyqya9b94fdb0gr7krkdpc1gw1fx11qk5x2v";
    };
  };

  vim-toggle-ui-elements = buildVimPlugin {
    name = "vim-toggle-ui-elements";
    src  = fetchgit {
      url    = "https://github.com/muellan/vim-toggle-ui-elements";
      rev    = "325f60fe8030cc2a2312d67191f214c5c39ef283";
      sha256 = "0fl9kvp799l3nzy8lnjcb0y1hr3g1ba8n9v2mx83yaqdma0rvhi1";
    };
  };

  vim-wordmotion = buildVimPlugin {
    name = "vim-wordmotion";
    src = fetchgit {
      url    = "https://github.com/chaoren/vim-wordmotion.git";
      rev    = "e0a7bc3a27802803788741802113ff2781235951";
      sha256 = "1k1mlhy9z96wx3l4ijvndm3d9il82qg8xgawck4sc0hr7yxvg4ap";
    };
  };

  gina = buildVimPlugin {
    name = "gina";
    src = fetchgit {
      url    = "https://github.com/lambdalisue/gina.vim.git";
      rev    = "v1.0.0";
      sha256 = "0dd8kn54a17qi73namkbdw0gaskddy9krhrzcqp6x9cjinvjyrhv";
    };
  };

  vim-sandwich = buildVimPlugin {
    name = "vim-sandwich";
    src = fetchgit {
      url    = "https://github.com/machakann/vim-sandwich.git";
      rev    = "d441cf5a450f65dbf95eca3fa1138806884a7d58";
      sha256 = "1qkadkisfw21834848rphliry5h6h9mj010n2p3y27wp6xkq9phj";
    };
  };

  vim-swoop = buildVimPlugin {
    name = "vim-swoop";
    src = fetchgit {
      url    = "https://github.com/pelodelfuego/vim-swoop.git";
      rev    = "99c9a7a40d34f89391fc0ac2a9f0260dd73a7d51";
      sha256 = "1ghc8s5309pvc7w30jn1gm2qn0zfbkhm1nrdbk9d34zda4sq0jfv";
    };
  };

  vim-color-akr = buildVimPlugin {
    name = "vim-color-akr";
    src  = ./asset/vim-color-akr;
  };

}
