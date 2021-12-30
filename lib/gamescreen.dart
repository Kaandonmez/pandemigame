//@dart=2.9
import 'package:flutter/material.dart';
import 'package:pandemigame/domain/model/questions.dart';
import 'package:pandemigame/utils/create_questions.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'utils/config.dart';
import "dart:math";
import 'package:percent_indicator/percent_indicator.dart';
import '/domain/model/covid.dart';

Random rnd = Random();
class Content {
  final String text;
  final Color color;
  final String askerImage;

  Content({this.text, this.color, this.askerImage});
}

class gamescreen extends StatefulWidget {
  const gamescreen({
    Key key,
  }) : super(key: key);

  @override
  gameScreen createState() => gameScreen();
}

class gameScreen extends State<gamescreen> {
  final List<SwipeItem> _swipeItems = List<SwipeItem>();
  MatchEngine _matchEngine;
  var health_level = resources.health_level;
  var satisfaction_level = resources.satisfaction_level;
  var economy_level = resources.economy_level;
  var medical_level = resources.medical_level;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
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
      var questionText = _question[i].questionString;
      if (_question[i].effectActivities.isNotEmpty) {
        questionText = _question[i].questionString.replaceAll(
            "&aktifmi&", acikMi(_question[i].effectActivities.first));
      }
      _swipeItems.add(SwipeItem(
          content: Content(
              text: questionText,
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
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Column(
                  children: [
                    Divider(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      children: [
                        LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width - 40,
                          lineHeight: MediaQuery.of(context).size.height * 0.03,
                          percent: economy_level,
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
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 40,
                      lineHeight: MediaQuery.of(context).size.height * 0.03,
                      percent: satisfaction_level,
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
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 40,
                      lineHeight: MediaQuery.of(context).size.height * 0.03,
                      percent: health_level,
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
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(covid.positiveCounter),
                    const Divider(
                      height: 10,
                    ),
                  ],
                )),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    for (int i = 0; i < activities.length / 2; i++)
                      Container(
                          margin: EdgeInsets.fromLTRB(1, 2, 1, 1),
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: activities[i].isActive
                                ? Colors.green
                                : Colors.red,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                              topLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: Text(activities[i].name)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    for (int i = activities.length ~/ 2;
                        i < activities.length;
                        i++)
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2, 1, 0),
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: activities[i].isActive
                                ? Colors.green
                                : Colors.red,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                              topLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: Text(activities[i].name)),
                  ],
                ),
              ],
            ),
            SwipeCards(
              matchEngine: _matchEngine,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    decoration: BoxDecoration(
                      color: _swipeItems[index].content.color,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.6,
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
                      Image.asset(
                        "assets/images/characters/" +
                            _swipeItems[index].content.askerImage +
                            ".png",
                        width: MediaQuery.of(context).size.height * 0.42,
                        height: MediaQuery.of(context).size.height * 0.42,
                      )
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
