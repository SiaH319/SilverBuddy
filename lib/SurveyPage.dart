import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pageModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

final _store = FirebaseFirestore.instance;
User? loggedInUser;

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

List<dynamic> arr = new List.filled(50, 1, growable: false);

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
  final _auth = FirebaseAuth.instance;
  void GetCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    PageModel pageModel = context.watch<PageModel>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 1000,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Survey.png"), fit: BoxFit.cover)),
          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Survey',
                    style: GoogleFonts.nunito(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 0,
                    width: 30,
                  ),
                  Text(
                    'Complete the Survey to find you Silverbuddies',
                    style: GoogleFonts.nunito(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Container(
                height: 15,
              ),
              Container(
                height: 540,
                child: ListView.builder(
                  itemCount: surveyList.length,
                  itemBuilder: (context, i) {
                    return SurveyBox(i);
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  print(arr);
                  FirebaseFirestore.instance
                      .collection('users')
                      .where('uid', isEqualTo: loggedInUser!.uid)
                      .get()
                      .then((value) =>
                          value.docs[0].reference.update({'survey': arr}));
                  pageModel.changePageId(2);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
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

class SurveyBox extends StatelessWidget {
  int i;
  SurveyBox(this.i);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Container(
            height: 44,
            width: 1060,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(22)),
            child: Center(
              child: Text(
                surveyList[i],
                style: GoogleFonts.nunito(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              width: 70,
            ),
            SurveyCircle(i, 1),
            SurveyCircle(i, 2),
            SurveyCircle(i, 3),
            SurveyCircle(i, 4),
            SurveyCircle(i, 5),
          ],
        )
      ],
    );
  }
}

class SurveyCircle extends StatefulWidget {
  SurveyCircle(this.boxId, this.id);
  int boxId;
  int id;
  @override
  _SurveyCircleState createState() => _SurveyCircleState();
}

class _SurveyCircleState extends State<SurveyCircle> {
  _SurveyCircleState();

  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7.0, 4.0, 7.0, 12.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isClicked = !isClicked;
            arr[this.widget.boxId] = this.widget.id;
          });
        },
        child: CircleAvatar(
            backgroundColor: (isClicked) ? Color(0xFFFFE589) : Colors.white,
            radius: 20.7,
            child: CircleAvatar(
                backgroundColor:
                    (isClicked) ? Color(0xFFFFE589) : Color(0xFF712EFF),
                child: Text(
                  this.widget.id.toString(),
                  style: GoogleFonts.nunito(
                      color: (isClicked) ? Colors.black : Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ))),
      ),
    );
  }
}
