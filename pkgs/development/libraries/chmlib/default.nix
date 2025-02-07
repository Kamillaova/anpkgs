args: with args;

stdenv.mkDerivation rec {
  name = "chmlib-0.39";
  src = fetchurl {
    url = "${meta.homepage}/${name}.tar.bz2";
	sha256 = "0hgzw121ffmk79wbpkd0394y5ah99c3i85z6scp958mmkr25sc6j";
  };

  meta = {
	  homepage = https://www.jedrea.com/chmlib;
	  license = "LGPL";
	  description = "CHLIB is a library for dealing with Microsoft ITSS/CHM
	  format files";
  };
}
