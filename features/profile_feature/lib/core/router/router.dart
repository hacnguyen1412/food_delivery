import 'package:core_dependency/core_dependency.dart';
import 'package:profile_feature/profile_feature.dart';
import 'package:core_router/core_router.dart';
part 'router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: ProfileScreen),
  ],
)
class ProfileFeatureRouter extends _$ProfileFeatureRouter {}
