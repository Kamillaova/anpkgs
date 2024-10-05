{stdenv, fetchurl, ncurses, libjpeg, e2fsprogs, zlib, openssl}:

stdenv.mkDerivation {
  name = "testdisk-6.8";
  
  src = fetchurl {
    url = https://www.cgsecurity.org/testdisk-6.8.tar.bz2;
    sha256 = "0cyqikcyi6zj671kkr8vydqskh2r7f3n1v3xks1vh1biaffqq2ir";
  };

  buildInputs = [ncurses libjpeg e2fsprogs zlib openssl];

  meta = {
    homepage = https://www.cgsecurity.org/wiki/TestDisk;
    license = "GPL";
    description = "
      TestDisk is a program for data recovery, primarily designed to
      help recover lost partitions and/or make non-booting disks
      bootable again
    ";
  };
}
