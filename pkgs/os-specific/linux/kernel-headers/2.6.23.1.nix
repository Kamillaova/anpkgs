{stdenv, fetchurl}:

assert stdenv.isLinux;

stdenv.mkDerivation {
  name = "linux-headers-2.6.23.1";
  builder = ./builder.sh;
  src = fetchurl {
    url = "mirror://kernel/linux/kernel/v2.6/linux-2.6.23.1.tar.bz2";
    sha256 = "0737g83h7jbrlss8782b17mhc3nfn8qfbh5s71flz8pjxmbbmg1m";
  };

  platform = 
    if stdenv.system == "i686-linux" then "i386" else
    if stdenv.system == "x86_64-linux" then "x86_64" else
    if stdenv.system == "powerpc-linux" then "powerpc" else
    abort "don't know what the kernel include directory is called for this platform";

  extraIncludeDirs =
    if stdenv.system == "powerpc-linux" then ["ppc"] else [];
}
