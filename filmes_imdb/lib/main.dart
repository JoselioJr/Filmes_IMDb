import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'services/hive_service.dart';
import 'screens/login_screen.dart';
import 'controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    
    return Obx(() => GetMaterialApp(
      title: 'Filmes IMDb',
      theme: themeController.lightTheme,
      darkTheme: themeController.darkTheme,
      themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    ));
  }
}
