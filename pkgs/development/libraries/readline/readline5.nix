{ stdenv, fetchurl, ncurses }:

stdenv.mkDerivation {
  name = "readline-5.2";
  src = fetchurl {
    url = https://ftp.gnu.org/gnu/readline/readline-5.2.tar.gz;
    md5 = "e39331f32ad14009b9ff49cc10c5e751";
  };
  propagatedBuildInputs = [ncurses];
  patches = stdenv.lib.optional stdenv.isDarwin ./shobj-darwin.patch;
}
