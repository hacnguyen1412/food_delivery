import 'package:core_package/core_package.dart';
import '../route/app_router.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies({GetIt? di}) async {
  final internaleGetIt = di ?? getIt;
  //only test
  await Future.delayed(const Duration(milliseconds: 300));
  internaleGetIt.registerLazySingleton<HomeAppRouter>(() => HomeAppRouter());
  $initGetIt(internaleGetIt);
}
