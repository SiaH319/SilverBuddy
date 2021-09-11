import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/mainPage.dart';
import 'package:provider/provider.dart';

import 'pageModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add this

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageModel pageModel = new PageModel();
    return ChangeNotifierProvider.value(
      value: pageModel,
      child: MainPage(),
    );
  }
}
