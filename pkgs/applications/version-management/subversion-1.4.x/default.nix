{ bdbSupport ? false
, httpServer ? false
, sslSupport ? false
, compressionSupport ? false
, pythonBindings ? false
, javahlBindings ? false
, stdenv, fetchurl, apr, aprutil, neon, zlib
, httpd ? null, expat, swig ? null, jdk ? null
}:

assert bdbSupport -> aprutil.bdbSupport;
assert httpServer -> httpd != null && httpd.expat == expat;
assert pythonBindings -> swig != null && swig.pythonSupport;
assert javahlBindings -> jdk != null;
assert sslSupport -> neon.sslSupport;
assert compressionSupport -> neon.compressionSupport;

stdenv.mkDerivation {
  name = "subversion-1.4.6";

  builder = ./builder.sh;
  src = fetchurl {
    url = https://subversion.tigris.org/downloads/subversion-1.4.6.tar.bz2;
    sha1 = "a9c941e2309744f6a2986200698b60da057a7527";
  };

  buildInputs =
    [expat zlib]
    ++ (if pythonBindings then [swig.python] else []);

  configureFlags = "
    --without-gdbm --disable-static
    --with-apr=${apr} -with-apr-util=${aprutil} --with-neon=${neon}
    --disable-keychain
    ${if bdbSupport then "--with-berkeley-db" else "--without-berkeley-db"}
    ${if httpServer then
        "--with-apxs=${httpd}/bin/apxs --with-apr=${httpd} --with-apr-util=${httpd}"
      else
        "--without-apxs"}
    ${if pythonBindings then "--with-swig=${swig}" else "--without-swig"}
    ${if javahlBindings then "--enable-javahl --with-jdk=${jdk}" else ""}
    --disable-neon-version-check
  ";

  inherit httpServer pythonBindings javahlBindings;

  meta = {
    description = "A version control system intended to be a compelling replacement for CVS in the open source community";
    homepage = https://subversion.tigris.org/;
  };
}
