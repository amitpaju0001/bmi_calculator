import 'dart:math';

class BmiCalculator{

   double  bmi = 0.0;

  double calculateBmi(double weight,double height){
    bmi = (weight/pow((height/100), 2));
    return bmi;
  }
  String calculateTitle(){
    if(bmi >= 25){
      return 'OVERWEIGHT';
    }else if(bmi >18.5){
      return 'NORMAL';
    }else{
      return 'OVERWEIGHT';
    }
  }

  String calculateSubtitle(){
    if(bmi >=25){
      return 'You have gained too much weight. You how to do excercise daily.';
    }else if(bmi > 18.5){
      return 'Congratulation you have normal Body weight. But if you still wanna do gym then its no problem';
    }else{
      return ' You  are too weak. You have to gane more weight. I recomend you to eat well';
    }
  }
}