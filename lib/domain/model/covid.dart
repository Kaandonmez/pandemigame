import 'dart:math';

import 'package:pandemigame/domain/model/family.dart';

import '/domain/model/activity.dart';
import '../../utils/config.dart';
import 'human.dart';


class Covid {
  int positiveCounter = 0;
  List<Family> positiveFamilies = [];

  List<Family> getPositiveFamilies(){
    return positiveFamilies;
  }
  void makeHumanCovid(Human human) {
    //* tek bir insanı covid yap.
    human.isCovid = true;
    try {
      makeFamilyCovid(families[human.familyId]); // todo:
    } catch (e) {}
  }

  void makeFamilyCovid(Family family) {
    positiveFamilies.add(family);
    family.recoverDay = 2;
    int counter = 0;
    while (counter < family.members.length) {
      family.members[counter].isCovid = true;
      family.members[counter].getActivities().forEach((activity) {
        activity.infectedHumans++;
      });
      counter++;
      positiveCounter++;
    }
  }

  void getRidOfFamiliesCovid(Family family) {
    positiveFamilies.remove(family);
    family.members.forEach((human) {
      human.isCovid = false;
      --positiveCounter;
      human.getActivities().forEach((activity) {
        --activity.infectedHumans;
      });
    });
  }

  void calculteRisk(Human human, Activities act) {
    act.infectionRate;
    human.infectionRate = 1;
    //! antibody , sensitivity , socialDistance

    1 - human.sensitivity + act.infectionRate;
  }

  //todo: belki daha sonra ortama hobiye ve virüs tipine göre covid yayılması aşağıdaki prototipe yazılabilir. (mi?)

}
