import 'package:core_package/core_package.dart';
import '../app/route/app_router.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async {
  getIt.registerLazySingleton<HomeAppRouter>(() => HomeAppRouter());
  $initGetIt(getIt);
}
