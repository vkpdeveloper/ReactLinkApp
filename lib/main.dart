import 'package:flutter/material.dart';
import 'package:react_link_app/provider/userprovider.dart';
import 'package:react_link_app/utils/localstorage_utils.dart';
import 'package:react_link_app/views/splashscreen.dart';
import 'package:react_link_app/provider/plan_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageUtils().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlanProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(
              textTheme: GoogleFonts.montserratTextTheme(),
              primaryColor: Colors.deepPurpleAccent,
              accentColor: Colors.deepPurpleAccent),
          debugShowCheckedModeBanner: false,
          title: 'ReactLink',
          home: SplashScreen()),
    );
  }
}
