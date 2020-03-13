import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Alignment childAlignment = Alignment.center;
  void initState() {
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          childAlignment = visible ? Alignment.topCenter : Alignment.center;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        curve: Curves.easeOut,
        duration: Duration(
          milliseconds: 400,
        ),
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        alignment: childAlignment,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Let\'s start your search',
              style: TextStyle(fontSize: 30),
            ),
            TextField(
              decoration: InputDecoration(hasFloatingPlaceholder: true, hintText: 'Enter things here'),
            )
          ],
        ),
      ),
    );
  }
}
