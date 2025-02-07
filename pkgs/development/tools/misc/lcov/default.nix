{stdenv, fetchurl, perl}:

stdenv.mkDerivation {
  name = "lcov-1.4pre-cvs-20041021";
  builder = ./builder.sh;
  src = fetchurl {
    url = https://tarballs.nixos.org/lcov-1.4pre-cvs-20041021.tar.gz;
    md5 = "5150da759b4047b19d026c6ab1216841";
  };
  patches = [./lcov.patch];
  inherit perl;
}
