{stdenv, fetchurl, unzip, ghc, wxGTK}:

stdenv.mkDerivation {
  name = "wxHaskell-0.10.1-pre20070124";
  src = fetchurl {
    url = https://nixos.org/tarballs/wxhaskell-src-0.10.1-pre20070124.tar.bz2;
    sha256 = "1cl0yd3blynjslzz05312bzg1dbymmj8pg88bhnr4p3rqxrlmhx9";
  };
  buildInputs = [unzip ghc wxGTK];
  postInstall = "
    make wx
    make wx-install
  ";
}
