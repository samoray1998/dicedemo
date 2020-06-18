import 'dart:math';

import 'package:flutter/material.dart';

class home extends StatefulWidget {
  home({Key key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  bool playerturn = true;
  int nbimg = 1;
  int nbimg2 = 1;
  Widget getWiner(int nb1, int nb2) {
    if (nb1 == 6) {
      return Text("the Winner is player nomber 1");
    }
    if (nb2 == 6) {
      return Text("the Winner is player nomber 2");
    }
    return Text("");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("dice game"),
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
            elevation: 0.0,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            color: Colors.blueAccent,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.perm_identity,
                              size: 25,
                              color: playerturn ? Colors.red : Colors.green,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    if (playerturn) {
                                      playerturn=false;
                                    } else {
                                      playerturn=true;
                                    }
                                    nbimg = Random().nextInt(6) + 1;
                                  });
                                },
                                child: Image.asset(
                                  "images/dice$nbimg.png",
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                             Icon(
                              Icons.perm_identity,
                              size: 25,
                              color: playerturn ? Colors.green : Colors.red,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    if (playerturn) {
                                      playerturn=false;
                                    } else {
                                      playerturn=true;
                                    }
                                    nbimg2 = Random().nextInt(6) + 1;
                                  });
                                },
                                child: Image.asset(
                                  "images/dice$nbimg2.png",
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    getWiner(nbimg, nbimg2),
                    SizedBox(
                      height: 30,
                    ),
                    IconButton(
                        icon: Icon(Icons.replay),
                        onPressed: () {
                          setState(() {
                            nbimg = 1;
                            nbimg2 = 1;
                          });
                        })
                  ]),
            ),
          )),
    );
  }
}
