{stdenv, fetchurl, ocaml, pkgconfig, gtk}:

stdenv.mkDerivation {
  name = "lablgtk-2.6.0";
  src = fetchurl {
    url = https://wwwfun.kurims.kyoto-u.ac.jp/soft/olabl/dist/lablgtk-2.6.0.tar.gz;
    sha256 = "3694bc1e288ce0903af6c96a2790d2340ba38fa51b18090062ede75137d97876";
  };

  buildInputs = [ocaml pkgconfig gtk];

  configureFlags = "--with-libdir=$(out)/lib/ocaml";
  buildFlags = "world";
}
