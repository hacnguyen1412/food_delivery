import 'package:core_dependency/core_dependency.dart';
import 'package:app/core/route/app_router.dart';
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
