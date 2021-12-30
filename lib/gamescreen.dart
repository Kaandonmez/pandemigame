//@dart=2.9
import 'package:flutter/material.dart';
import 'package:pandemigame/domain/model/questions.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'utils/config.dart';
import "dart:math";
import '/domain/model/resources.dart';

Random rnd = Random();

class Content {
  final String text;
  final Color color;
  final String askerImage;

  Content({this.text, this.color, this.askerImage});
}

class gamescreen extends StatefulWidget {
  gamescreen({
    Key key,
  }) : super(key: key);

  @override
  _gamescreen createState() => _gamescreen();
}

class _gamescreen extends State<gamescreen> {
  List<SwipeItem> _swipeItems = List<SwipeItem>();
  MatchEngine _matchEngine;
  var health_level = resources.health_level;
  var satisfaction_level = resources.satisfaction_level;
  var economy_level = resources.economy_level;
  var medical_level= resources.medical_level;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<Questions> _question = questions;
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];
  void reloadResources(){
    setState(() {
      health_level = resources.health_level;
    });
    setState(() {
      satisfaction_level = resources.satisfaction_level;
    });
    setState(() {
      economy_level = resources.economy_level;
    });
    setState(() {
      medical_level= resources.medical_level;
    });
  }
  @override
  void initState() {
    for (int i = 0; i < _question.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(
              text: _question[i].questionString,
              color: _colors[rnd.nextInt(5)],
              askerImage: _question[i].askerImage),
          likeAction: () {
            _question[i].swipeYes();
            reloadResources();
          },
          nopeAction: () {
            _question[i].swipeNo();
            reloadResources();
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey[800],
        body: Container(
            child: Column(children: [
          Container(
                height: 100,
                color: Colors.deepOrange,
              child: Row(
                children: [
                  Container(
                    child: Text("Sağlık: "+health_level.toStringAsPrecision(3)),
                  ),
                  Container(
                    child: Text("Memnuniyet: "+satisfaction_level.toStringAsPrecision(3)),
                  ),
                  Container(
                    child: Text("Ekonomi: "+economy_level.toStringAsPrecision(3)),
                  ),
                  Container(
                    child: Text("Medical: "+medical_level.toStringAsPrecision(3)),
                  ),
                ],
              )
          ),
          Container(
            height: 550,
            child: SwipeCards(
              matchEngine: _matchEngine,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 470,
                    alignment: Alignment.center,
                    color: _swipeItems[index].content.color,
                    child: Column(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Center(
                              child: Text(
                            _swipeItems[index].content.text,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ))),
                      Image.asset("assets/images/characters/" +
                          _swipeItems[index].content.askerImage +
                          ".png")
                    ]));
              },
              onStackFinished: () {
                initState();
              },
            ),
          ),
        ],mainAxisAlignment: MainAxisAlignment.end,)));
  }
}
