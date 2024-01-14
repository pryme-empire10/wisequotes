import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'provider/quote_provider.dart';
import 'responsive/responsive_layout.dart';
import 'screen/desktop/desktop_home_screen.dart';
import 'screen/mobile/home_screen.dart';
import 'screen/tablet/tablet_home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //  SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.landscapeRight,
  // ]);
  runApp(
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) => const MyApp(),
    // ),
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuoteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ResponsiveLayout(
          mobileScaffold: const HomeScreen(),
          tabletScaffold: const TabletHomeScreen(),
          deskScaffold: const DeskTopHomeScreen(),
        ),
      ),
    );
  }
}
