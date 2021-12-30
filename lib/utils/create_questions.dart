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

String acikMi(Activities activity){
  if(activity.isActive){
    return "açık";
  }
  else {
    return "kapalı";
  }
}

void create_Questions() {
  questions.add(Questions(
      "Okullar: "+acikMi(activities[0])+". Değişikliğe gitmek ister misiniz?",
      0,
      [
        [
          1.2, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -0.6,
          [activities[0]]
        ], //!evet ise
        [-0.85, 0, 0, 0.45, []] //  !hayır ise
      ],
      "7"));

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
      "Aşılama çalışmaları: "+acikMi(activities[8])+". Değişikliğe gitmek ister misiniz?",
      4,
      [
        [
          0, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          15,
          0,
          0.75,
          [activities[8]]
        ], //!evet ise
        [
          0, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -0.3,
          []
        ] //  !hayır ise
      ],
      "2"));

  questions.add(Questions(
      "Aşılama yapabilmek için gerekli olan ithalat iznini veriyor musunuz?",
      4,
      [
        [
          -2.4, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          1.3,
          []
        ], //!evet ise
        [0, 0, 0, -1.1, []] //  !hayır ise
      ],
      "9"));

  questions.add(Questions(
      "Vergi arttırımı yapılarak ile ekonomik seviye yukarı çekilsin mi?",
      5,
      [
        [
          1.8, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -2.1,
          []
        ], //!evet ise
        [0, 0, 0, -0.3, []] //  !hayır ise
      ],
      "3"));

  questions.add(Questions(
      "Yabancı ülkelerden diş borç alarak ekonominize katkı sağlamak ister misiniz?",
      6,
      [
        [
          0, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -0.1,
          []
        ], //!evet ise
        [-0.25, 100, 0.18, 98, []] //  !hayır ise
      ],
      "11"));

  questions.add(Questions(
      "Şehirler ve ülkeler arası yolculuklar: "+acikMi(activities[2])+". Değişikliğe gitmek ister misiniz?",
      7,
      [
        [
          -1, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -0.5,
          [activities[2]]
        ], //!evet ise
        [
          1, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          0.3,
          []
        ] //  !hayır ise
      ],
      "7"));

  questions.add(Questions(
      "Spor müsabakaları: "+acikMi(activities[3])+". Değişikliğe gitmek ister misiniz?",
      9,
      [
        [
          -1.7, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -0.9,
          [activities[3]]
        ], //!evet ise
        [0.8, 0, 0, 0.2, []] //  !hayır ise
      ],
      "10"));

  questions.add(Questions(
      "Ekonomik maliyetini göze alarak tıp alanında geliştirmelere gitmek ister misiniz?",
      11,
      [
        [
          -1.9, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          2.6,
          0.4,
          []
        ], //!evet ise
        [0, 0, 0, -0.05, []] //  !hayır ise
      ],
      "2"));

  questions.add(Questions(
      "Yerli aşı çalışmalarına yatırım yapmak ister misiniz?",
      12,
      [
        [
          -1.05, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          1.3,
          []
        ], //!evet ise
        [0, 0, 0, -0.05, []] //  !hayır ise
      ],
      "8"));

  questions.add(Questions(
      "Ibadet yerleri: "+acikMi(activities[9])+". Değişikliğe gitmek ister misiniz?",
      14,
      [
        [
          0, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -0.45,
          [activities[9]]
        ], //!evet ise
        [0, 0, 0, 0.1, []] //  !hayır ise
      ],
      "5"));

  questions.add(Questions(
      "Alışveriş merkezleri: "+acikMi(activities[5])+". Değişikliğe gitmek ister misiniz?",
      15,
      [
        [
          -0.15, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -0.1,
          [activities[5]]
        ], //!evet ise
        [0.1, 0, 0, 0.05, []] //  !hayır ise
      ],
      "10"));

  /*questions.add(Questions(
      "Sokaga cikma yasagi getirilsin mi ? ",
      16,
      [
        [
          -0.75, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -0.5,
          [activities[0],activities[1],activities[2],activities[3],activities[4],activities[5],activities[6],activities[7]]
        ], //!evet ise
        [
          0.2,
          0,
          0,
          0.15,
          []
        ] //  !hayır ise
      ],
      "12"));

   */

  questions.add(Questions(
      "Düğün, nişan, kutlama gibi toplu aktiviteler:"+acikMi(activities[7])+" kisitlamalar getirilsin mi ? .",
      17,
      [
        [
          -0.25, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -0.15,
          [activities[7]]
        ], //!evet ise
        [0.1, 0, 0, 0.2, []] //  !hayır ise
      ],
      "8"));

  questions.add(Questions(
      "Sosyal mesafe ve hijyen kurallarina uymayanlara ve maske takmayanlara idari para cezasi uygulansin mi ? ",
      18,
      [
        [
          0.15, // sırasıyla ekonomi , saglik , medical , hoşnutluk
          0,
          0,
          -0.4,
          []
        ], //!evet ise
        [0, 0, 0, 0.1, []] //  !hayır ise
      ],
      "5"));
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
