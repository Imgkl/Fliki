import 'package:flikipedia/provider/search_provider.dart';
import 'package:flikipedia/screens/app.dart';
import 'package:flikipedia/utils/setup.dart';
import 'package:flikipedia/utils/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  await Util.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchProvider(),
      child: GetMaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        title: 'Flikipedia',
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.black,
          textTheme: GoogleFonts.ubuntuTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.black,
          textTheme: GoogleFonts.ubuntuTextTheme(
            Theme.of(context).textTheme.copyWith(),
          ),
        ),
        themeMode: ThemeController.to.themeMode,
        // theme: ThemeData(
        //   canvasColor: Colors.white,
        //   primaryColor: Colors.black,

        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        // ),
        home: App(),
      ),
    );
  }
}

// //STEP 9 - add our ThemeController
// class ThemeController extends GetxController {
//   static ThemeController get to => Get.find();

//   SharedPreferences prefs;
//   ThemeMode _themeMode;
//   ThemeMode get themeMode => _themeMode;

//   Future<void> setThemeMode(ThemeMode themeMode) async {
//     Get.changeThemeMode(themeMode);
//     _themeMode = themeMode;
//     update();
//     prefs = await SharedPreferences.getInstance();
//     await prefs.setString('theme', themeMode.toString().split('.')[1]);
//   }

//   getThemeModeFromPreferences() async {
//     ThemeMode themeMode;
//     prefs = await SharedPreferences.getInstance();
//     String themeText = prefs.getString('theme') ?? 'system';
//     try {
//       themeMode =
//           ThemeMode.values.firstWhere((e) => describeEnum(e) == themeText);
//     } catch (e) {
//       themeMode = ThemeMode.system;
//     }
//     setThemeMode(themeMode);
//   }
// }
