import 'package:flutter/material.dart';
import 'package:flutter_app/pageModel.dart';
import 'package:google_fonts/google_fonts.dart';
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
      // bottomNavigationBar: Container(
      //   height: 90,
      //   width: 100,
      //   color: Colors.white.withOpacity(0.1),
      //   child: Padding(
      //     padding: const EdgeInsets.fromLTRB(40,0,40,0),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Container(
      //           width: 41,
      //           height: 41,
      //           decoration: BoxDecoration(
      //               image: DecorationImage(
      //                   image: AssetImage('assets/back.png'),
      //                   fit: BoxFit.cover)),
      //         ),
      //         Container(
      //           width: 41,
      //           height: 41,
      //           decoration: BoxDecoration(
      //               image: DecorationImage(
      //                   image: AssetImage('assets/menu.png'),
      //                   fit: BoxFit.cover)),
      //         ),
      //         Container(
      //           width: 41,
      //           height: 41,
      //           decoration: BoxDecoration(
      //               image: DecorationImage(
      //                   image: AssetImage('assets/profile.png'),
      //                   fit: BoxFit.cover)),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          width: 1000,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img_5.png"),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: 1000,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on_rounded,color: Colors.white,size: 15,),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Current Location                       My Star  ',
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: 15,
                              ),),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  // color: Colors.red,
                                    image: DecorationImage(
                                      image: AssetImage("assets/star.png"),
                                      // fit: BoxFit.fill
                                    )
                                ),
                              ),
                              Text(' x 8',
                                style: GoogleFonts.nunito(
                                  color: Color(0xffFFE589),
                                  fontSize: 15,
                                ),),
                            ],
                          ),
                     //   MyStatelessWidget(),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: 65,
                        height: 100,
                        decoration: BoxDecoration(
                         // color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage("assets/Fishing.png"),
                              // fit: BoxFit.fill
                            )
                        ),
                      ),
                      top: 220,
                      left: 45,
                    ),
                    Positioned(
                      child: Container(
                        width: 65,
                        height: 100,
                        decoration: BoxDecoration(
                          // color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage("assets/Cocktail.png"),
                              // fit: BoxFit.fill
                            )
                        ),
                      ),
                      top: 150,
                      left: 150,
                    ),
                    Positioned(
                      child: Container(
                        width: 75,
                        height: 110,
                        decoration: BoxDecoration(
                          // color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage("assets/Golf.png"),
                              // fit: BoxFit.fill
                            )
                        ),
                      ),
                      top: 160,
                      left: 240,
                    ),
                    Positioned(
                      child: Container(
                        width: 85,
                        height: 110,
                        decoration: BoxDecoration(
                          // color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage("assets/Coffee.png"),
                              // fit: BoxFit.fill
                            )
                        ),
                      ),
                      top: 295,
                      left: 270,
                    ),
                    Positioned(
                      child: GestureDetector(
                        onTap: (){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Container(
                              width: 1000,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 390,
                                    left: 220,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            // color: Colors.red,
                                              image: DecorationImage(
                                                image: AssetImage("assets/star.png"),
                                                // fit: BoxFit.fill
                                              )
                                          ),
                                        ),
                                        Text(' X 5',
                                          style: GoogleFonts.nunito(
                                            color: Color(0xffFFE589),
                                            fontSize: 15,
                                          ),),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      width: 100,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        // color: Colors.red,
                                          image: DecorationImage(
                                            image: AssetImage("assets/Chess.png"),
                                            // fit: BoxFit.fill
                                          )
                                      ),
                                    ),
                                    top: 420,
                                    left: 200,
                                  ),
                                  Positioned(
                                    child: GestureDetector(
                                      onTap: (){
                                        pageModel.changePageId(3);
                                        Navigator.pop(context, 'OK');
                                      },
                                      child: Container(
                                        width: 200,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          // color: Colors.red,
                                            image: DecorationImage(
                                              image: AssetImage("assets/memo.png"),
                                              // fit: BoxFit.fill
                                            )
                                        ),
                                      ),
                                    ),
                                    top: 540,
                                    left: 160,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 110,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                              image: DecorationImage(
                                image: AssetImage("assets/Chess.png"),
                                // fit: BoxFit.fill
                              )
                          ),
                        ),
                      ),
                      top: 420,
                      left: 200,
                    ),
                    Positioned(
                      child: Container(
                        width: 100,
                        height: 110,
                        decoration: BoxDecoration(
                          // color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage("assets/Restaurant.png"),
                              // fit: BoxFit.fill
                            )
                        ),
                      ),
                      top: 380,
                      left: 60,
                    ),
                  ],
                ),
              ),
              Container(
                height: 90,
                //width: 100,
                color: Colors.white.withOpacity(0),
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
            ],
          ),
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => Container(
          width: 1000,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: 100,
                  height: 110,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage("assets/Chess.png"),
                        // fit: BoxFit.fill
                      )
                  ),
                ),
                top: 420,
                left: 200,
                // child: AlertDialog(
                //   title: const Text('AlertDialog Title'),
                //   content: const Text('AlertDialog description'),
                //   actions: <Widget>[
                //     TextButton(
                //       onPressed: () => Navigator.pop(context, 'Cancel'),
                //       child: const Text('Cancel'),
                //     ),
                //     TextButton(
                //       onPressed: () => Navigator.pop(context, 'OK'),
                //       child: const Text('OK'),
                //     ),
                //   ],
                // ),
              ),
            ],
          ),
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

