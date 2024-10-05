{stdenv, fetchurl}:

stdenv.mkDerivation {
  name = "rvvm-0-unstable-2024-10-4";
  src = fetchurl {
    url = https://github.com/LekKit/RVVM/archive/134a71859f6166320e75295c4f1bf4f82fd909d5.tar.gz;
    #hash = "sha256-vvDaP+M7HtVk3AW3ob+Jj8UBhHqyRJxNkvTCS7G+HG4=";
    impure = true;
  };
  buildInputs = [];

  __impure = true;
}
