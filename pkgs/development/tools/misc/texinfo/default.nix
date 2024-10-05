{stdenv, fetchurl, ncurses}:

stdenv.mkDerivation {
  name = "texinfo-4.11";
  src = fetchurl {
    url = https://ftp.gnu.org/gnu/texinfo/texinfo-4.11.tar.bz2;
    sha256 = "1xzmjbrgf5l9c5ckglgsclalmz32m5nfdkn71b4adiwafx43s0v1";
  };
  buildInputs = [ncurses];
}
