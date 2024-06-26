#!/bin/sh
set -o xtrace
set -e
ls -al

echo $CERT > encoded
base64 --decode encoded -o pipe.p12

MY_KEYCHAIN="MyKeychain.keychain"
MY_KEYCHAIN_PASSWORD="temporaryPassword"
CERT="pipe.p12"
CERT_PASSWORD=""

set +e
security delete-keychain "$MY_KEYCHAIN" "Delete also initially"
set -e

security create-keychain -p "$MY_KEYCHAIN_PASSWORD" "$MY_KEYCHAIN" # Create temp keychain
security list-keychains -d user -s "$MY_KEYCHAIN" $(security list-keychains -d user | sed s/\"//g) # Append temp keychain to the user domain
security set-keychain-settings "$MY_KEYCHAIN" # Remove relock timeout
security unlock-keychain -p "$MY_KEYCHAIN_PASSWORD" "$MY_KEYCHAIN" # Unlock keychain
security import $CERT -k "$MY_KEYCHAIN" -P "$CERT_PASSWORD" -T "/usr/bin/codesign" # Add certificate to keychain
CERT_IDENTITY=$(security find-identity -v -p codesigning "$MY_KEYCHAIN" | head -1 | grep '"' | sed -e 's/[^"]*"//' -e 's/".*//') # Programmatically derive the identity
CERT_UUID=$(security find-identity -v -p codesigning "$MY_KEYCHAIN" | head -1 | grep '"' | awk '{print $2}') # Handy to have UUID (just in case)
security set-key-partition-list -S apple-tool:,apple: -s -k $MY_KEYCHAIN_PASSWORD -D "$CERT_IDENTITY" -t private $MY_KEYCHAIN # Enable codesigning from a non user interactive shell

echo "${SUDO}" | sudo -S rm -rf GlamorousToolkitOSX64*/
unzip GlamorousToolkitOSX64.zip
rm GlamorousToolkitOSX64.zip

codesign --entitlements scripts/resources/Product.entitlements  --force -v --options=runtime  --deep --timestamp --file-list - -s "$SIGNING_IDENTITY" GlamorousToolkitOSX64*/GlamorousToolkit.app
codesign --entitlements scripts/resources/Product.entitlements  --force -v --options=runtime  --deep --timestamp --file-list - -s "$SIGNING_IDENTITY" GlamorousToolkitOSX64*/*.dylib 

ditto -c -k --sequesterRsrc --keepParent GlamorousToolkitOSX64*/ GlamorousToolkitOSX64.zip

xcrun altool -t osx -f GlamorousToolkitOSX64.zip -itc_provider "77664ZXL29" --primary-bundle-id "com.feenk.gtoolkit" --notarize-app --verbose  --username "george.ganea@feenk.com" --password "${APPLEPASSWORD}"

security delete-keychain "$MY_KEYCHAIN" # Delete temporary keychain
