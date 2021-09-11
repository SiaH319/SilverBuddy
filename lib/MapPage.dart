import 'package:flutter/material.dart';
import 'package:flutter_app/pageModel.dart';
import 'package:provider/src/provider.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    PageModel pageModel = context.watch<PageModel>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                pageModel.changePageId(4);
              },
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: 1000,
                    color: Color(0xffFFE99C),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 327,
                              height: 38,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(25)
                              ),
                            ),
                            Positioned(
                              bottom: 4,
                              left: 10,
                              child: Icon(Icons.search),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
