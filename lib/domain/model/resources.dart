import '/utils/config.dart';

class Resources {
  /** 
   * *oyundaki değişken olan değerleri ifade ediyor.
   * ! değerlerin daha sonradan isimleri değiştirilecek.
   * ?ancak başlangıç olması açısından temsili isimler konuldu.
   * todo: bu değerlerin isimlerinin belirtilmesiyle beraber artıp azalma fonksiyonları yazılacak.
   * todo: ayrıca aynı anda birkaç değeri de arttrıp azaltma metotları eklenebilir. 
   * todo: (ancak önce isimleri ve kaç tane değişken olacağı kesinletirilmeli)
   * ? time classı açmasak, her yes veya no swipe edildiğinde x gün arttırsak olur mu?
   */ ///

  double X = 0;

  double Y = 0;

  double Z = 0;

  double T = 0;

  double M = 0;

  double N = 0;

  double P = 0;

  num totalSatifaction = 0;
  int counterHumansHaveFamily = 0;
  num health_level = 0;
  num satisfaction_level = 0;
  num economy_level = 0;
  num medical_level = 0;

  void setAverageSatisfaction(){
    satisfaction_level = totalSatifaction/counterHumansHaveFamily;
  }

  Resources() {
    if (difficulty == "medium") {
      satisfaction_level = 0.9;
      economy_level = 0.75;
      medical_level = 0.2;
    }
  }
}
