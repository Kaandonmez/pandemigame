import 'dart:math';

import 'package:pandemigame/domain/model/family.dart';

int positiveCounter = 0;
List<Family> positiveFamilies = [];

List<Family> getPositiveFamilies() {
  return positiveFamilies;
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
  family.members.forEach((human) {
    human.isCovid = false;
    --positiveCounter;
    human.getActivities().forEach((activity) {
      --activity.infectedHumans;
    });
  });
}

//todo: belki daha sonra ortama hobiye ve virüs tipine göre covid yayılması aşağıdaki prototipe yazılabilir. (mi?)
