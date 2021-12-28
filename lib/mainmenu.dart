import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './credits.dart';
import 'package:adobe_xd/page_link.dart';
import './zorluk.dart';

class mainmenu extends StatelessWidget {
  mainmenu({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff330000),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: -102.0, end: -72.0),
            Pin(start: 0.0, end: -9.0),
            child:
                // Adobe XD layer: 'pic_1' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/pic_1.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 235.0, middle: 0.5028),
            Pin(size: 70.0, middle: 0.7738),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.SlideLeft,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => credits(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: const Color(0xff007e3f),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 8),
                                  blurRadius: 0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 37.0, end: 37.0),
                    Pin(size: 33.0, middle: 0.5135),
                    child: Text(
                      'HAKKINDA',
                      style: TextStyle(
                        fontFamily: 'Yu Gothic UI',
                        fontSize: 25,
                        color: const Color(0xff1e1103),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 235.0, middle: 0.5028),
            Pin(size: 70.0, middle: 0.6238),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.SlideLeft,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => zorluk(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: const Color(0xff6a9e00),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 8),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 116.0, middle: 0.4958),
                    Pin(size: 33.0, middle: 0.5135),
                    child: Text(
                      'OYNA',
                      style: TextStyle(
                        fontFamily: 'Malgun Gothic',
                        fontSize: 25,
                        color: const Color(0xfffe0000),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 97.0, end: 96.0),
            Pin(size: 219.0, start: 85.0),
            child:
                // Adobe XD layer: 'logo' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/logo.png'),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(15, 15),
                    blurRadius: 15,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 45.0, end: 44.0),
            Pin(size: 24.0, end: 47.0),
            child: Text(
              'Karadeniz Teknik Üniversitesi',
              style: TextStyle(
                fontFamily: 'Rockwell',
                fontSize: 20,
                color: const Color(0xff0055ff),
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
