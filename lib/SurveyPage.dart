import 'package:flutter/material.dart';
import 'package:flutter_app/pageModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

final surveyList = [
  'Am the life of the party',
  'Feel little concern for others',
  'Am always prepared',
  'Get stressed out easily',
  'Have a rich vocabulary',
  '''Don't talk a lot''',
  'Am interested in people',
  'Leave my belongings around',
  'Am relaxed most of the time',
  'Have difficulty understanding abstract ideas',
  'Feel comfortable around people',
  'Insult people',
  'Pay attention to details',
  'Worry about things',
  'Have a vivid imagination',
  'Keep in the background',
  '''Sympathize with others' feelings''',
  'Make a mess of things',
  'Seldom feel blue',
  'Am not interested in abstract ideas',
  'Start conversations',
  '''Am not interested in other people's problems''',
  'Get chores done right away',
  'Am easily disturbed',
  'Have excellent ideas',
  'Have little to say',
  'Have a soft heart',
  'Often forget to put things back in their proper place',
  'Get upset easily',
  'Do not have a good imagination',
  'Talk to a lot of different people at partie',
  'Am not really interested in others',
  'Like order',
  'Change my mood a lot',
  'Am quick to understand things',
  '''Don't like to draw attention to myself''',
  'Take time out for others',
  'Shirk my duties',
  'Have frequent mood swings',
  'Use difficult words',
  '''Don't mind being the center of attention''',
  '''Feel others' emotions''',
  'Follow a schedule',
  'Get irritated easily',
  'Spend time reflecting on things',
  'Am quiet around strangers',
  'Make people feel at ease',
  'Am exacting in my work',
  'Often feel blue',
  'Am full of ideas',
];

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    List<String> surveyQ=['s','e','aasdfadsf'];
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
              Container(
                height: 530,
                child: ListView.builder(
                  itemCount: surveyList.length,
                  itemBuilder:(context, i) {
                    return  Padding(
                      padding: const EdgeInsets.fromLTRB(30,10,30,10),
                      child: Container(
                        height: 100,
                        width: 1000,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Text(surveyList[i]),
                      ),
                    );
                  },
                ),
              ),

              GestureDetector(
                onTap: (){
                  pageModel.changePageId(2);
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
