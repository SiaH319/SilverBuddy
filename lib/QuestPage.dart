import 'package:flutter/material.dart';
import 'package:flutter_app/pageModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class QuestPage extends StatefulWidget {
  @override
  _QuestPageState createState() => _QuestPageState();
}

class _QuestPageState extends State<QuestPage> {
  @override
  Widget build(BuildContext context) {
    PageModel pageModel = context.watch<PageModel>();
    return Scaffold(
      bottomNavigationBar: Container(
        height: 90,
        width: 100,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40,0,40,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 41,
                height: 41,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/back.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: 41,
                height: 41,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/menu.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: 41,
                height: 41,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/profile.png'),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 170,
              color: Color(0xff712EFF),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 70,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Che.png'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Group members are planning to meet"
                            "\nat the Nemo’s Sports Cafe at 5PM."
                            "\nGo join your buddies and collect 5 stars!",
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,)
,                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/star.png'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/star.png'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/star.png'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/star.png'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/star.png'),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              color: Color(0xffF1EAFF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.group),
                  Text('  Group Member (4/5)',
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                    ),

                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(30,0,30,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/w2.png'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/w3.png'),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(30,30,30,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/w4.png'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/w5.png'),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: (){
                pageModel.changePageId(4);

              },
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/join.png'),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
