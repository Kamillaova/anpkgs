args:
with args;
args.stdenv.mkDerivation {
  name = "ndiswrapper-1.49-stable";

  # need at least .config and include 
  inherit kernel;

  buildPhase = "
    make KBUILD=\$kernel/lib/modules/*/build;
  ";

  # should we use unstable? 
  src = args.fetchurl {
    url = https://kent.dl.sourceforge.net/sourceforge/ndiswrapper/ndiswrapper-1.49.tar.gz;
    sha256 = "1b9nqkk7gv6gffzj9b8mjy5myxf2afwpyr2n5wbfsylf15dvvvjr";
  };

  buildInputs =(with args; [kernelHeaders kernel]);

  meta = { 
      description = "Ndis driver wrapper for the Linux kernel";
      homepage = https://sourceforge.net/projects/ndiswrapper;
      license = "GPL";
  };
}
