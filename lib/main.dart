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
  //Initializing the necessary components
  await Util.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Setting the provider
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
            Theme.of(context).textTheme,
          ),
        ),
        themeMode: ThemeController.to.themeMode,
        home: App(),
      ),
    );
  }
}
