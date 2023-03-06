import 'package:flutter/material.dart';
import 'package:frosty_glass_app/logo/app_logo.dart';
import 'package:frosty_glass_app/splash/background_view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(title: 'Friend5hip'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87.withOpacity(0.5),
      body: Stack(
        children: const [
          BackgroundView(),
          AppLogo(),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
