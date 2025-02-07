{stdenv, fetchurl, m4}:

assert m4 != null;

stdenv.mkDerivation {
  name = "bison-1.875d";
  src = fetchurl {
    url = https://tarballs.nixos.org/bison-1.875d.tar.gz;
    md5 = "faaa4a271ca722fb6c769d72e18ade0b";
  };
  buildInputs = [m4];
} // {
  glrSupport = true;
}
