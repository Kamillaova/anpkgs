{ stdenv, fetchurl, noSysDirs
, langC ? true, langCC ? true, langF77 ? false
}:

assert langC;

# !!! impurity: finds /usr/bin/as, /usr/bin/ranlib.

stdenv.mkDerivation {
  name = "gcc-3.3.6";
  builder = ./builder.sh;
  src = fetchurl {
    url = https://ftp.gnu.org/gnu/gcc/gcc-3.3.6/gcc-3.3.6.tar.bz2;
    md5 = "6936616a967da5a0b46f1e7424a06414";
  };
  inherit noSysDirs langC langCC langF77;
}
