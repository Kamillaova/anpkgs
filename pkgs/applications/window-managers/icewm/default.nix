args: with args; stdenv.mkDerivation {
  name = "icewm";

  buildInputs = [ gettext libX11 libXft libXext libXinerama libXrandr libjpeg libtiff libungif libpng imlib ];

  src = fetchurl {
    url = https://mesh.dl.sourceforge.net/sourceforge/icewm/icewm-1.2.32.tar.gz;
    sha256 = "c2fe6ef0bdc0a9f841ae6fe214c06a15d666f90df027d105305f3e0dc109a667";
  };

  meta = {
    description = "IceWM is a window manager for the X Window System.";
    homepage = "https://www.icewm.org";
  };
}
