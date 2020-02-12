#/bin/sh

# Install latest [hn](https://github.com/yayoc/hn) binary.

LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/yayoc/hn/releases/latest)
LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
ARTIFACT_URL="https://github.com/yayoc/hn/releases/download/$LATEST_VERSION/hn-macos.tar.gz"

wget $ARTIFACT_URL 
gunzip -c hn-macos.tar.gz | tar xopf -
rm hn-macos.tar.gz
mv hn ../bin
