//import 'dart:async';

import 'package:pandemigame/domain/model/activity.dart';

import '../../utils/config.dart';

/**
 * ! her sorunun
 * ? bir soru metni
 * ? soruya ait benzersiz bir id
 * ? sorunun yani kartın sağa veya sola çekildiği zaman hangi değişkeni ne kadar etkileyeceğini belirten 2 farklı sayı dizisi
 * ! kart sağa veya sola çekildiğinde 2 farklı sonucu olacak demektir.
 */ ///

class Questions {
  var questionString = "";

  int? questionId;

  String askerImage = "1";

  var ifYes =
      []; //! mesela 4 tane değişken değerimi olsun (sağlık psikolji gibi) ifYes[0.25,-100,-0.18,-98,7]

  var ifNo =
      []; //! mesela 4 tane değişken değerimi olsun (sağlık psikolji gibi) ifNo[-0.25,100,0.18,98,7]

  Questions(var qString, int id, List yesno, String _askerImage) {
    questionString = qString;

    askerImage = _askerImage;

    questionId = id;

    ifYes = yesno[0];
    ifNo = yesno[1];
  }

  String getquestionByid(int id) {
    return questions[id].toString();
  }

  swipeBool(bool YesNo) {
    if (YesNo) {
      swipeYes();
    } else {
      swipeNo();
    }
  }

  swipeYes() {
    if(questionString.contains("açık")){
      questionString.replaceAll("açık", "kapalı");
    }
    else {
      questionString.replaceAll("kapalı", "açık");
    }
    // ! ilgili kart yes kararına swipe edildikten sonra bu metot çağırılacak.
    // todo: oyunun kaybedildiğini anlamak için ressources kontrolü timeline içine eklenirse daha mantıklı olacaktır.
    //? burada sadece değerlerin belirli aralıklarda tutulması sağlanacak.

    print("ex resources.economy_level: " + resources.economy_level.toString());
    print("ex resources.health_level: " + resources.health_level.toString());
    print("ex resources.medical_level: " + resources.medical_level.toString());
    print("ex resources.satisfaction_level: " +
        resources.satisfaction_level.toString());

    resources.economy_level += ifYes[0];
    resources.health_level += ifYes[1];
    resources.medical_level += ifYes[2];
    resources.satisfaction_level += ifYes[3];
    List<Activities> changeStatusActivities = ifYes[4];
    //sırasıyla->>>> school vaci sport sinem trvl shop food

    if (resources.economy_level > 100) {
      resources.economy_level = 100;
    } else if (resources.economy_level < 0) {
      resources.economy_level = 0;
    }
    if (resources.health_level > 100) {
      resources.health_level = 100;
    } else if (resources.health_level < 0) {
      resources.health_level = 0;
    }
    if (resources.medical_level > 100) {
      resources.medical_level = 100;
    } else if (resources.medical_level < 0) {
      resources.medical_level = 0;
    }
    if (resources.satisfaction_level > 100) {
      resources.satisfaction_level = 100;
    } else if (resources.satisfaction_level < 0) {
      resources.satisfaction_level = 0;
    }

    print("resources.economy_level: " + resources.economy_level.toString());
    print("resources.health_level: " + resources.health_level.toString());
    print("resources.medical_level: " + resources.medical_level.toString());
    print("resources.satisfaction_level: " +
        resources.satisfaction_level.toString());

    changeStatusActivities.forEach((activity) {
      activity.changeStatus();
      print(activity.toString());
    });
  }

  swipeNo() {
    // ! ilgili kart no kararına swipe edildikten sonra bu metot çağırılacak.
    //? burada sadece değerlerin belirli aralıklarda tutulması sağlanacak.
    print("ex resources.economy_level: " + resources.economy_level.toString());
    print("ex resources.health_level: " + resources.health_level.toString());
    print("ex resources.medical_level: " + resources.medical_level.toString());
    print("ex resources.satisfaction_level: " +
        resources.satisfaction_level.toString());

    resources.economy_level += ifNo[0];
    resources.health_level += ifNo[1];
    resources.medical_level += ifNo[2];
    resources.satisfaction_level += ifNo[3];

    //sırasıyla->>>> school vaci sport sinem trvl shop food

    if (resources.economy_level > 100) {
      resources.economy_level = 100;
    } else if (resources.economy_level < 0) {
      resources.economy_level = 0;
    }
    if (resources.health_level > 100) {
      resources.health_level = 100;
    } else if (resources.health_level < 0) {
      resources.health_level = 0;
    }
    if (resources.medical_level > 100) {
      resources.medical_level = 100;
    } else if (resources.medical_level < 0) {
      resources.medical_level = 0;
    }
    if (resources.satisfaction_level > 100) {
      resources.satisfaction_level = 100;
    } else if (resources.satisfaction_level < 0) {
      resources.satisfaction_level = 0;
    }
    print("resources.economy_level: " + resources.economy_level.toString());
    print("resources.health_level: " + resources.health_level.toString());
    print("resources.medical_level: " + resources.medical_level.toString());
    print("resources.satisfaction_level: " +
        resources.satisfaction_level.toString());

    List<Activities> changeStatusActivities = ifNo[4];
    changeStatusActivities.forEach((activity) {
      activity.changeStatus();
      print(activity.toString());
    });
  }
}
