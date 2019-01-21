import 'package:flutter/material.dart';

class NewRoute extends StatefulWidget {
  NewRoute({Key key, this.count: 0, this.title}) : super(key: key);
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
        child: Container(
          child:  TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "电子邮件地址",
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none //隐藏下划线
                  )),
          decoration: BoxDecoration(
              // 下滑线浅灰色，宽度1像素
              border: Border(
                  bottom: BorderSide(color: Colors.grey[200], width: 1.0))),
        ),
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
        ]);
  }
}


class FormTestRoute extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      
      return _FormTestRouteState();
    }
}

class _FormTestRouteState extends State<FormTestRoute> {

TextEditingController _usernameController = new TextEditingController();
TextEditingController _passwordController = new TextEditingController();

GlobalKey _formKey = new GlobalKey<FormState>();

  @override
    Widget build(BuildContext context) {
      
      return Scaffold(
        appBar: AppBar(
          title: Text("表单"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person)
                  ),
                  validator: (v) { 
                    return v
                        .trim()
                        .length > 0 ? null : "用户名不能为空";
                        }
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)
                  ),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    return v
                        .trim()
                        .length > 5 ? null : "密码不能少于6位";
                  }
              ),
              Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child:  RaisedButton(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("登录"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: (){
                          if ((_formKey.currentState as FormState).validate()){
                            print("验证通过");
                          }
                        },
                    ),
                    ),
                   
                  ],
                ),
              )
              ],
            ),
          ),
        ),
        
      );
    }
}