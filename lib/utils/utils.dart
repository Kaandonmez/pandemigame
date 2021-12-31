import '/domain/model/resources.dart';

import 'config.dart';
import 'package:pandemigame/utils/covid.dart';
import '/domain/model/family.dart';
import '/domain/model/activity.dart';
import '/domain/model/human.dart';
import 'create_questions.dart';
import 'dart:math';

var newZealandPopulationPyramide = [19.431, 64.201, 16.368];
Random rnd = new Random();
// todo: liste yeni aralıklarla düzenlenecek!
//var turkeyPopulationPyramide = [23.942,67.077,8.981];
var turkeyPopulationPyramide = [42.2, 24.7, 17.8, 13.9, 1.4];
//*genç nüfustan yaşlı nüfusa doğru sıralanmış (sadece türkiye için)

/// !0-24 -> %42,2
/// !25-39 -> %24,7
/// !40-59 -> %17,8
/// !60-79 -> %13,9
/// !80+ -> %1,4
///
///
///
/// !0-24 -> %42,2  %48 civarı
/// !25-59 -> %24,7 %35 civarı
/// !60-100 -> %13,9

var indiaPopulationPyramide = [26.161, 67.265, 6.578];

List getNewZealandPopulationPyramide() {
  print("Selected population: New Zealand");
  return newZealandPopulationPyramide;
}

List getTurkeyPopulationPyramide() {
  print("Selected population: Turkey");
  return turkeyPopulationPyramide;
}

List getIndiaPopulationPyramide() {
  print("Selected population: India");
  return indiaPopulationPyramide;
}

int getRandomAge(int min, int max) {
  return min + rnd.nextInt(max - min);
}

void createHumans(String selectedDifficulty) {
  print("aktiviteler oluşturuluyor");
  createActivities();
  print("aktiviteler oluşturuldu");
  switch (selectedDifficulty) {
    case "easy":
      {
        populationPyramide = getNewZealandPopulationPyramide();
        break;
      }
    case "medium":
      {
        populationPyramide = getTurkeyPopulationPyramide();
        break;
      }
    case "hard":
      {
        populationPyramide = getIndiaPopulationPyramide();
      }
  }
  print("insanlar oluşturuluyor");
  int counter = 0;
  num totalHealth = 0.0;
  while (counter < 200000) {
    //! toplam oluşturulacak insan sayısı buradan belirtiliyor.
    /**
        * !0-24 -> %42,2   0
        * !25-39 -> %24,7  1
        * !40-59 -> %17,8  2
        * !60-79 -> %13,9  3
        * !80+ -> %1,4     4
        */
    if (counter < populationPyramide[4] * 2000) {
      humans.add(Human("Old" + counter.toString(), counter.toString(),
          getRandomAge(80, 100)));
      totalHealth += humans[counter].health;
    } else if (counter <
        (populationPyramide[3] + populationPyramide[4]) * 2000) {
      humans.add(Human("Middle-old" + counter.toString(), counter.toString(),
          getRandomAge(60, 79)));
      totalHealth += humans[counter].health;
    } else if (counter <
        (populationPyramide[3] +
                populationPyramide[4] +
                populationPyramide[2]) *
            2000) {
      humans.add(Human("Middle" + counter.toString(), counter.toString(),
          getRandomAge(40, 59)));
      totalHealth += humans[counter].health;
    } else if (counter <
        (populationPyramide[3] +
                populationPyramide[4] +
                populationPyramide[2] +
                populationPyramide[1]) *
            2000) {
      humans.add(Human("Middle-young" + counter.toString(), counter.toString(),
          getRandomAge(25, 39)));
      totalHealth += humans[counter].health;
    } else {
      humans.add(Human("Young" + counter.toString(), counter.toString(),
          getRandomAge(0, 24)));
      totalHealth += humans[counter].health;
    }
    //print(humans[counter]);
    counter++;
  }
  resources.health_level = totalHealth / (counter * 100);
  print(resources.health_level);
  print("insanlar oluşturuldu");
  /*for (int i = 0; i < 100000; i++) {
      print(humans[i].toString());
    }
    print("\n");
    print(humans.length.toString());
    */
  //!   <---- hobiler burada oluşturuluyor.
}

void createFamilies() {
  int counter_family = 0;
  int counter_adult = 30600; //13900~24699
  int counter_young = 115600; //24700~99999
  int counter_old = 0; //0~13899
  print("aileler oluşturuluyor");
  while (counter_family < 29000) {
    //!  <----- kaç adet aile olşturulacağı burada belirleniyor.

    /**
         * ! 1 kişilik aile %17,9 +++ -> 
         * ! 2 yetişkinli aile %13,6 +++ ->
         * ! 2 yetişkin 1 çocuk %21 +++  ->
         * ! 2 yeiştkin 2 çocuk %21 +++  ->
         * ! 1 yetişkin 1 çocuk %9,7 +++ ->
         * ! 2 yetişkin 1 çocuk 1 yaşlı %14 +++ ->
         * ! 3 kişilik yetişkin ve 1 yaşlı %2,8 ->
         */

    if (counter_family < 6089) {
      //? 2 yetişkin 1 çocuk %21
      families.add(Family(counter_family, [
        humans[counter_adult],
        humans[++counter_adult],
        humans[counter_young]
      ]));
      counter_adult++;
      counter_young++;
    } else if (counter_family < 12179) {
      //? 2 yeiştkin 2 çocuk %21
      families.add(Family(counter_family, [
        humans[counter_adult],
        humans[++counter_adult],
        humans[counter_young],
        humans[++counter_young]
      ]));
      counter_adult++;
      counter_young++;
    } else if (counter_family < 17370) {
      //? 1 kişilik aile %17,9
      families.add(Family(counter_family, [humans[counter_adult]]));
      counter_adult++;
    } else if (counter_family < 21430) {
      //? 2 yetişkin 1 çocuk 1 yaşlı %14
      families.add(Family(counter_family, [
        humans[counter_adult],
        humans[++counter_adult],
        humans[counter_young],
        humans[counter_old]
      ]));
      counter_adult++;
      counter_young++;
      counter_old++;
    } else if (counter_family < 25374) {
      //? 2 yetişkinli aile %13,6
      families.add(Family(
          counter_family, [humans[counter_adult], humans[++counter_adult]]));
      counter_adult++;
    } else if (counter_family < 28187) {
      //? 1 yetişkin 1 çocuk %9,7
      families.add(Family(
          counter_family, [humans[counter_adult], humans[counter_young]]));
      counter_adult++;
      counter_young++;
    } else if (chance < 28999) {
      //? 3 kişilik yetişkin ve 1 yaşlı %2,8
      families.add(Family(counter_family, [
        humans[counter_adult],
        humans[++counter_adult],
        humans[++counter_adult],
        humans[counter_old]
      ]));
      counter_adult++;
      counter_old++;
    }
    families[counter_family].activities.forEach((activity) {
      activity.familiesDo.add(families[counter_family]);
    });
    counter_family++;
  }
  print("aileler oluşturuldu");
  /*for (var family in families) {
      print(family);
    }*/
}

void createActivities() {
  activities.add(Activities("school", 0.01, true)); // 0 remote 1 face 2 no
  activities.add(Activities("work", 0.003, true)); //1
  activities.add(Activities("travel", 0.0003, true)); //2
  activities.add(Activities("sports", 0.0003, true)); //3
  activities.add(Activities("cinema", 0.01, true)); //4
  activities.add(Activities("shopping", 0.006, true)); //5
  activities.add(Activities("food", 0.013, true)); //6
  activities.add(Activities("ceremony", 0.015, true)); //7
  activities.add(Activities("start vaccination", 0.003, false)); //8
  activities.add(Activities("worship", 0.012, true)); //9
}

void createQuestions() {
  print("soru oluşturmaya geldik");
  create_Questions();
  print("sorular oluşturuldu");
  print(questions[0].ifYes);
  print(questions[0].ifYes[0]);
  print(questions.length.toString());
}

void createResources() {
  Resources Res = Resources();
}

void simulateOneWeek() {
  if (positiveFamilies.isNotEmpty) {
    print("döngü öncesi pozitif aile sayısı:");
    print(positiveFamilies.length.toString());
    positiveFamilies.forEach((family) {
      if (--family.recoverDay == 0) {
        getRidOfFamiliesCovid(family);
      }
    });
    positiveFamilies.removeWhere((family) => family.recoverDay == 0);
    print("döngü sonrası pozitif aile sayısı:");
    print(positiveFamilies.length.toString());
  }
  print("döngü öncesi pozitif insan sayısı:");
  print(positiveCounter.toString());
  activities.forEach((activity) {
    if(activity.isActive){
      activity.familiesDo.forEach((family) {
        double random = rnd.nextDouble();
        if (family.recoverDay == 0 && random < activity.getInfectionRate()) {
          makeFamilyCovid(family);
        }
      });
    }
  });
  print("döngü sonras pozitif insan sayısı:");
  print(positiveCounter.toString());
}

void spendWeek() {}
