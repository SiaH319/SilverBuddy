import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loginManager.dart';
import 'package:flutter_app/pageModel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController IDController = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();
  var username;
  var password;
  @override
  Widget build(BuildContext context) {
    PageModel pageModel = context.watch<PageModel>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: IDController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'user account',
                    hintText: 'Enter Email Address',
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: PasswordController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Center(
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      username = IDController.text;
                      password = PasswordController.text;
                      new LoginManager().signUp(username, password);
                      print(username);
                      print(password);
                      pageModel.changePageId(1);
                    });
                  },
                  child: Text('Login'),
                ),
              ),
            ),
            // Text(username + password)
          ],
        ),
      ),
    );
  }
}
