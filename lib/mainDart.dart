import 'dart:io';
import 'utils/config.dart';
import 'utils/utils.dart';

void main() {
  gameStarter();
}

void gameStarter() {
  print("Please select game difficulty: " + difficultyOptions.toString());
  setDifficulty(stdin.readLineSync()!);
  createHumans(difficulty); //!create hobbie bunun içinde bulunuyor.
  createFamilies();
  //utils.covidSpread();
  //utils.createQuestions(); //! sorular create_questions içinde belirtildikten sonra hepsi burada oluşturuluyor.
}
