args:
args.stdenv.mkDerivation {
  name = "sbagen-1.4.4";

  buildPhases="buildPhase installPhase";

  buildPhase="./mk";

  installPhase="
    ensureDir \$out/{bin,share/sbagen/doc}
    cp -r --target-directory=\$out/share/sbagen examples scripts river1.ogg river2.ogg
    cp sbagen $out/bin
    cp --target-directory=\$out/share/sbagen/doc README.txt SBAGEN.txt theory{,2}.txt {wave,holosync,focus,TODO}.txt
  
   ";

  src = args.fetchurl {
    url = https://uazu.net/sbagen/sbagen-1.4.4.tgz;
    sha256 = "0w62yk1b0hq79kl0angma897yqa8p1ww0dwydf3zlwav333prkd2";
  };

  meta = { 
      description = "binaural sound generator";
      homepage = https://uazu.net/sbagen;
      license = "GPL";
    };
}
