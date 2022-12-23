
cd ../core/core_dependency
flutter clean
flutter pub get
cd ../core_package
flutter clean
flutter pub get
# cd ../core_runner
# flutter pub get
cd ../../features/home_feature
flutter clean
flutter pub get
cd ../profile_feature
flutter clean
flutter pub get
cd ../../app
flutter clean
flutter pub get
