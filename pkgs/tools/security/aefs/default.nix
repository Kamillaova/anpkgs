{stdenv, fetchurl, fuse}:
  
stdenv.mkDerivation {
  name = "aefs-0.3pre285";
  
  src = fetchurl {
    url = https://nixos.org/tarballs/aefs-0.3pre285.tar.bz2;
    sha256 = "1psciqllzm08c21h6k2zxmvmi0grkvaiq177giv1avzzzfhq0z3c";
  };

  buildInputs = [fuse];
}
