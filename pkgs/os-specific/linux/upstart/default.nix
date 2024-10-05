{stdenv, fetchurl}:

stdenv.mkDerivation {
  name = "upstart-0.3.0";
  src = fetchurl {
    url = https://nixos.org/tarballs/upstart-0.3.0.tar.bz2;
    md5 = "269046f41c6418225306280044a799eb";
  };
  configureFlags = "--enable-compat";
  patches = [./cfgdir.patch];
  preBuild = "export NIX_CFLAGS_COMPILE=\"$NIX_CFLAGS_COMPILE -DSHELL=\\\"$SHELL\\\"\"";
}
