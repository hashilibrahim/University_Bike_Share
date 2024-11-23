import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uni_bike/app/utils/app_constants.dart';

import 'app/core/app_router.dart';
import 'app/modules/auth/view/splash_screen.dart';
import 'app/utils/extensions.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                Responsive().init(constraints, orientation);
                return MaterialApp(
                  scaffoldMessengerKey: Routes.ctx,
                  navigatorKey: Routes.key,
                  title: 'Uni Bike',
                  theme: ThemeData(
                    fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
                    primarySwatch: Colors.amber,
                    useMaterial3: true,
                  ),
                  debugShowCheckedModeBanner: false,
                  home: const SplashScreen(),
                );
              },
            );
          },
        );
      },
    );
  }
}
