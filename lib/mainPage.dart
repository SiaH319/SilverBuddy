import 'package:flutter/material.dart';
import 'package:flutter_app/ChatPage.dart';
import 'package:flutter_app/LoginPage.dart';
import 'package:flutter_app/MapPage.dart';
import 'package:flutter_app/QuestPage.dart';
import 'package:flutter_app/SurveyPage.dart';
import 'package:flutter_app/pageModel.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageModel pageModel = context.watch<PageModel>();
    return MaterialApp(
      home: (pageModel.pageId == 0)
          ? LoginPage()
          : (pageModel.pageId == 1)
              ? SurveyPage()
              : (pageModel.pageId == 2)
                  ? MapPage()
                  : (pageModel.pageId == 3)
                      ? QuestPage()
                      : ChatPage(),
    );
  }
}
