import '/domain/model/activity.dart';
import '/utils/config.dart';
import 'dart:math';

Random rand = Random();

class Human {
  String name = ""; // todo: sonradan çıkarılacak.
  String surname = "";
  num age = 0;
  List<Activities> activitiesDo = [];
  int familyId = 0;
  bool isCovid = false;
  num health = 0; // ! hastalık sınıfı etki edecek dikkat!
  bool? isVaccinated; //! diğer kodda daha farklı tipteydi dikkat.
  //bool isGetOverCorona = false;
  int antibody = 0;
  num satisfaction = 0;
  //int memberType = 0; //? 0'sa çocuk 1 se yetişkin 2 ise yaşlı
  bool isAlive = true;

  double sensitivity = 0.0; // 1 e ne kadar yakınsa o kadar dikkatli
  double infectionRate = 0.0;

  Human(String Name, String Surname, int Age) {
    name = Name;
    surname = Surname;
    age = Age;
    isCovid = false;

    if (age < 5) {
      health = 95 + rnd.nextInt(6);
      satisfaction = 50 + rnd.nextInt(50);
      sensitivity = (70 + rnd.nextInt(31)) / 100;
    } else if (age < 14) {
      health = 95 + rnd.nextInt(6);
      satisfaction = 50 + rnd.nextInt(50);
      sensitivity = (50 + rnd.nextInt(51)) / 100;
      setActivities([
        activities[0],
      ]);
      if (rand.nextDouble() < 0.05) {
        setActivities([activities[4]]);
      }
    } else if (age <= 24) {
      health = 90 + rnd.nextInt(11);
      satisfaction = 40 + rnd.nextInt(41);
      sensitivity = (20 + rnd.nextInt(61)) / 100;
      setActivities([activities[0]]);
      if (rand.nextDouble() < 0.25) {
        setActivities([activities[4]]);
      }
      if (rand.nextDouble() < 0.35) {
        setActivities([activities[5]]);
      }
      if (rand.nextDouble() < 0.01) {
        setActivities([activities[9]]);
      }
      if (rand.nextDouble() < 0.35) {
        // todo şehirler arası ile şehir içi arasındaki fark tartışılacak.
        setActivities([activities[2]]);
      }
    } else if (age <= 40) {
      health = 85 + rnd.nextInt(16);
      satisfaction = 50 + rnd.nextInt(31);
      sensitivity = (15 + rnd.nextInt(56)) / 100;
      setActivities([activities[1], activities[5], activities[2]]);
      if (rand.nextDouble() < 0.01) {
        setActivities([activities[7]]);
      }
      if (rand.nextDouble() < 0.40) {
        setActivities([activities[9]]);
      }
      if (rand.nextDouble() < 0.06) {
        setActivities([activities[4]]);
      }
    } else if (age <= 59) {
      health = 75 + rnd.nextInt(16);
      satisfaction = 60 + rnd.nextInt(21);
      sensitivity = (10 + rnd.nextInt(66)) / 100;
      setActivities([activities[1]]);
      if (rand.nextDouble() < 0.50) {
        setActivities([activities[5]]);
      }
      if (rand.nextDouble() < 0.10) {
        setActivities([activities[6]]);
      }
      if (rand.nextDouble() < 0.10) {
        setActivities([activities[7]]);
      }
      if (rand.nextDouble() < 0.45) {
        setActivities([activities[9]]);
      }
    } else if (age < 80) {
      health = 65 + rnd.nextInt(16);
      satisfaction = 70 + rnd.nextInt(21);
      sensitivity = (45 + rnd.nextInt(51)) / 100;
      if (rand.nextDouble() < 0.04) {
        setActivities([activities[1]]);
      }
      if (rand.nextDouble() < 0.08) {
        setActivities([activities[5]]);
      }
      if (rand.nextDouble() < 0.10) {
        setActivities([activities[7]]);
      }
      if (rand.nextDouble() < 0.65) {
        setActivities([activities[9]]);
      }
    } else if (age >= 80) {
      health = 55 + rnd.nextInt(16);
      satisfaction = 65 + rnd.nextInt(31);
      sensitivity = (55 + rnd.nextInt(36)) / 100;
      if (rand.nextDouble() < 0.02) {
        setActivities([activities[7]]);
      }
      if (rand.nextDouble() < 0.05) {
        setActivities([activities[9]]);
      }
    }
  }

  @override
  String toString() {
    return name +
        " is a human. His surname is " +
        surname +
        " and he is " +
        age.toString() +
        " years old. Family Id: " +
        familyId.toString() +
        " He is Covid -> " +
        isCovid.toString();
  }

  void setFamilyId(int FamilyId) {
    familyId = FamilyId;
  }

  void setActivities(List<Activities> Activities) {
    for (var activity in Activities) {
      if (activitiesDo.contains(activity)) {
        print("already added" + activity.toString());
      } else {
        activitiesDo.add(activity);
        activity.incrementMemberCount();
      }
    }
  }

  void setactByage(Activities act) {
    if (age < 5) {
    } else if (age < 14) {
      if (act.name != "work") {
        setActivities([act]);
      }
    } else if (age <= 24) {
      setActivities([act]);
    } else if (age <= 40) {
      if (act.name != "school") {
        setActivities([act]);
      }
    } else if (age <= 59) {
      if (act.name != "school") {
        setActivities([act]);
      }
    } else if (age < 80) {
      if (act.name != "school") {
        setActivities([act]);
      }
    } else if (age >= 80) {
      if (act.name == "travel") {
        setActivities([act]);
      }
    }
  }

  List<Activities> getActivities() {
    return activitiesDo;
  }

  void deleteActivity(Activities act) {
    if (activitiesDo.contains(act)) {
      act.decrementMemberCount();
    }
    activitiesDo.remove(act);
  }

  void makeDead() {
    //todo
  }
}
