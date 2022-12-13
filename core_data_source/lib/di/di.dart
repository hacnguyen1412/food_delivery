import 'package:core_package/core_package.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies({GetIt? di}) async {
  final internalGetIt = di ?? getIt;
  $initGetIt(internalGetIt);
}
