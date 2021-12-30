import 'package:pandemigame/domain/model/family.dart';

class Activities {
  String name = "";
  double infectionRate = 0.0;
  int memberCount = 0;
  bool isActive = true;
  List<Family> familiesDo = [];
  int infectedHumans = 0;

  Activities(String Name, double InfectionRate, bool _isActive) {
    name = Name;
    infectionRate = InfectionRate;
    isActive = _isActive;
    //memberCount += 1;
    //! hobiler humanlar oluşturulurken ekleniyor ancak hobiler 1 kere create ediliyor memberCount şuan gereksiz.
  }

  double getInfectionRate(){
    return infectionRate+infectedHumans/2000000;
  }

  void incrementMemberCount() {
    memberCount += 1;
  }

  void decrementMemberCount() {
    memberCount -= 1;
  }

  void changeStatus() {
    isActive = !isActive;
  }

  @override
  String toString() {
    return name +
        " " +
        infectionRate.toString() +
        "...   " +
        isActive.toString();
  }
}
