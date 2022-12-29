
cd ../core/core_dependency
flutter clean
flutter pub get
cd ../core_package
flutter clean
flutter pub get
# flutter pub run build_runner build --delete-conflicting-outputs
cd ../core_router
flutter clean
flutter pub get
cd ../../features/home_feature
flutter clean
flutter pub get
# flutter pub run build_runner build --delete-conflicting-outputs
cd ../profile_feature
flutter clean
flutter pub get
# flutter pub run build_runner build --delete-conflicting-outputs
cd ../../app
flutter clean
flutter pub get
# flutter pub run build_runner build --delete-conflicting-outputs
