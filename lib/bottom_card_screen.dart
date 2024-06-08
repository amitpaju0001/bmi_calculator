import 'package:flutter/material.dart';
import 'screen/shared/bmi_calculator_colors.dart';
import 'bmi_calculator_screen.dart';

class BottomCard extends StatefulWidget {
  final double number;
  final String name;
  final ValueChanged<double> onChanged;

  BottomCard({
    required this.number,
    required this.name,
    required this.onChanged,
  });

  @override
  State<BottomCard> createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  late double number;
  late String name;
  late ValueChanged<double> onChanged;

  @override
  void initState() {
    super.initState();
    number = widget.number;
    name = widget.name;
    onChanged = widget.onChanged;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: ReusebleContainer(
          colour: isSelected, // Assuming isSelected is defined somewhere in your code
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name.toUpperCase(),
                style: containerTextStyle, // Assuming containerTextStyle is defined somewhere in your code
              ),
              Text(
                number.toString(),
                style: containerTextStyle, // Assuming containerTextStyle is defined somewhere in your code
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: iconButtonColor,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          number += 1;
                          onChanged(number);
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: iconButtonColor,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          number -= 1;
                          onChanged(number);
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
