import 'package:flutter/material.dart';
import 'package:flutterauth/services/authservice.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var name, password, token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Login'),
          actions: <Widget>[
            FlatButton(
              child: Row(
                children: <Widget>[Text('Signup'), Icon(Icons.person_add)],
              ),
              textColor: Colors.white,
              onPressed: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(SignupScreen.routeName);
              },
            )
          ],
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
                    child: Text('Hello',
                        style: TextStyle(
                            fontSize: 70.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 85.0, 0.0, 0.0),
                    child: Text('There',
                        style: TextStyle(
                            fontSize: 70.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(220.0, 85.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  )
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (val) {
                name = val;
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              onChanged: (val) {
                password = val;
              },
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              child: Text('Authenticate'),
              color: Colors.blue,
              onPressed: () {
                AuthService().login(name, password).then((val) {
                  if (val.data['success']) {
                    token = val.data['token'];
                    Fluttertoast.showToast(
                      msg: 'Authenticated',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                    );
                  }
                });
              },
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              child: Text('Add User'),
              color: Colors.green,
              onPressed: () {
                AuthService().addUser(name, password).then((val) {
                  
                    Fluttertoast.showToast(
                      msg: val.data['msg'],
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                    );
                  }
                );
              },
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              child: Text('Get Info'),
              color: Colors.green,
              onPressed: () {
                AuthService().getinfo(token).then((val) {
                  
                    Fluttertoast.showToast(
                      msg: val.data['msg'],
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                    );
                  }
                );
              },
            )
          ]
        ),
      ),
    );
  }
}