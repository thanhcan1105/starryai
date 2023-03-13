import 'package:get/get.dart';
import '../app/screens/create_prompt/create_prompt_screen.dart';
import '../app/bindings/my_creations_binding.dart';
import '../app/bindings/prompt_binding.dart';
import '../app/screens/my_creations/my_creations_screen.dart';
import '../app/bindings/explore_binding.dart';
import '../app/screens/explore/explore_screen.dart';
import '../app/bindings/splash_binding.dart';
import '../app/bindings/home_binding.dart';
import '../app/screens/bottom_menu/bottom_menu.dart';
import '../app/screens/home/home_screen.dart';
import '../app/screens/splash/splash_screen.dart';
part './routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      transition: Transition.cupertino,
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      transition: Transition.cupertino,
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.BOTTOMMENU,
      page: () => const BottomMenu(),
      transition: Transition.cupertino,
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.EXPLORE,
      page: () => const ExploreScreen(),
      transition: Transition.cupertino,
      binding: ExploreBinding(),
    ),
    GetPage(
      name: Routes.MYCREATIONS,
      page: () => const MyCreationsScreen(),
      transition: Transition.cupertino,
      binding: MyCreationsBinding(),
    ),
    GetPage(
      name: Routes.CREATEPROMPT,
      page: () => const CreatePromptScreen(),
      transition: Transition.cupertino,
      binding: CreatePromptBinding(),
    ),
  ];
}
