{stdenv, fetchurl, readline, ghc, perl, m4, gmp, ncurses}:

stdenv.mkDerivation (rec {
  name = "ghc-6.8.2";
  homepage = "https://www.haskell.org/ghc";

  src = map fetchurl [
    { url = "${homepage}/dist/stable/dist/${name}-src.tar.bz2";
      md5 = "745c6b7d4370610244419cbfec4b2f84";
    }
    { url = "${homepage}/dist/stable/dist/${name}-src-extralibs.tar.bz2";
      md5 = "d199c50814188fb77355d41058b8613c";
    }
  ];

  buildInputs = [ghc readline perl m4 gmp];

  setupHook = ./setup-hook.sh;

  meta = {
    description = "The Glasgow Haskell Compiler";
  };

  postInstall = "
    ensureDir \"$out/nix-support\"
    echo \"# Path to the GHC compiler directory in the store\" > $out/nix-support/setup-hook
    echo \"ghc=$out\" >> $out/nix-support/setup-hook
    echo \"\"         >> $out/nix-support/setup-hook
    cat $setupHook    >> $out/nix-support/setup-hook
  ";

  configureFlags="--with-gmp-libraries=${gmp}/lib --with-gmp-includes=${gmp}/include";

  preConfigure = "
    # still requires a hack for ncurses
    sed -i \"s|^\\\(ld-options.*$\\\)|\\\1 -L${ncurses}/lib|\" libraries/readline/readline.buildinfo.in
  ";

  inherit readline gmp ncurses;
})
