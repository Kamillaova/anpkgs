args:
args.stdenv.mkDerivation {
  name = "xclip-0.08";

  src = args.fetchurl {
    url = https://people.debian.org/~kims/xclip/xclip-0.08.tar.gz;
    sha256 = "0py6ijw7ln892gzxxm2w47nn97nb6psb8g6clkpz86gg706yjxpf";
  };

  patchPhase = "sed -i s=/usr/X11R6/bin=/bin=  Makefile";

  buildInputs =(with args; [x11 libXmu]);

  installPhase="make install DESTDIR=\$out";

  meta = { 
      description = "access X clipboard from this console application";
      homepage = https://people.debian.org/~kims/xclip/;
      license = "GPL-2";
  };
}
