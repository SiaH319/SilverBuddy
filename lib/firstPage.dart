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
                  image: AssetImage("assets/img_1.png"),
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
                    width: 35,
                  ),
                  Text(
                    'Silver\n  Buddy',
                    style: GoogleFonts.nunito(
                    fontSize: 80,
                    color: Colors.white,
                  fontWeight: FontWeight.w900
                  ),),
                ],
              ),
              SizedBox(
                height: 170,
              ),
              Padding(
                padding:  EdgeInsets.fromLTRB(160,0,0,0),
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
                            image: AssetImage("assets/signup1.png"),
                           // fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.fromLTRB(160,0,0,0),
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
                          image: AssetImage("assets/signin1.png"),
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
