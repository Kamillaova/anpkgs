{stdenv, fetchurl, jre}:

stdenv.mkDerivation {
  name = "aspectj-1.5.2";
  builder = ./builder.sh;

  src = fetchurl {
    url = https://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/aspectj/aspectj-1.5.2.jar;
    md5 = "64245d451549325147e3ca1ec4c9e57c";
  };

  inherit jre;
  buildInputs = [jre];
}
