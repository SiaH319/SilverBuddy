import 'package:flutter/material.dart';
import 'package:flutter_app/pageModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    PageModel pageModel = context.watch<PageModel>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img_2.png"),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Survey',
                    style: GoogleFonts.nunito(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),

                  Text(
                    'Please fill the ~~~~',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,10,30,10),
                child: Container(
                  height: 100,
                  width: 1000,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,10,30,10),
                child: Container(
                  height: 100,
                  width: 1000,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,10,30,10),
                child: Container(
                  height: 100,
                  width: 1000,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,10,30,10),
                child: Container(
                  height: 100,
                  width: 1000,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,10,30,10),
                child: Container(
                  height: 100,
                  width: 1000,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  pageModel.changePageId(2);
                  print('sex');
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(250,0,0,0),
                  child: Container(
                    //width: 500,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/next.png"),
                          // fit: BoxFit.cover
                        )),
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
