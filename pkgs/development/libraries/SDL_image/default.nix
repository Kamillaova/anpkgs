args:
args.stdenv.mkDerivation {
  name = "SDL_image-1.2.6";

  src = args.
	fetchurl {
		url = https://www.libsdl.org/projects/SDL_image/release/SDL_image-1.2.6.tar.gz;
		sha256 = "1i3f72dw3i3l6d77dk81gw57sp0629rng9k76qb37brlz7dv3z48";
	};

  buildInputs =(with args; [SDL libpng libjpeg libtiff libungif libXpm]);

  postInstall = "ln -s \${out}/include/SDL/SDL_image.h \${out}/include/";

  meta = {
    description = "
	SDL image library.
";
  };
}
