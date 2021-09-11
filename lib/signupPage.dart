import 'package:flutter/material.dart';
import 'package:flutter_app/pageModel.dart';
import 'package:provider/src/provider.dart';

class signupPage extends StatefulWidget {
  const signupPage({Key? key}) : super(key: key);

  @override
  _signupPageState createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
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
            SizedBox(
              height: 200,
            ),
            Container(
              height: 50,
              width: 300,
              child: Center(child: Text('Sign up')),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
            ),
            SizedBox(
              height: 150,
            ),
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

                    });
                  },
                  child: Text('sign up'),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8),
              child: Center(
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      pageModel.changePageId(5);
                    });
                  },
                  child: Text('first page'),
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
