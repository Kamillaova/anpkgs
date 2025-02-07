{stdenv, fetchurl, SDL, libogg, libvorbis}:

stdenv.mkDerivation {
  name = "SDL_mixer-1.2.7";
  src = fetchurl {
    url = https://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.7.tar.gz;
    md5 = "7959b89c8f8f1564ca90968f6c88fa1e";
  };
  buildInputs = [SDL libogg libvorbis];
  configureFlags = "--disable-music-ogg-shared";
}
