//@dart=2.9
import 'package:flutter/material.dart';
import 'package:pandemigame/domain/model/questions.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'utils/config.dart';
import "dart:math";
import 'package:percent_indicator/percent_indicator.dart';

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
  var medical_level = resources.medical_level;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<Questions> _question = questions;
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];
  void reloadResources() {
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
      medical_level = resources.medical_level;
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Column(
                  children: [
                    Divider(
                      height: MediaQuery.of(context).size.height*0.05,
                    ),
                    Row(
                      children: [
                        LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width-40,
                          lineHeight: MediaQuery.of(context).size.height*0.03,
                          percent: economy_level / 100,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.blue,
                          leading: RichText(
                              text: WidgetSpan(
                                  child: Icon(
                                    Icons.attach_money_rounded,
                                    color: Colors.greenAccent[400],
                                  ))),
                        ),
                      ],
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width-40,
                      lineHeight: MediaQuery.of(context).size.height*0.03,
                      percent: satisfaction_level / 100,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                      leading: RichText(
                          text: WidgetSpan(
                              child: Icon(
                                Icons.face_rounded,
                                color: Colors.yellow[300],
                              ))),
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width-40,
                      lineHeight: MediaQuery.of(context).size.height*0.03,
                      percent: health_level / 100,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                      leading: RichText(
                          text: WidgetSpan(
                              child: Icon(
                                Icons.local_hospital_rounded,
                                color: Colors.red[600],
                              ))),
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width-40,
                      lineHeight: MediaQuery.of(context).size.height*0.03,
                      percent: medical_level / 100,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                      leading: RichText(
                        text: WidgetSpan(
                            child: Icon(
                              Icons.healing_rounded,
                              color: Colors.blue[800],
                            )),
                      ),
                    ),
                    Divider(
                      height: 10,
                    ),
                  ],
                )),
            Divider(
              height: MediaQuery.of(context).size.height*0.03, //! arasındaki boşluk buradan ayarlanıyor!
              thickness: 0,
              color: Colors.grey[800],
            ),
            SwipeCards(
              matchEngine: _matchEngine,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    decoration: BoxDecoration(
                      color: _swipeItems[index].content.color,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height*0.65,
                    alignment: Alignment.center,
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
                          ".png",
                      width: MediaQuery.of(context).size.height*0.5,
                      height: MediaQuery.of(context).size.height*0.5,)
                    ]));
              },
              onStackFinished: () {
                initState();
              },
            ),
          ],
        ));
  }
}