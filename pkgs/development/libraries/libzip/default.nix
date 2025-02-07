args: with args;

stdenv.mkDerivation {
	name = "libzip-0.8";
	src = fetchurl {
		url = https://www.nih.at/libzip/libzip-0.8.tar.gz;
		sha256 = "0iy04c3b2yfwl9lpgwzm12qkdskbxj8l91r6mgn8f6ib00fj66ss";
	};
	configureFlags = "--enable-shared --disable-static";
	buildInputs = [zlib];

	meta = {
		homepage = https://www.nih.at/libzip;
		description = "A C library for reading, creating and modifying zip archives";
	};
}
