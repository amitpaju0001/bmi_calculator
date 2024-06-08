
import 'package:flutter/material.dart';

import 'screen/shared/bmi_calculator_colors.dart';

class CalculateScreen extends StatefulWidget {
   const CalculateScreen({super.key,required this.title,required this.bmi,required this.subTile});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
 final String title;
 final double bmi;
 final String subTile;
}

class _CalculateScreenState extends State<CalculateScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('BMI Calculator',style: TextStyle(color: Colors.white),),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Your Result',textAlign:TextAlign.center, style: veryLargeTextStyle),
          ),
          Expanded(
            child: Container(
              color: isSelected,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.title,textAlign: TextAlign.center, style: TextStyle(color: Colors.green,fontSize: 20),),
                  Text(widget.bmi.toStringAsFixed(2) ,textAlign: TextAlign.center, style: veryLargeTextStyle,),
                  Text(
                    widget.subTile,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
               } ,
              child: Container(
                height: 60,
                width: double.infinity,
                color: buttonColor,
                child: Center(child: Text('Re - Calculate'.toUpperCase(),style: numberTextStyle,)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
