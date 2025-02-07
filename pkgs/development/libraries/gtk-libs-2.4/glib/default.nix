{stdenv, fetchurl, pkgconfig, gettext, perl}:

assert pkgconfig != null && gettext != null && perl != null;

stdenv.mkDerivation {
  name = "glib-2.4.7";
  src = fetchurl {
    url = https://ftp.gtk.org/pub/gtk/v2.4/glib-2.4.7.tar.bz2;
    md5 = "eff6fec89455addf8b0dee5a19e343be";
  };
  buildInputs = [pkgconfig gettext perl];
}
