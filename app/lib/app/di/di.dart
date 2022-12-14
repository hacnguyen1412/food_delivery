import 'package:core_package/core_package.dart';
import 'package:app/app/route/app_router.dart';
import 'di.config.dart';
import 'package:feature_home/feature_home.dart' as feature_home;

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async {
  List<Future> listConfig = [
    feature_home.configureDependencies(di: getIt),
  ];
  await Future.wait(listConfig);
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  $initGetIt(getIt);
}
