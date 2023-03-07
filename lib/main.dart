import 'dart:async';

import 'package:flutter/material.dart';
import 'package:js/js.dart' as js;
import 'package:js/js_util.dart' as js_util;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'flutter remodeling'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

@js.JSExport()
class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  @override
  void initState() {
    final export = js_util.createDartExport(this);
    final setThemeColorToExport = js_util.allowInterop(increment);
    js_util.setProperty(js_util.globalThis, 'myAppState', export);
    js_util.setProperty(
        js_util.globalThis, 'setThemeColor', setThemeColorToExport);
    // js_util.setProperty(js_util.globalThis, '_appState', export);
    // js_util.callMethod<void>(js_util.globalThis, '_stateSet', []);
    super.initState();
  }

  @js.JSExport()
  void increment() {
    setState(() {
      counter++;
    });
    js_util.callMethod<void>(js_util.globalThis, 'setCounter', [counter]);
  }

  final _streamController = StreamController<void>.broadcast();

  @js.JSExport()
  void addHandler(void Function() handler) {
    // This registers the handler we wrote in [js/js-interop.js]
    _streamController.stream.listen((event) {
      handler();
    });
  }

  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

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
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: increment,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
