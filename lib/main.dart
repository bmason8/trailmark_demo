import 'package:flutter/material.dart';
import 'settingsPage.dart';
import 'startPage.dart';
import 'syncPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trailmark Systems Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.deepPurple[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Trailmark Mobile Demo'),
      routes: {
        '/settingsPage': (context) => SettingsPage(),
        '/startPage': (context) => StartPage(),
        '/syncPage': (context) => SyncPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String startPageKey = 'startPage';
  final String syncPageKey = 'syncPage';
  final String settingsPageKey = 'settingsPage';

  // Creates the 3 buttons on the home screen
  Expanded generateHomeScreenBtns({String btnText, String route, Icon icon}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton.icon(
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/$route');
          },
          icon: icon,
          label: Text(
            btnText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'images/map.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 60.0),
              child: Divider(),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    generateHomeScreenBtns(
                        btnText: 'START',
                        route: startPageKey,
                        icon: Icon(Icons.map)),
                    generateHomeScreenBtns(
                        btnText: 'SYNC',
                        route: syncPageKey,
                        icon: Icon(Icons.sync)),
                    generateHomeScreenBtns(
                        btnText: 'SETTINGS',
                        route: settingsPageKey,
                        icon: Icon(Icons.settings)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
