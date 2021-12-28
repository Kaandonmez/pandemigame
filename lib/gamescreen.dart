//@dart=2.9
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

class Content {
  final String text;
  final Color color;

  Content({this.text, this.color});
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
  final List<String> _names = ["Red", "Blue", "Green", "Yellow", "Ahhmet"];
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: _names[i], color: _colors[i]),
          likeAction: () {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Liked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Nope ${_names[i]}"),
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
                height: 400,
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/images/ch.jpg"),
                    Text('cat')
                  ],
                ),
              ),
          Container(
            height: 100,
            child: SwipeCards(
              matchEngine: _matchEngine,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: _swipeItems[index].content.color,
                  child: Text(
                    _swipeItems[index].content.text,
                    style: TextStyle(fontSize: 100),
                  ),
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
