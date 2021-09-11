import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loginManager.dart';
import 'package:flutter_app/pageModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class signupPage extends StatefulWidget {
  const signupPage({Key? key}) : super(key: key);

  @override
  _signupPageState createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  TextEditingController NameController = new TextEditingController();
  TextEditingController EmailController = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();
  var name;
  var password;
  var email;
  @override
  Widget build(BuildContext context) {
    PageModel pageModel = context.watch<PageModel>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 80,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/w1.png"),
                          //fit: BoxFit.cover
                        )),
                      ),
                    ],
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Sign Up',
                          style: GoogleFonts.nunito(
                              fontSize: 40, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 50,
              // ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                child: TextField(
                  controller: NameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                child: TextField(
                  controller: EmailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                child: TextField(
                  controller: PasswordController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 280,
                  ),
                  Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/m1.png"),
                      //fit: BoxFit.cover
                    )),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() async {
                    name = NameController.text;
                    password = PasswordController.text;
                    email = EmailController.text;
                    String uid = await LoginManager().signUp(email, password);
                    FirebaseFirestore.instance
                        .collection('users')
                        .add({'email': email, 'username': name, 'uid': uid});
                    pageModel.changePageId(1);
                  });
                },
                child: Container(
                  //width: 500,
                  height: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/signup2.png"),
                    // fit: BoxFit.cover
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.nunito(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      pageModel.changePageId(5);
                    },
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.nunito(
                        color: Color(0xff007AFF),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
