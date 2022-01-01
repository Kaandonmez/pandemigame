//import 'package:pandemic/utils/config.dart';

import 'package:pandemigame/domain/model/activity.dart';

import '../domain/model/questions.dart';
import 'config.dart';

///aşağıdaki kalıp createQuestions metodunun içine kopyalanarak
///birden fazla soru oluşturulması için kullanılabilir.

/**

questions.add(Questions(qString, id, yesno));

questions.add(Questions("Soru Stringi Buraya!!", Soruidsi buraya int olarak girilecek, [
    [evet için sayı dizisi], //!evet ise
    [hayır için sayı dizisi]  //  !hayır ise
  ]));



 */ ///

String acikMi(Activities activity) {
  if (activity.isActive) {
    return "açık";
  } else {
    return "kapalı";
  }
}

void create_Questions() {
  questions.add(Questions(
      "Okulların durumu ile ilgili bir değişikliğe gitmek ister misiniz?",
      0,
      [
        [
          -0.05, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0.05,
          0,
          -60
        ], //!evet ise
        [0, 0, 0, 0] //  !hayır ise
      ],
      "7",
      [activities[0]]));

  /*questions.add(Questions(
      "Kapanma durumu: bitirilip normal yasama donulsun mu ?",
      2,
      [
        [
          1.8, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          1.6,
          [activities[4],activities[5],activities[6]]
        ], //!evet ise
        [
          -1.4,
          0,
          0,
          -1.8,
          []
        ] //  !hayır ise
      ],
      "12"));
*/
  questions.add(Questions(
      "Aşılama çalışmalarının durumu ile ilgili bir değişikliğe gitmek ister misiniz?",
      4,
      [
        [
          0, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0.15,
          0,
          75
        ], //!evet ise
        [
          0, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -30
        ] //  !hayır ise
      ],
      "2",
      [activities[8]]));

  questions.add(Questions(
      "Aşılama yapabilmek için gerekli olan ithalat iznini veriyor musunuz?",
      4,
      [
        [
          -0.24, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          13
        ], //!evet ise
        [0, 0, 0, 11] //  !hayır ise
      ],
      "9",
      []));

  questions.add(Questions(
      "Vergi arttırımı yapılarak ile ekonomik seviye yukarı çekilsin mi?",
      5,
      [
        [
          0.18, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -21
        ], //!evet ise
        [0, 0, 0, 30] //  !hayır ise
      ],
      "3",
      []));

  questions.add(Questions(
      "Yabancı ülkelerden dış borç alarak ekonominize katkı sağlamak ister misiniz?",
      6,
      [
        [
          0.1, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -10
        ], //!evet ise
        [0, 1.0, 0.18, 30] //  !hayır ise
      ],
      "11",
      []));

  questions.add(Questions(
      "Şehirler ve ülkeler arası yolculukların durumu ile ilgili bir değişikliğe gitmek ister misiniz?",
      7,
      [
        [
          -1, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -50
        ], //!evet ise
        [
          1, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          30
        ] //  !hayır ise
      ],
      "7",
      [activities[2]]));

  questions.add(Questions(
      "Spor müsabakalarının durumu ile ilgili bir değişikliğe gitmek ister misiniz?",
      9,
      [
        [
          -1.7, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -90
        ], //!evet ise
        [0.8, 0, 0, 20] //  !hayır ise
      ],
      "10",
      [activities[3]]));

  questions.add(Questions(
      "Ekonomik maliyetini göze alarak tıp alanında geliştirmelere gitmek ister misiniz?",
      11,
      [
        [
          -1.9, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          2.6,
          40
        ], //!evet ise
        [0, 0, 0, -5] //  !hayır ise
      ],
      "2",
      []));

  questions.add(Questions(
      "Yerli aşı çalışmalarına yatırım yapmak ister misiniz?",
      12,
      [
        [
          -0.05, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          30
        ], //!evet ise
        [0, 0, 0, -5] //  !hayır ise
      ],
      "8",
      []));

  questions.add(Questions(
      "Ibadet yerlerinin durumu ile ilgili bir değişikliğe gitmek ister misiniz?",
      14,
      [
        [
          0, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -45
        ], //!evet ise
        [0, 0, 0, 10] //  !hayır ise
      ],
      "5",
      [activities[9]]));

  questions.add(Questions(
      "Alışveriş merkezlerinin durumu ile ilgili bir değişikliğe gitmek ister misiniz?",
      15,
      [
        [
          -0.15, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -10
        ], //!evet ise
        [0.1, 0, 0, 5] //  !hayır ise
      ],
      "10",
      [activities[5]]));

  /*questions.add(Questions(
      "Sokaga cikma yasagi getirilsin mi ? ",
      16,
      [
        [
          -0.75, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -0.5
        ], //!evet ise
        [
          0.2,
          0,
          0,
          0.15,
          []
        ] //  !hayır ise
      ],
      "12",
          [activities[0],activities[1],activities[2],activities[3],activities[4],activities[5],activities[6],activities[7]]
          ));

   */

  questions.add(Questions(
      "Düğün, nişan, kutlama gibi toplu aktivitelerin durumu ile ilgili bir değişikliğe gitmek ister misiniz?",
      17,
      [
        [
          -0.25, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -15
        ], //!evet ise
        [0.1, 0, 0, 20] //  !hayır ise
      ],
      "8",
      [activities[7]]));

  questions.add(Questions(
      "Sosyal mesafe, maske kural ihlallerinde idari para cezası uygulansın mı?",
      18,
      [
        [
          0.15, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -40
        ], //!evet ise
        [0, 0, 0, 10] //  !hayır ise
      ],
      "5",
      []));
/*
  questions.add(Questions(
      "Istıfa edecek misiniz ? ",
      19,
      [
        [
          0, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          0,
          resources.close_school,
          resources.start_vac,
          resources.close_sport,
          resources.close_cinema,
          resources.close_travel,
          resources.close_shop,
          resources.close_food
        ], //!evet ise
        [
          0,
          0,
          0,
          10,
          resources.close_school,
          resources.start_vac,
          resources.close_sport,
          resources.close_cinema,
          resources.close_travel,
          resources.close_shop,
          resources.close_food
        ] //  !hayır ise
      ],
      "11"));
      */
}
