import 'package:bmi_calculator/bmi_calculator_class.dart';
import 'package:bmi_calculator/calculate_screen.dart';
import 'package:flutter/material.dart';

import 'screen/shared/bmi_calculator_colors.dart';
import 'bottom_card_screen.dart';

class BmiCalculatorScreen extends StatefulWidget {
    const BmiCalculatorScreen({super.key});


  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}
class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  late double height = 200.0;
  late double weight = 70.0;
  late double age = 20;
   bool maleContainer = true;
   bool femaleContainer = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR',style: TextStyle(color: Colors.white),),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if(maleContainer){
                                maleContainer = false;
                              }else{
                                if(femaleContainer){
                                femaleContainer = false;                        }
                              maleContainer = true;                      }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: maleContainer? isSelected: notSelected,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.male,
                                  size: 90,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(color: Colors.white, fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if(femaleContainer){
                                femaleContainer = false;
                              }else{
                                if(maleContainer){
                                  maleContainer = false;
                                }
                                femaleContainer = true;
                              }
                            });
                          },
                          child:Container(
                            decoration: BoxDecoration(
                              color: femaleContainer? isSelected: notSelected,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.female,
                                  size: 90,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(color: Colors.white, fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
                child: ReusebleContainer(
                  colour: notSelected,
                  cardChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('HEIGHT',style: containerTextStyle,),
                         SizedBox(height: 10,),
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.baseline,
                           mainAxisAlignment: MainAxisAlignment.center,
                           textBaseline: TextBaseline.alphabetic,
                           children: [
                             Text('${height.toInt()}',style: numberTextStyle),
                             Text(
                               'cm',style: containerTextStyle
                             ),
                           ],
                         ),
                         Slider(value: height,
                           min: 150,
                           max: 800,
                           onChanged: (value) {
                           setState(() {
                             height=value;
                           });
                         },
                           thumbColor: buttonColor,
                           activeColor: Colors.white,
                         ),
                       ],
                    ),
                  ),
                )
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    children: [
                      BottomCard( name: 'WEIGHT',number: weight,
                   onChanged: (newWeight) {
                   setState(() {
                    weight = newWeight;
                  });
                   } ),
                      BottomCard( name: 'AGE',number: age,
                     onChanged: ( newAge) {
                       setState(() {
                         age = newAge;
                       });
                     } ),
                    ],
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  BmiCalculator bmiCalculator  = BmiCalculator();
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>CalculateScreen(
                    title: bmiCalculator.calculateTitle(),
                    bmi: bmiCalculator.calculateBmi(weight, height) ,
                    subTile: bmiCalculator.calculateSubtitle() ,
                  )));
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  color: buttonColor,
                  child: Center(child: Text('Calculate'.toUpperCase(),style: numberTextStyle,)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




class ReusebleContainer extends StatelessWidget {
  ReusebleContainer({required this.colour, required this.cardChild});

  Color colour;
  Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: notSelected,
          borderRadius: BorderRadius.circular(20),
        ),
        child: cardChild);
  }
}
