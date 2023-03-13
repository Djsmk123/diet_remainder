import 'package:diet_remainder/core/theme.dart';
import 'package:diet_remainder/routing/router_dat.dart';
import 'package:diet_remainder/routing/router_dat.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'view_model/register_view_model/register_view_model_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(authGuard: AuthGuard());
    return ScreenUtilInit(
        designSize: const Size(380, 720),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) =>
            MultiBlocProvider(
                  providers: [
                 BlocProvider<RegisterViewModelBloc>(
                   create: (context) => RegisterViewModelBloc(),
                 ),
              ],
              child: MaterialApp.router(
                title: 'Diet Remainder',
                routerDelegate: appRouter.delegate(
              placeholder: (context) => Container(color: Colors.black)
          ),
                //useInheritedMediaQuery: true,
                debugShowCheckedModeBanner: false,
                theme:ThemeDateCustom.getTheme(),
                routeInformationParser: appRouter.defaultRouteParser(),
              ),
            ));
  }
}

/*flutter packages pub run build_runner clean*/

