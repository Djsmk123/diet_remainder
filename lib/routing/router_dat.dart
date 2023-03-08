import 'package:auto_route/auto_route.dart';
import 'package:diet_remainder/view/home_screen/home_screen_view.dart';
import 'package:diet_remainder/view/intro_screen/intro_screen_view.dart';
import 'package:diet_remainder/view/register_screen/regiser_screen_view.dart';

@CustomAutoRouter(
    replaceInRouteName: 'Page,Route',
    transitionsBuilder: TransitionsBuilders.fadeIn,


    routes: <AutoRoute>[
      CustomRoute(
        page: IntroScreenView,
        path: '/intro',
        initial: true,
      ),
      CustomRoute(
        page: RegisterScreenView,
        path: '/register',

      ),
      CustomRoute(
        page: HomeScreen,
        path: '/home',
      ),

    ])
class $AppRouter {}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    bool isAuth = await Future.delayed(const Duration(seconds: 2), () => false);
    if (!isAuth) {
      resolver.next();
    } else {
      router.pushNamed('/home');
    }
  }
}
