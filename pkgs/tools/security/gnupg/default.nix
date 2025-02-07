{
  # Support for the IDEA cipher (used by the old PGP) should only be
  # enabled if it is legal for you to do so.
  ideaSupport ? false
  
, stdenv, fetchurl, readline
}:

stdenv.mkDerivation {
  name = "gnupg-1.4.8";
  builder = ./builder.sh;
  src = fetchurl {
    url = https://ftp.cert.dfn.de/pub/tools/crypt/gcrypt/gnupg/gnupg-1.4.8.tar.bz2;
    sha1 = "4b63267358e5c70f05b48e27d6877bad2636cabd";
  };
  buildInputs = [readline];
  idea = if ideaSupport then fetchurl {
    url = https://tarballs.nixos.org/idea.c.gz;
    md5 = "9dc3bc086824a8c7a331f35e09a3e57f";
  } else null;

  meta = {
    description = "A free implementation of the OpenPGP standard for encrypting and signing data";
    homepage = https://www.gnupg.org/;
  };
}
