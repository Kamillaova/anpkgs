{stdenv, fetchurl, perl, ghc}:

stdenv.mkDerivation {
  name = "happy-1.14";
  src = fetchurl {
    url = https://www.haskell.org/happy/dist/1.14/happy-1.14-src.tar.gz;
    md5 = "501b5b63533b2e2838de18085e8c4492";
  };
  buildInputs = [ghc perl];
}
