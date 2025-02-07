{stdenv, fetchurl, pcre}:

stdenv.mkDerivation {
  name = "gnugrep-2.5.1a";
  src = fetchurl {
    url = https://ftp.gnu.org/gnu/grep/grep-2.5.1a.tar.bz2;
    md5 = "52202fe462770fa6be1bb667bd6cf30c";
  };
  buildInputs = [pcre];
}
