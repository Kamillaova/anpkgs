{stdenv, fetchurl, aterm}:

stdenv.mkDerivation {
  name = "toolbuslib-0.5.1";
  src = fetchurl {
    url = https://www.cwi.nl/projects/MetaEnv/toolbuslib/toolbuslib-0.5.1.tar.gz;
    md5 = "1c7c7cce870f813bef60bbffdf061c90";
  };
  buildInputs = [aterm];
}

