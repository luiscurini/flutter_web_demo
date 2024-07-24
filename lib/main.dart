import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'feature/overview/presentation/overview_page.dart';
import 'locator/locator.dart';

void main() => runAppWithInitialization();

Future<void> runAppWithInitialization() async {
  locator.initDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  // TODO Optional Step 5
  // Add navigation when clicking on the list item, so a detail page gets opened.

  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFDF0000)),
        useMaterial3: true,
      ),
      home: const OverviewPage(),
    );
  }
}
