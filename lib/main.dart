
import 'dart:io';
import 'package:window_manager/window_manager.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/utility/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'pages/main_screen.dart';
import 'services/di_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DIService.init();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(600.0, 800.0),
    // center: f,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
    windowButtonVisibility: true,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(MyApp());

  doWhenWindowReady(() {
    const initialSize = Size(408.0, 681.0);
    appWindow.minSize = initialSize;
    appWindow.size = Size(600.0, 800.0);
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(900, 1000),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            drawerTheme: const DrawerThemeData(
              shadowColor: Colors.white54,
              elevation: 25,
            ),
            cardTheme: CardTheme(
              color: secondaryColor,
              shadowColor: Colors.grey.shade300,
            ),
            scaffoldBackgroundColor: bgColor,
          ),
          home: MainScreen(),
          // routes: {
          //   SignUp.id: (_) => SignUp(),
          //   SignIn.id: (_) => SignIn(),
          // },
        );
      },
    );
  }
}
