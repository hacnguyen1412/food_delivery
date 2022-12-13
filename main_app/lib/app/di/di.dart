import 'package:core_package/core_package.dart';
import 'package:main_app/app/route/app_router.dart';
import 'di.config.dart';
import 'package:home_app/home_app.dart' as home_app;

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async {
  await home_app.configureDependencies(di: getIt);
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());

  $initGetIt(getIt);
}
