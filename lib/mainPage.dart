import 'package:flutter/material.dart';
import 'package:flutter_app/ChatPage.dart';
import 'package:flutter_app/LoginPage.dart';
import 'package:flutter_app/MapPage.dart';
import 'package:flutter_app/QuestPage.dart';
import 'package:flutter_app/SurveyPage.dart';
import 'package:flutter_app/firstPage.dart';
import 'package:flutter_app/pageModel.dart';
import 'package:flutter_app/signupPage.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // This widget is the root of your application.
  //pageId
  // 0 : FirstPage
  // 1 : SurveyPage
  // 2 : MapPage
  // 3 : QuestPage
  // 4 : ChatPage
  // 5 : LoginPage
  // 6 : SignUpPage

  @override
  Widget build(BuildContext context) {
    PageModel pageModel = context.watch<PageModel>();
    return MaterialApp(
        home: (pageModel.pageId == 0)
            ? ChatPage()
            : (pageModel.pageId == 1)
                ? SurveyPage()
                : (pageModel.pageId == 2)
                    ? MapPage()
                    : (pageModel.pageId == 3)
                        ? QuestPage()
                        : (pageModel.pageId == 4)
                            ? FirstPage()
                            : (pageModel.pageId == 5)
                                ? LoginPage()
                                : signupPage());
  }
}
