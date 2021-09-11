import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pageModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    PageModel pageModel = context.watch<PageModel>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img.png"),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 65,
                  ),
                  Text(
                    'Silver\nBuddy',
                    style: GoogleFonts.nunito(
                    fontSize: 60,
                    color: Colors.black,
                  fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              SizedBox(
                height: 270,
              ),
              Padding(
                padding:  EdgeInsets.fromLTRB(100,0,0,0),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      pageModel.changePageId(6);
                    });
                  },
                  child: Container(
                    //width: 500,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/signup.png"),
                           // fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.fromLTRB(100,0,0,0),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      pageModel.changePageId(5);
                    });
                  },
                  child: Container(
                    //width: 500,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/signin.png"),
                          // fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
