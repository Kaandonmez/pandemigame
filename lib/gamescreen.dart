//@dart=2.9
import 'package:flutter/material.dart';
import 'package:pandemigame/domain/model/questions.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'utils/config.dart';
import "dart:math";

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
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<Questions> _question = questions;
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];

  @override
  void initState() {
    for (int i = 0; i < _question.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: _question[i].questionString, color: _colors[i] , askerImage: _question[i].askerImage),
          likeAction: () {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Liked ${_question[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Nope ${_question[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          }
          ));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("YKD"),
        ),
        body: Container(
            child: Column(children: [
          Container(
            height: 600,
            child: SwipeCards(
              matchEngine: _matchEngine,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 500,
                  alignment: Alignment.center,
                  color: _swipeItems[index].content.color,
                  child: Column(
                    children: <Widget>[Text(
                    _swipeItems[index].content.text,
                    style: TextStyle(fontSize: 30),
                  ),
                    Image.asset("assets/images/characters/"+_swipeItems[index].content.askerImage+".png"),
                    Text("yazı",style: TextStyle(fontSize: 15))
                  ])
                );
              },
              onStackFinished: () {
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text("Stack Finished"),
                  duration: Duration(milliseconds: 500),
                ));
              },
            ),
          ),
        ])));
  }
}
