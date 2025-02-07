{stdenv, fetchurl}:

stdenv.mkDerivation {
  name = "aterm-2.4.2-fixes-r2";
  src = fetchurl {
    url = https://nixos.org/tarballs/aterm-2.4.2-fixes-r2.tar.bz2;
    sha256 = "1w3bxdpc2hz29li5ssmdcz3x0fn47r7g62ns0v8nazxwf40vff4j";
  };
  meta = {
    homepage = https://www.cwi.nl/htbin/sen1/twiki/bin/view/SEN1/ATerm;
    license = "LGPL";
    description = "Library for manipulation of term data structures in C";
  };
}
