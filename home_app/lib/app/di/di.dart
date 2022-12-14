import 'package:core_data_source/core_data_source.dart' as local_data_source;
import 'package:core_package/core_package.dart';
import 'package:home_app/home_app.dart';
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
    local_data_source.configureDependencies(di: internalGetIt),
  ];
  await Future.wait(listConfig);
  internalGetIt.registerLazySingleton<HomeAppRouter>(() => HomeAppRouter());
  $initGetIt(internalGetIt);
}
