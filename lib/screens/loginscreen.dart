import 'package:flutter/material.dart';
import 'package:flutterauth/services/authservice.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../dashboardpage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var name, password, token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
        // actions: <Widget>[
        //   FlatButton(
        //     child: Row(
        //       children: <Widget>[Text('Signup'), Icon(Icons.person_add)],
        //     ),
        //     textColor: Colors.white,
        //     onPressed: () {
        //       // Navigator.of(context)
        //       //     .pushReplacementNamed(SignupScreen.routeName);
        //     },
        //   )
        // ],
      // ),
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
          image: AssetImage("hello.jpg"),
          fit: BoxFit.cover,
        ),
        ),
        padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Text('RM ePortal',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(130.0, 45.0, 0.0, 0.0),
                      child: Text('for Sage 300',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600)),
                    ),
                    // Container(
                    //   padding: EdgeInsets.fromLTRB(220.0, 85.0, 0.0, 0.0),
                    //   child: Text('.',
                    //       style: TextStyle(
                    //           fontSize: 80.0,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.blue)),
                    // )
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'User ID'),
                onChanged: (val) {
                  name = val;
                },
              ),

              SizedBox(height: 5.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                onChanged: (val) {
                  password = val;
                },
              ),
              SizedBox(height: 15.0),
              ButtonTheme(
                minWidth: 500.0,
                height: 50.0,
                child: RaisedButton(
                  child: Text('Log In'),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
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
                            fontSize: 16.0);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DashboardPage()));
                      }
                    });
                  },
                ),
              ),
              // SizedBox(height: 10.0),
              // RaisedButton(
              //   child: Text('Add User'),
              //   color: Colors.green,
              //   onPressed: () {
              //     AuthService().addUser(name, password).then((val) {

              //         Fluttertoast.showToast(
              //           msg: val.data['msg'],
              //           toastLength: Toast.LENGTH_SHORT,
              //           gravity: ToastGravity.BOTTOM,
              //           timeInSecForIosWeb: 1,
              //           backgroundColor: Colors.green,
              //           textColor: Colors.white,
              //           fontSize: 16.0
              //         );
              //       }
              //     );
              //   },
              // ),
              // SizedBox(height: 10.0),
              // RaisedButton(
              //   child: Text('Get Info'),
              //   color: Colors.green,
              //   onPressed: () {
              //     AuthService().getinfo(token).then((val) {

              //         Fluttertoast.showToast(
              //           msg: val.data['msg'],
              //           toastLength: Toast.LENGTH_SHORT,
              //           gravity: ToastGravity.BOTTOM,
              //           timeInSecForIosWeb: 1,
              //           backgroundColor: Colors.green,
              //           textColor: Colors.white,
              //           fontSize: 16.0
              //         );
              //       }
              //     );
              //   },
              // )
            ]),
      ),
    );
  }
}
