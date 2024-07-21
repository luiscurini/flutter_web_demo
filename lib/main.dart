import 'package:flutter/material.dart';

import 'feature/overview/presentation/overview_page.dart';
import 'locator/locator.dart';

void main() => runAppWithInitialization();

Future<void> runAppWithInitialization() async {
  locator.initDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  // TODO Step 4.
  // Make the app responsive by using the reponsive_framework
  // Library. See: https://github.com/Codelessly/ResponsiveFramework
  // If the screen size is smaller than DESKTOP, then display another widget in
  // the OverviewIdleWidget instead of the Desktop one.
  // The Map should be show above and the list of restaurants below but as an
  // horizontal one.

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFDF0000)),
        useMaterial3: true,
      ),
      home: const OverviewPage(),
    );
  }
}
