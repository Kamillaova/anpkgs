args:
args.stdenv.mkDerivation {
  name = "radeontool-1.5";

  inherit (args) pciutils;

  # Don't know wether it's a good idea to hardcode the lspci path..
  # But it will work on nix..
  postUnpack = "
    cd $sourceRoot;
    sed -i \"s%lspci%\$pciutils/sbin/lspci%g\" radeontool.c
    cd ..
  ";

  src = args.fetchurl {
    url = https://fdd.com/software/radeon/radeontool-1.5.tar.gz;
    sha256 = "0qbkawhhq0y0gqbbql7q04y0v0hims5c4jkjsbc1y03rf9kr10ar";
  };

  installPhase = "
    ensureDir \$out/bin
    chmod +x lightwatch.pl
    cp radeontool lightwatch.pl \$out/bin
  ";

  meta = { 
      description = "Control the backlight and external video output of ATI Radeon Mobility graphics cards";
      homepage = https://fdd.com/software/radeon/;
      license = "ZLIB";
    };
}
