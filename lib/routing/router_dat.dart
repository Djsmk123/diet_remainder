import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:diet_remainder/model/services/registration_service.dart';
import 'package:diet_remainder/model/user_model.dart';
import 'package:diet_remainder/view/home_screen/home_screen_view.dart';
import 'package:diet_remainder/view/intro_screen/intro_screen_view.dart';
import 'package:diet_remainder/view/register_screen/register_screen_view.dart';

@CustomAutoRouter(
    replaceInRouteName: 'Page,Route',
    transitionsBuilder: TransitionsBuilders.fadeIn,


    routes: <AutoRoute>[
      CustomRoute(
        page: IntroScreenView,
        path: '/intro',
        initial: true,
        guards: [AuthGuard],
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
  try{
    final UserServices userServices = UserServices();
    UserModel? userModel = await userServices.getUser();
    if (userModel != null) {
      router.pushNamed('/home');
    } else {
      resolver.next();
    }
  }catch(e){
    resolver.next();
  }
  }
}
