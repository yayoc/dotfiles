#/bin/sh

# Install latest [hn](https://github.com/yayoc/hn) binary.

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    OS="linux"
    # install libssl1.1
    wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb
    sudo dpkg -i libssl1.1_1.1.0g-2ubuntu4_amd64.deb
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
else
    echo "Unknown"
    exit 1
fi

LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/yayoc/hn/releases/latest)
LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
ARTIFACT_URL="https://github.com/yayoc/hn/releases/download/$LATEST_VERSION/hn-$OS.tar.gz"

wget $ARTIFACT_URL 
gunzip -c hn-$OS.tar.gz | tar xopf -
rm hn-$OS.tar.gz
mv hn ../bin
