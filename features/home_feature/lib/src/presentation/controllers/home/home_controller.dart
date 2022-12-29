import 'package:core_dependency/core_dependency.dart';
import 'package:home_feature/src/domain/model/task.dart';
import 'package:home_feature/src/domain/use_case/cache_homes_use_case.dart';
import 'package:home_feature/src/domain/use_case/fetch_home_use_case.dart';
import 'package:home_feature/src/domain/use_case/get_homes_cached_use_case.dart';

abstract class HomeController {
  RxList<Task> get rxTasks;
  Rx<HomeStateUI> get rxState;
}

enum HomeStateUI {
  idle,
  loading,
  loaded,
  error,
}

@Injectable(as: HomeController)
class HomeControllerImpl extends HomeController {
  final CacheTasksUseCase cacheHomes;
  final FetchHomesUseCase fetchHomes;
  final GetHomesCachedUseCase getHomeCached;

  @override
  final RxList<Task> rxTasks = RxList();
  @override
  final Rx<HomeStateUI> rxState = Rx(HomeStateUI.idle);

  HomeControllerImpl(this.cacheHomes, this.fetchHomes, this.getHomeCached) {
    initTesting();
  }

  Future<void> initTesting() async {
    rxState.value = HomeStateUI.loading;
    final result = await fetchHomes.execute();
    result.when(
      (homes) {
        rxTasks.value = homes;
        cacheHomes.execute(homes);
        rxState.value = HomeStateUI.loaded;
      },
      (error) {
        debugPrint(error.toString());
        rxState.value = HomeStateUI.error;
      },
    );
  }
}
