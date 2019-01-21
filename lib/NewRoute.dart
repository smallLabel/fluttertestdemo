import 'package:flutter/material.dart';



class NewRoute extends StatefulWidget {
  
  NewRoute({Key key, this.count: 0, this.title}): super(key: key);
  final int count;
  final String title;

@override
  State<StatefulWidget> createState() {
    return NewRouteState();
  }
}

class Page extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("hello world"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: NewRoute(),
        ),
      );
    }
}

class NewRouteState extends State<NewRoute> {
 int _counter;

  @override
    void initState() {
      super.initState();
      _counter = widget.count;
      print("initState");
    }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
    void didUpdateWidget(NewRoute oldWidget) {
      print("didupdateWidget");
      super.didUpdateWidget(oldWidget);
    }

  @override
    void deactivate() {
      print("deactivate");
      super.deactivate();
    }
  @override
    void dispose() {
      print("dispose");
      super.dispose();
    }
  @override
    void reassemble() {
      print("reassemble");
      super.reassemble();
    }

  @override
    void didChangeDependencies() {
      print("didChangeDependencies");
      super.didChangeDependencies();
    }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_counter.toString()),
          FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
          ),
        ]
      );
  }
}