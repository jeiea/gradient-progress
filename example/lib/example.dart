import 'package:flutter/material.dart';
import 'package:gradient_progress/gradient_progress.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: GradientCircularProgressIndicator(
          gradientColors: [Colors.yellow, Colors.red],
          radius: 40,
          strokeWidth: 8.0,
          value: new Tween(begin: 0.0, end: 1.0)
              .animate(CurvedAnimation(
                parent: _animationController,
                curve: Curves.decelerate,
              ))
              .value,
        ),
      ),
    );
  }
}
