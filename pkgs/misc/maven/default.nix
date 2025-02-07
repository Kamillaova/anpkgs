{stdenv, fetchurl, jdk}:

assert jdk != null;

stdenv.mkDerivation {
	name = "maven-2.0.3";
	mavenBinary = "mvn";
	builder = ./builder.sh;
	src = fetchurl {
		url = https://apache.cs.uu.nl/dist/maven/binaries/maven-2.0.3-bin.tar.bz2;
		md5 = "14b3a62c45f5c7b3a7f72f87ffadb8e0";
	};
	makeWrapper = ../../build-support/make-wrapper/make-wrapper.sh;
	
	inherit jdk;
}
