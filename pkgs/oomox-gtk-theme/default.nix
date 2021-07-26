{ stdenv, pkgs, theme, ... }:

stdenv.mkDerivation rec {
  name = "oomox-gtk-theme";

  src = pkgs.fetchFromGitHub {
    repo   = "oomox-gtk-theme";
    owner  = "themix-project";
    rev    = "561b00a1197afb34fbf6043102d59498cf01ff55";
    sha256 = "1ch1amcfg721cd7n5jnyw9cbb54qma3da0inh8mg8s34pnqb2vwj";
  };

  nativeBuildInputs = with pkgs; [ librsvg glib libxml2 gdk_pixbuf bc sass sassc ];
  propagatedUserEnvPkgs = with pkgs; [ gtk-engine-murrine ];

  config = with theme; ''
    ACCENT_BG=${accent_bg}
    BG=${bg}
    FG=${fg}
    BTN_BG=${btn_bg}
    BTN_FG=${btn_fg}
    CARET1_FG=${caret1_fg}
    CARET2_FG=${caret2_fg}
    HDR_BTN_BG=${hdr_btn_bg}
    HDR_BTN_FG=${hdr_btn_fg}
    MENU_BG=${menu_bg}
    MENU_FG=${menu_fg}
    SEL_BG=${sel_bg}
    SEL_FG=${sel_fg}
    TXT_BG=${txt_bg}
    TXT_FG=${txt_fg}
    WM_BORDER_FOCUS=${wm_border_focus}
    WM_BORDER_UNFOCUS=${wm_border_unfocus}
    GTK3_GENERATE_DARK=${if gtk3_generate_dark then "True" else "False"}
    CARET_SIZE=${toString caret_size}
    GRADIENT=${toString gradient}
    ROUNDNESS=${toString roundness}
    SPACING=${toString spacing}
    GTK2_HIDPI=${if gtk2_hidpi then "True" else "False"}
  '';

  postPatch = ''
    patchShebangs .
  '';

  buildPhase = ''
    HOME="$out/share/themes/oomox"
    ./change_color.sh --make-opts all --target-dir "$out/share/themes" --output oomox <(echo -e "${config}")
  '';

  installPhase = ''
    cd oomox-gtk-theme-*
  '';

  meta = {
    description = "oomox-gtk-theme is a customizable fork of numix-gtk-theme.";
    homepage = https://github.com/themix-project/oomox-gtk-theme;
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.all;
  };
}
