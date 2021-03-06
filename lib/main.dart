import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'NewRoute.dart';

void main() => runApp(MyApp());


Future<String> loadAsset() async {
  return await rootBundle.loadString('asset/configh.png');
}

class EnglishPage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      final  word = new WordPair.random();

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(word.toString(), style: Theme.of(context).textTheme.body1,),
      );
    }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.blue,
      ),
      routes: { 
        "new_page": (context) => FormTestRoute(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,  this.count: 0}) : super(key: key);

  final int count;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  String icon = "";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() => new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,//当前状态
          onChanged:(value){
            //重新构建页面  
            setState(() {
              _switchSelected=value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          onChanged:(value){
            setState(() {
              _checkboxSelected=value;
            });
          } ,
        )
      ],
    );
  }
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SwitchAndCheckBoxTestRoute(),
                  Checkbox(
                    value: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.ac_unit, color: Colors.red,),
                      Icon(Icons.backspace, color: Colors.red,),
                      Icon(Icons.g_translate, color: Colors.red,),
                    ],
                  ),
                Text(_counter.toString()),
                FlatButton(
                  child: Text("跳转"),
                  onPressed: (){
                    Navigator.pushNamed(context, "new_page");
                    }
                ),
                RaisedButton(
                  elevation: 2.0,
                  highlightElevation: 4.0,
                  disabledElevation: 0.0,
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("submit"),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: ()=>{},
                ),
                Text("\uE914" + "\uE000" + "\uE90D", style:TextStyle(fontFamily: "MaterialIcons", fontSize: 40.0, color: Colors.green)),
                Image.asset("images/hello.jpg", width: 200,),
                Image.network("https://www.baidu.com/img/bd_logo1.png?where=super")
                ],
                ),
            ) ,
      
      
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}


class Echo extends StatelessWidget {
  Echo({
    Key key, 
    @required this.text,
    this.backgroundColor: Colors.red,
  }) : super(key: key);
  final String text;
  final Color backgroundColor;

    @override
      Widget build(BuildContext context) {
        
        return Center(
          child: Container(
            child: Text(this.text),
            color: this.backgroundColor,
            )
          );
      }
}

