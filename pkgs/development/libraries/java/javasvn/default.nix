{stdenv, fetchurl, unzip} :

stdenv.mkDerivation {
  name = "javasvn-1.0.6";
  builder = ./builder.sh;

  src = fetchurl {
    url = https://tmate.org/svn/org.tmatesoft.svn_1.0.6.standalone.zip;
    md5 = "459cae849eceef04cd65fd6fb54affcc";
  };
  
  inherit unzip;
}
