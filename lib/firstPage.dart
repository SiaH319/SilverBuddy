import 'package:flutter/material.dart';
import 'package:flutter_app/pageModel.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
              ),
              Center(
                child: Container(
                  height: 75,
                  width: 100,
                  color: Colors.red,
                  child: Center(child: Text('Logo?', style: TextStyle(color: Colors.white,fontSize: 20),)),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        pageModel.changePageId(6);
                      });
                    },
                    child: Text('Sign Up'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        pageModel.changePageId(0);
                      });
                    },
                    child: Text('Sing in'),
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
