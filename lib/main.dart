import 'package:diet_remainder/core/colors.dart';
import 'package:diet_remainder/view/register_screen/regiser_screen_view.dart';
import 'package:diet_remainder/view_model/register_view_model/register_view_model_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final appRouter = AppRouter();

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
              child: MaterialApp(
                title: 'Diet Remainder',
                /* routerDelegate: appRouter.delegate(
              placeholder: (context) => Container(color: Colors.black)
          ),*/
                //useInheritedMediaQuery: true,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  appBarTheme: AppBarTheme(
                    backgroundColor: ColorsScheme.kPrimaryColor,
                  ),
                  primaryColor: ColorsScheme.kPrimaryColor,
                  scaffoldBackgroundColor: Colors.white,
                  buttonTheme: ButtonThemeData(
                    buttonColor: ColorsScheme.kPrimaryColor,
                    textTheme: ButtonTextTheme.primary,
                  ),
                  textTheme: TextTheme(
                    displayMedium: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    displayLarge: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    displaySmall: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    titleMedium: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    titleLarge: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    titleSmall: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                home: const RegisterScreenView(),
                //routeInformationParser: appRouter.defaultRouteParser(),
              ),
            ));
  }
}
/*flutter packages pub run build_runner clean*/