{stdenv, fetchurl}:

stdenv.mkDerivation {
  name = "freetype-2.3.1";
  src = fetchurl {
    url = https://download-mirror.savannah.gnu.org/releases/freetype/freetype-old/freetype-2.3.1.tar.bz2;
    sha256 = "0mb11mprdlcvxyjb62ganwfgvzg4kk3rmr677li8j0484b6ywf5y";
  };
}
