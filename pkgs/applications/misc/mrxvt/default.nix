args: with args.lib; with args;

let
  co = chooseOptionsByFlags {
    inherit args;
    flagDescr = {
      mandatory = { buildInputs = [ "libX11" ]; cfgOption = "--with-x"; };
      # many options to add here ... :)
      # many of them can be set by configuration file I think..
    };
};

in args.stdenv.mkDerivation {

  inherit (co) buildInputs configureFlags;

  src = args.fetchurl {
    url = mirror://sourceforge/materm/mrxvt-0.5.3.tar.gz;
    sha256 = "04flnn58hp4qvvk6jzyipsj13v1qyrjabgbw5laz5cqxvxzpncp2";
  };

  name = "mrxvt-0.5.3";

  meta = { 
    description = "multitabbed lightweight terminal emulator basd on rxvt supporting transparency, backgroundimages, freetype fonts,..";
    homepage = https://sourceforge.net/projects/materm;
    license = "GPL";
  };
}
