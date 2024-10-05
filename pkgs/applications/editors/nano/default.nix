{stdenv, fetchurl, ncurses, gettext}:

stdenv.mkDerivation {
  name = "nano-2.0.6";
  src = fetchurl {
    url = https://ftp.gnu.org/gnu/nano/nano-2.0.6.tar.gz;
    sha256 = "0p2xfs4jzj7dvp208qdrxij7x8gbwxgnrdm7zafgpbbg1bvxh40d";
  };
  buildInputs = [ncurses gettext];
  configureFlags = "--enable-tiny";
}
