#
# Copy and paste the lines below to install the latest 64-bit set.
#
BOOTSTRAP_TAR="bootstrap-trunk-x86_64-20201019.tar.gz"
BOOTSTRAP_SHA="127d6a561d6ae4ce07cdb87e3dd185b837f6cc18"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
[ "${BOOTSTRAP_SHA}" = "$(/bin/digest -a sha1 ${BOOTSTRAP_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}.asc
curl -sS https://pkgsrc.joyent.com/pgp/DE817B8E.asc | gpg2 --import
gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to /opt/local
tar -zxpf ${BOOTSTRAP_TAR} -C /

# Add to PATH/MANPATH.
PATH=/opt/local/sbin:/opt/local/bin:$PATH
MANPATH=/opt/local/man:$MANPATH
