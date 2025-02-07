{ stdenv, fetchurl, ncurses }:

stdenv.mkDerivation {
  name = "readline-4.3";
  src = fetchurl {
    url = https://ftp.gnu.org/gnu/readline/readline-4.3.tar.gz;
    md5 = "f86f7cb717ab321fe15f1bbcb058c11e";
  };
  propagatedBuildInputs = [ncurses];
}
