import 'package:crazy_simple_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'service_locator.dart';

void main() {
  initServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  Bloc bloc = serviceLocator<Bloc>();

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
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: bloc.counterStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.hasError)
                  return Text(
                    "-"
                  );
                int counter = snapshot.data;
                return Text(
                  "$counter",
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.addCounter(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
