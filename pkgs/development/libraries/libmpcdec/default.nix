{stdenv, fetchurl}:

stdenv.mkDerivation {
  name = "libmpcdec-1.2.2";
  src = fetchurl {
    url = https://files2.musepack.net/source/libmpcdec-1.2.2.tar.bz2;
    md5 = "f14e07285b9b102a806649074c1d779b";
  };
}
