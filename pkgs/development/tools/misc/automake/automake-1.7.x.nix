{stdenv, fetchurl, perl, autoconf}:

stdenv.mkDerivation {
  name = "automake-1.7.9";
  builder = ./builder.sh;
  setupHook = ./setup-hook.sh;
  src = fetchurl {
    url = https://tarballs.nixos.org/automake-1.7.9.tar.bz2;
    md5 = "571fd0b0598eb2a27dcf68adcfddfacb";
  };
  buildInputs = [perl autoconf];
}
