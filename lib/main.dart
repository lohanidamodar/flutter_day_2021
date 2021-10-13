import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_day_2021/pages/home.dart';
import 'package:flutter_day_2021/pages/login.dart';
import 'package:flutter_day_2021/pages/signup.dart';
import 'package:flutter_day_2021/res/styles.dart';
import 'package:flutter_day_2021/services/db_service.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlAppwrite Jobs',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        primarySwatch: primaryScheme,
        textTheme: ThemeData.dark().textTheme.copyWith(
              headline4: ThemeData.dark().textTheme.headline4?.copyWith(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
              headline5: ThemeData.dark().textTheme.headline5?.copyWith(
                    fontSize: 34,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
              headline6: ThemeData.dark().textTheme.headline6?.copyWith(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
              subtitle1: ThemeData.dark().textTheme.subtitle1?.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
              bodyText1: ThemeData.dark().textTheme.bodyText1?.copyWith(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
            ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: const Color(0xff1E1C24),
          margin: const EdgeInsets.all(16.0),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xff1E1C24),
          contentPadding: const EdgeInsets.all(20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              color: Color(0xff312E38),
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              color: Color(0xff312E38),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 2,
            ),
          ),
          labelStyle: const TextStyle(
            color: Color(0xffA5A2AE),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            fixedSize: const Size(0, 60),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 16.0,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
      ),
      home: FutureBuilder(
          future: DBService.instance.isLoggedIn(),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData && snapshot.data!) {
              return const HomePage();
            }
            return const WelcomePage();
          }),
      routes: {
        '/login': (context) => const WelcomePage(),
        '/home': (context) => const HomePage(),
        '/signup': (context) => const SignupPage(),
      },
    );
  }
}
