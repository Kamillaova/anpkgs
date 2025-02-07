{stdenv, fetchurl, flex, bison, zlib, libpng, ncurses, ed}:

stdenv.mkDerivation {
  name = "tetex-3.0";
  builder = ./builder.sh;
  
  src = fetchurl {
    url = https://cam.ctan.org/tex-archive/systems/unix/teTeX/current/distrib/tetex-src-3.0.tar.gz;
    md5 = "944a4641e79e61043fdaf8f38ecbb4b3";
  };

  texmf = fetchurl {
    url = https://cam.ctan.org/tex-archive/systems/unix/teTeX/current/distrib/tetex-texmf-3.0.tar.gz;
    md5 = "11aa15c8d3e28ee7815e0d5fcdf43fd4";
  };

  buildInputs = [flex bison zlib libpng ncurses ed];

  patches = [./environment.patch];

  setupHook = ./setup-hook.sh;

  meta = {
    description = "A full-featured (La)TeX distribution";
  };
}
