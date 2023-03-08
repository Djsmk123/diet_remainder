// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../view/home_screen/home_screen_view.dart' as _i3;
import '../view/intro_screen/intro_screen_view.dart' as _i1;
import '../view/register_screen/regiser_screen_view.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    IntroScreenView.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.IntroScreenView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterScreenView.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterScreenView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeScreen.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/intro',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          IntroScreenView.name,
          path: '/intro',
        ),
        _i4.RouteConfig(
          RegisterScreenView.name,
          path: '/register',
        ),
        _i4.RouteConfig(
          HomeScreen.name,
          path: '/home',
        ),
      ];
}

/// generated route for
/// [_i1.IntroScreenView]
class IntroScreenView extends _i4.PageRouteInfo<void> {
  const IntroScreenView()
      : super(
          IntroScreenView.name,
          path: '/intro',
        );

  static const String name = 'IntroScreenView';
}

/// generated route for
/// [_i2.RegisterScreenView]
class RegisterScreenView extends _i4.PageRouteInfo<void> {
  const RegisterScreenView()
      : super(
          RegisterScreenView.name,
          path: '/register',
        );

  static const String name = 'RegisterScreenView';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreen extends _i4.PageRouteInfo<void> {
  const HomeScreen()
      : super(
          HomeScreen.name,
          path: '/home',
        );

  static const String name = 'HomeScreen';
}
