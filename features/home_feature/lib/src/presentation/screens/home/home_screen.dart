import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:flutter/material.dart';
import 'package:home_feature/core/router/router.dart';
import 'package:home_feature/core/di/di.dart';
import 'package:home_feature/src/presentation/controllers/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = getIt<HomeController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home screen"),
        ),
        body: Obx(() {
          final state = controller.rxState.value;
          switch (state) {
            case HomeStateUI.idle:
            case HomeStateUI.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case HomeStateUI.loaded:
              final homes = controller.rxHomes;
              return ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: homes.length,
                itemBuilder: (context, index) {
                  final home = homes[index];
                  return Row(
                    children: [
                      // Container(
                      //   width: 40,
                      //   decoration: BoxDecoration(
                      //     shape: BoxShape.circle,
                      //     color: Colors.grey.shade300,
                      //   ),
                      //   child: CachedNetworkImage(imageUrl: home.avatar),
                      // ),
                      Text(home.name),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 0.5,
                    color: Colors.grey.shade300,
                  );
                },
              );

            default:
              return const Text("Error");
          }
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getIt<AppRouter>().router.push(
                  const BannerRoute(),
                );
          },
        ),
      ),
    );
  }
}
