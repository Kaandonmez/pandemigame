import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './zorluk.dart';
import 'package:adobe_xd/page_link.dart';

class gamescreen extends StatelessWidget {
  gamescreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff373737),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 53.0, end: 26.0),
            Pin(size: 48.0, middle: 0.438),
            child: Text(
              'Oyun ekranı burada olacak..... Şuan tasarım aşamasındadı…..',
              style: TextStyle(
                fontFamily: 'Rockwell',
                fontSize: 20,
                color: const Color(0xff08f300),
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 61.0, start: 0.0),
            Pin(size: 63.0, middle: 0.2577),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.SlideLeft,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => zorluk(),
                ),
              ],
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  color: const Color(0xff540000),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 208.0, start: 0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(29.0),
                  bottomLeft: Radius.circular(29.0),
                ),
                color: const Color(0xff1b471f),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
