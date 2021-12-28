//@dart=2.9
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './mainmenu.dart';
import 'package:adobe_xd/page_link.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:pandemigame/example_slide_route.dart';

class zorluk extends StatelessWidget {
  zorluk({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff373737),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 15.0, end: 15.0),
            Pin(size: 1.0, middle: 0.34),
            child: SvgPicture.string(
              _svg_n03t4,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 15.0, end: 15.0),
            Pin(size: 1.0, middle: 0.6738),
            child: SvgPicture.string(
              _svg_sc4v5k,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 46.0, start: 9.0),
            Pin(size: 45.0, start: 2.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.SlideLeft,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => mainmenu(),
                ),
              ],
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  color: const Color(0xff540000),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 15.0, end: 15.0),
            Pin(size: 250.0, start: 24.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: const Color(0xff005020),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 93.0, start: 32.0),
            Pin(size: 32.0, start: 45.0),
            child: Text(
              'Kolay',
              style: TextStyle(
                fontFamily: 'Segoe Script',
                fontSize: 20,
                color: const Color(0xffa7d6d0),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 213.0, end: 32.0),
            Pin(size: 40.0, start: 37.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xff003013),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 32.0, end: 32.0),
            Pin(size: 42.0, middle: 0.2585),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => ExampleRouteSlide(),
                ),
              ],
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21.0),
                  color: const Color(0xff009aab),
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
          ),
          Pinned.fromPins(
            Pin(size: 163.0, middle: 0.4458),
            Pin(size: 24.0, middle: 0.266),
            child: Text(
              'BAŞLA',
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
            Pin(start: 33.0, end: 47.0),
            Pin(size: 96.0, start: 99.0),
            child: Text(
              'Kurallara sıkı sıkıya bağlı kişiler \nbulaştırıcılığı azaltır. Halkın neredeyse \ntümü son derece bilinçli kişilerden \noluşur. Yönetmesi daha kolaydır.',
              style: TextStyle(
                fontFamily: 'Rockwell',
                fontSize: 19,
                color: const Color(0xff00d1d1),
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 15.0, end: 15.0),
            Pin(size: 250.0, end: 15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: const Color(0xff710000),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 60.0, start: 32.0),
            Pin(size: 26.0, middle: 0.7512),
            child: Text(
              'Zor',
              style: TextStyle(
                fontFamily: 'Vermin Vibes 2 Soft',
                fontSize: 25,
                color: const Color(0xfffe0000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 213.0, end: 32.0),
            Pin(size: 40.0, middle: 0.7458),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xff4e0000),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 32.0, end: 32.0),
            Pin(size: 42.0, end: 25.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.SlideLeft,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => ExampleRouteSlide(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: const Color(0xff009aab),
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
                  Pinned.fromPins(
                    Pin(size: 163.0, middle: 0.4054),
                    Pin(size: 24.0, middle: 0.5),
                    child: Text(
                      'BAŞLA',
                      style: TextStyle(
                        fontFamily: 'Rockwell',
                        fontSize: 20,
                        color: const Color(0xff08f300),
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 15.0, end: 15.0),
            Pin(size: 250.0, middle: 0.5113),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: const Color(0xff915200),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 75.0, start: 32.0),
            Pin(size: 33.0, middle: 0.4134),
            child: Text(
              'Orta',
              style: TextStyle(
                fontFamily: 'Segoe UI Symbol',
                fontSize: 25,
                color: const Color(0xff60a43a),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 213.0, end: 32.0),
            Pin(size: 40.0, middle: 0.3964),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xff5b3400),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 32.0, end: 32.0),
            Pin(size: 42.0, middle: 0.622),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.SlideLeft,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => ExampleRouteSlide(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: const Color(0xff009aab),
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
                  Pinned.fromPins(
                    Pin(size: 163.0, middle: 0.4054),
                    Pin(size: 24.0, middle: 0.5),
                    child: Text(
                      'BAŞLA',
                      style: TextStyle(
                        fontFamily: 'Rockwell',
                        fontSize: 20,
                        color: const Color(0xff08f300),
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 32.0, end: 46.0),
            Pin(size: 78.0, middle: 0.5063),
            child: Text(
              'Halkın geneli eğitimli olsalar da pek fazla dikkat etmezler. İyiye giden bir durum aniden tersine dönebilir.',
              style: TextStyle(
                fontFamily: 'Rockwell',
                fontSize: 20,
                color: const Color(0xff0044ff),
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 39.0, middle: 0.5898),
            Pin(size: 24.0, start: 45.0),
            child:
                // Adobe XD layer: 'fl' (shape)
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/fl.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 38.0, middle: 0.7326),
            Pin(size: 24.0, start: 45.0),
            child:
                // Adobe XD layer: 'sw' (shape)
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/sw.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 34.0, end: 51.0),
            Pin(size: 25.0, start: 45.0),
            child:
                // Adobe XD layer: 'nw' (shape)
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/nw.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 40.0, middle: 0.5887),
            Pin(size: 27.0, middle: 0.3974),
            child:
                // Adobe XD layer: 'tr' (shape)
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/tr.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 42.0, middle: 0.7297),
            Pin(size: 25.0, middle: 0.3964),
            child:
                // Adobe XD layer: 'gr' (shape)
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/gr.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 39.0, end: 46.0),
            Pin(size: 26.0, middle: 0.3969),
            child:
                // Adobe XD layer: 'net' (shape)
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/net.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 37.0, middle: 0.7307),
            Pin(size: 25.0, middle: 0.742),
            child:
                // Adobe XD layer: 'ch' (shape)
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/ch.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 42.0, end: 52.0),
            Pin(size: 23.0, middle: 0.7414),
            child:
                // Adobe XD layer: 'usa' (shape)
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/usa.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 39.0, middle: 0.6086),
            Pin(size: 26.0, middle: 0.7429),
            child:
                // Adobe XD layer: 'rs' (shape)
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/rs.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 31.0, end: 47.0),
            Pin(size: 48.0, middle: 0.8297),
            child: Text(
              'Halk son derece kural tanımazdır. Yönetmesi zordur. Dikkat et !',
              style: TextStyle(
                fontFamily: 'Rockwell',
                fontSize: 20,
                color: const Color(0xffeeff00),
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

const String _svg_n03t4 =
    '<svg viewBox="15.0 295.5 382.0 1.0" ><path transform="translate(15.0, 295.5)" d="M 0 0 L 382 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sc4v5k =
    '<svg viewBox="15.0 585.5 382.0 1.0" ><path transform="translate(15.0, 585.5)" d="M 0 0 L 382 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
