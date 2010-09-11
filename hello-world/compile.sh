USER_WORKSPACE=/ryancanulla/workspaces/air-for-android/hello-world
ANDROID_SDK=/ryancanulla/sdks/android-sdk-mac_86
AIR_SDK="/Applications/Adobe Flash Builder 4/sdks/flex_sdk_4.1.0_Air2.5"

"$AIR_SDK/bin/amxmlc" -target-player 10.1.0 -debug=true src/HelloWorld.as

"$AIR_SDK/bin/adt" -package -target apk-debug -connect 192.168.1.107 -storetype pkcs12 -keystore $USER_WORKSPACE/cert.p12 -storepass Summer855 HelloWorld.apk src/HelloWorld-app.xml src/HelloWorld.swf assets

$ANDROID_SDK/tools/adb -d install -r HelloWorld.apk

