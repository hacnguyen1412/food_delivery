import 'package:core_package/core_package.dart' as core_package;
import 'package:core_dependency/core_dependency.dart';
import 'package:feature_home/feature_home.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies({GetIt? di}) async {
  final internalGetIt = di ?? getIt;
  List<Future> listConfig = [
    core_package.configureDependencies(di: internalGetIt),
  ];
  await Future.wait(listConfig);
  internalGetIt.registerLazySingleton<AppRouter>(() => AppRouter());
  $initGetIt(internalGetIt);
}
