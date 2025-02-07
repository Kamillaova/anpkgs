{stdenv, fetchurl, pkgconfig, aterm}:

stdenv.mkDerivation {
  name = "stratego-libraries-0.17";
  src =
    fetchurl {
      url = https://www.cs.uu.nl/people/martin/stratego-libraries.tar.gz;
      md5 = "e99ce18179400c8ef373e8e668a4c576";
    };

  buildInputs = [pkgconfig aterm];

  configureFlags =
    if stdenv ? isMinGW && stdenv.isMinGW then "--with-std=C99" else "";

  # avoids loads of warnings about too big description fields because of a broken debug format
  CFLAGS =
    if stdenv ? isMinGW && stdenv.isMinGW then "-O2" else null;
}
