{stdenv, fetchurl}:

stdenv.mkDerivation {
  name = "libmad-0.15.1b";
  src = fetchurl {
    url = https://ftp.mars.org/pub/mpeg/libmad-0.15.1b.tar.gz;
    md5 = "1be543bc30c56fb6bea1d7bf6a64e66c";
  };
}
