import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './mainmenu.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class credits extends StatelessWidget {
  credits({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff373737),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 31.0, end: 48.0),
            Pin(size: 47.0, start: 54.0),
            child: Text(
              'Hazırlayanlar',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 35,
                color: const Color(0xff9f5103),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 16.0, end: 33.0),
            Pin(size: 210.0, start: 113.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60.0),
                color: const Color(0xa8030000),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x1b000000),
                    offset: Offset(10, 10),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 17.5, end: 31.5),
            Pin(size: 2.0, middle: 0.4038),
            child: SvgPicture.string(
              _svg_kkm5t,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 210.0, middle: 0.4554),
            Pin(size: 210.0, start: 113.0),
            child:
                // Adobe XD layer: 'ktu' (shape)
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 18.0, end: 31.0),
            Pin(size: 428.0, end: 42.0),
            child: Text(
              'Gerçek verilerden faydalanılarak \nhazırlanmış, oyuncunun verdiği kararlar çerçevesinde ilerleyen bir senaryoya sahip, "Koronavirüs Simülasyonu". Simülasyonumuz mobil platform üzerinde çalışacak şekilde oluşturulmuştur.',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 23,
                color: const Color(0xffcc8f00),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 45.0, start: 17.0),
            Pin(size: 44.0, start: 10.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.SlideRight,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => mainmenu(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color(0xff007e3f),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff707070)),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 28.0, middle: 0.5588),
                    Pin(size: 1.0, middle: 0.5233),
                    child: SvgPicture.string(
                      _svg_s7e4,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 9.0, middle: 0.2639),
                    Pin(size: 7.0, middle: 0.6081),
                    child: SvgPicture.string(
                      _svg_nswwm8,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 9.0, middle: 0.2639),
                    Pin(size: 5.0, middle: 0.4487),
                    child: SvgPicture.string(
                      _svg_mcs,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 297.0, start: 40.0),
            Pin(size: 135.0, middle: 0.1905),
            child: Text(
              ' Yağızhan Kerim Değer\n\n Kaan Dönmez\n\n Oğuzhan Topal',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xff039f5b),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_kkm5t =
    '<svg viewBox="17.5 350.5 363.0 2.0" ><path transform="translate(17.5, 350.5)" d="M 0 0 L 363 2" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_s7e4 =
    '<svg viewBox="26.5 32.5 28.0 1.0" ><path transform="translate(26.5, 32.5)" d="M 0 0 L 28 0" fill="none" stroke="#9a00ff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_nswwm8 =
    '<svg viewBox="26.5 32.5 9.0 7.0" ><path transform="translate(26.5, 32.5)" d="M 9 7 L 0 0" fill="none" stroke="#9a00ff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mcs =
    '<svg viewBox="26.5 27.5 9.0 5.0" ><path transform="translate(26.5, 27.5)" d="M 9 0 L 0 5" fill="none" stroke="#9a00ff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
