import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  int _counter = 0;
  var body = {};
  var mobile = '';
  var pass = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<http.Response> fetchAlbum() async {
    return await http.post('http://phase2.surabhigoodbuy.com/v2/signin_password',body: this.body);
  }
  getData(){
    var dt;
    fetchAlbum().then((value1) => {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Signin', style: TextStyle(color: Colors.black87, fontSize: 36, fontWeight: FontWeight.w600),),
            Text('Welcome back', style: TextStyle(color: Colors.grey[400], fontSize: 16),),
            SizedBox(height: 30,),
            Theme(
              data: new ThemeData(
                primaryColor: Colors.green,
                primaryColorDark: Colors.green,
              ),
              child: TextField(
                // obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile No.',
                ),
                onChanged: (val){
                  this.body['mobile'] = val.toString();
                  mobile = val.toString();
                },
              ),
            ),
            SizedBox(height: 15,),
            Theme(
              data: new ThemeData(
                primaryColor: Colors.green,
                primaryColorDark: Colors.green,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                onChanged: (val){
                  this.body['password'] = val.toString();
                  pass = val.toString();
                },
              ),
            ),
            SizedBox(height: 15,),
            RaisedButton(
              onPressed: () {
                var data;
                print(this.body);
                fetchAlbum().then((value1) => {
                  data = json.decode(value1.body),
                  if(data['message'] == 'Login Success'){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => HomePage()
                    ))
                  }
                  else{
                    Fluttertoast.showToast(
                      msg: 'Invalid Username or Password',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  )
                  }
                });

              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green
                ),
                padding: const EdgeInsets.all(10.0),
                child:
                const Text('SIGN IN', style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?  ',style: TextStyle(color: Colors.grey, fontSize: 16),),
                Text('Sign up here', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
