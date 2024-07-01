import 'package:e_commerce/core/constants/theme.dart';
import 'package:e_commerce/core/helper/cache_helper.dart';
import 'package:e_commerce/core/routes/routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Giga Store',
          themeMode: ThemeMode.light,
          theme: lightTheme,
          darkTheme: darkTheme,
          initialRoute: Routes.splash,
          routes: Routes.getRoutes(),
        );
      },
    );
  }
}
