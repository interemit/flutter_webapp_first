import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// Meine Grundfragen:
// 3-Teilung einer Anwendung in View (z.B. HTML), Style (z.B. css) und Logik (z.B. Javascript)
// -> wie ist das bei einer Flutter-Anwendung?
// -> in diesem Beispiel scheint mir alles in einem
// -> View: Scaffold, Text, ...
// -> Style: am Widget lediglich Verweis auf eine Eigenschaft aus einem "Theme" (ähnlich wie css) -> Theme in Dart geschrieben
// -> Logik: ebenfalls Teil der State-Klasse (ähnlich wie WinForms)
//    -> Best practice scheint zu sein, Widget und Logik nicht zu trennen(?), dafür viele kleine Widgets /
//    -> oder halt doch irgendwie ViewModel -> aktuell noch unklar

// Unit-Tests gehen direkt auf die Widgets -> spezieller WidgetTester zum Simulieren von Klicks und Eingaben
// -> aus dieser Sicht erstmal kein ViewModel benötigt

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'My Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // Konstruktor mit optionalen Parametern durch geschwungene Klammern
  // -> durch "this." wird auch gleich der Wert gesetzt
  // -> Konstruktor wird ohne(!) new gerufen
  MyHomePage({Key key, this.title}) : super(key: key);

  // diese Klasse enthält nur die Felder, welche über den Konstruktor mitgegeben wurden
  // -> in diesem Fall der title
  // außerdem muss ein sogenannter "State" zurückgegeben werden, welcher das eigentliche
  // Aussehen der HomePage steuert -> diese State-Klasse ist meist private (_)
  // -> also die State-Klasse ist einfach eine Basisklasse, welche quasi "Databinding" unterstützt
  // -> über setState() kann dann das Widget immer wieder neu erstellt werden (nach Änderung von Daten im State)

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // setState ist gewissermaßen das NotifyPropertyChanged -> dadurch wird die build-Methode getriggert
    // -> dies ist angeblich nicht langsam, wenn alles immer wieder neu gebaut wird
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    // Scaffold ist wohl ein grundlegendes Layout
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter', // über String-Interpolation einfach den Counter ausgeben
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
