import 'package:consforc/state/state.dart';
import 'package:consforc/ui/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Consforc',
        theme: ThemeData(
          fontFamily: 'satoshi'

        ),
        home:  BottomNavigationScreen(),
      ),
    );
  }
}
