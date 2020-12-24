import 'package:flikipedia/provider/search_provider.dart';
import 'package:flikipedia/screens/app.dart';
import 'package:flikipedia/utils/setup.dart';
import 'package:flutter/material.dart';
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
      // providers: [
      //   ChangeNotifierProvider(create: (_) => SearchProvider()),
      // ],
      create: (_) => SearchProvider(),
      child: MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        title: 'Flikipedia',
        theme: ThemeData(
          primaryColor: Colors.black,
          textTheme: GoogleFonts.ubuntuTextTheme(
            Theme.of(context).textTheme,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: App(),
      ),
    );
  }
}
