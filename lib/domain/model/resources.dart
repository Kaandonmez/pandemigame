import '/utils/config.dart';

class Resources {
  num totalSatifaction = 0;
  int counterHumansHaveFamily = 0;
  num health_level = 0;
  num satisfaction_level = 0;
  num economy_level = 0;
  num medical_level = 0;

  void setAverageSatisfaction() {
    satisfaction_level = totalSatifaction / counterHumansHaveFamily;
  }

  Resources() {
    if (difficulty == "medium") {
      satisfaction_level = 0.9;
      economy_level = 0.75;
      medical_level = 0.2;
    }
  }
}
