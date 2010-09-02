USER_WORKSPACE=/ryancanulla/workspaces/air-for-android/flying-through-space
ANDROID_SDK=/ryancanulla/sdks/android-sdk-mac_86
AIR_SDK=/Applications/AdobeFlashBuilder4/sdks/flex_sdk_4.1.0_Air2.5

$AIR_SDK/bin/amxmlc -target-player 10.1.0 -debug=true src/Main.as

$AIR_SDK/bin/adt -package -target apk-debug -connect 192.168.1.107 -storetype pkcs12 -keystore $USER_WORKSPACE/cert.p12 -storepass Summer855 FlyingThroughSpace.apk src/Main-app.xml src/Main.swf assets

$ANDROID_SDK/tools/adb -d install -r FlyingThroughSpace.apk

