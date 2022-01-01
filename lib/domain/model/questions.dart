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
  bool? isSwipeNoFirst = null;
  var questionString = "";

  int? questionId;

  String askerImage = "1";

  List<Activities> effectActivities = [];

  var ifYes =
      []; //! mesela 4 tane değişken değerimi olsun (sağlık psikolji gibi) ifYes[0.25,-100,-0.18,-98,7]

  var ifNo =
      []; //! mesela 4 tane değişken değerimi olsun (sağlık psikolji gibi) ifNo[-0.25,100,0.18,98,7]

  Questions(var qString, int id, List yesno, String _askerImage,
      List<Activities> _effectActivities) {
    questionString = qString;

    askerImage = _askerImage;

    questionId = id;
    effectActivities.addAll(_effectActivities);
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
    // ! ilgili kart yes kararına swipe edildikten sonra bu metot çağırılacak.
    // todo: oyunun kaybedildiğini anlamak için ressources kontrolü timeline içine eklenirse daha mantıklı olacaktır.
    //? burada sadece değerlerin belirli aralıklarda tutulması sağlanacak.

    print("ex resources.economy_level: " + resources.economy_level.toString());
    print("ex resources.health_level: " + resources.health_level.toString());
    print("ex resources.medical_level: " + resources.medical_level.toString());
    print("ex resources.satisfaction_level: " +
        resources.satisfaction_level.toString());

    if(effectActivities.isNotEmpty){
      num changeSaticfaction = 0;
      effectActivities.forEach((activity) {
        activity.changeStatus();
        activity.familiesDo.forEach((family) {
          num satisfactionRate = activity.isActive ? ifYes[3] : ifNo[3];
          family.members.forEach((human) {
            if(human.activitiesDo.contains(activity)){
              changeSaticfaction -= human.satisfaction;
              human.satisfaction += satisfactionRate;
              if (human.satisfaction > 100) {
                human.satisfaction = 100.0;
              } else if (human.satisfaction <= 0) {
                human.satisfaction = 0.0;
              }
              changeSaticfaction += human.satisfaction;
            }
          });
        });
        print(activity.toString());
      });
      resources.totalSatifaction += changeSaticfaction;
      resources.setAverageSatisfaction();

      print("resources.satisfaction_level: " +
          resources.satisfaction_level.toString());

      if(effectActivities.first.isActive){
        resources.economy_level += ifYes[0];
        resources.health_level += ifYes[1];
        resources.medical_level += ifYes[2];
      }
      else {
        resources.economy_level += ifNo[0];
        resources.health_level += ifNo[1];
        resources.medical_level += ifNo[2];
      }
    }
    else {
      num changeSaticfaction = 0;
      families.forEach((family) {
        num satisfactionRate = 0;
        if(isSwipeNoFirst!=null){
          satisfactionRate = ifNo[3];
        }
        else{
          satisfactionRate = ifYes[3];
        }
        family.members.forEach((human) {
          changeSaticfaction -= human.satisfaction;
          human.satisfaction += satisfactionRate;
          if (human.satisfaction > 100) {
            human.satisfaction = 100.0;
          } else if (human.satisfaction <= 0) {
            human.satisfaction = 0.0;
          }
          changeSaticfaction += human.satisfaction;
        });
      });
      resources.totalSatifaction += changeSaticfaction;
      resources.setAverageSatisfaction();

      if(isSwipeNoFirst != null){
        resources.economy_level += ifNo[0];
        resources.health_level += ifNo[1];
        resources.medical_level += ifNo[2];
      }
      else {
        resources.economy_level += ifYes[0];
        resources.health_level += ifYes[1];
        resources.medical_level += ifYes[2];
      }
      isSwipeNoFirst = null;
    }

    if (resources.economy_level > 1.0) {
      resources.economy_level = 1.0;
    } else if (resources.economy_level <= 0) {
      resources.economy_level = 0.0;
    }
    if (resources.health_level > 1.0) {
      resources.health_level = 1.0;
    } else if (resources.health_level <= 0) {
      resources.health_level = 0.0;
    }
    if (resources.medical_level > 1.0) {
      resources.medical_level = 1.0;
    } else if (resources.medical_level <= 0) {
      resources.medical_level = 0.0;
    }

    print("resources.economy_level: " + resources.economy_level.toString());
    print("resources.health_level: " + resources.health_level.toString());
    print("resources.medical_level: " + resources.medical_level.toString());
  }

  swipeNo() {
    if(effectActivities.isNotEmpty){
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

      //sırasıyla->>>> school vaci sport sinem trvl shop food

      if (resources.economy_level > 1.0) {
        resources.economy_level = 1.0;
      } else if (resources.economy_level <= 0) {
        resources.economy_level = 0.0;
      }
      if (resources.health_level > 1.0) {
        resources.health_level = 1.0;
      } else if (resources.health_level <= 0) {
        resources.health_level = 0.0;
      }
      if (resources.medical_level > 1.0) {
        resources.medical_level = 1.0;
      } else if (resources.medical_level <= 0) {
        resources.medical_level = 0.0;
      }

      print("resources.economy_level: " + resources.economy_level.toString());
      print("resources.health_level: " + resources.health_level.toString());
      print("resources.medical_level: " + resources.medical_level.toString());

      num changeSaticfaction = 0;
      effectActivities.forEach((activity) {
        activity.familiesDo.forEach((family) {
          family.members.forEach((human) {
            num satisfactionRate = ifNo[3];
            if(human.activitiesDo.contains(activity)){
              changeSaticfaction -= human.satisfaction;
              human.satisfaction += satisfactionRate;
              if (human.satisfaction > 100) {
                human.satisfaction = 100.0;
              } else if (human.satisfaction <= 0) {
                human.satisfaction = 0.0;
              }
              changeSaticfaction += human.satisfaction;
            }
          });
        });
        print(activity.toString());
      });
      resources.totalSatifaction += changeSaticfaction;
      resources.setAverageSatisfaction();


      print("resources.satisfaction_level: " +
          resources.satisfaction_level.toString());
    }
    else {
      isSwipeNoFirst = true;
      swipeYes();
    }
  }
}
