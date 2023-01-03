import 'package:app/constants/constants.dart';
import 'package:app/widgets/left_bar.dart';
import 'package:app/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmi = 0;
  String _bmiResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 130,
                      child: TextField(
                        controller: _heightController,
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w400,
                          color: primaryColor,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                            fontSize: 42,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Metres",
                      style: TextStyle(fontSize: 19, color: primaryColor),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 130,
                      child: TextField(
                        controller: _weightController,
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w400,
                          color: primaryColor,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight",
                          hintStyle: TextStyle(
                            fontSize: 42,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Kilograms",
                      style: TextStyle(fontSize: 18, color: primaryColor),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _height = double.parse(_heightController.text);
                double _weight = double.parse(_weightController.text);
                setState(() {
                  _bmi = _weight / (_height * _height);
                  if (_bmi > 25) {
                    _bmiResult = "Over Weight";
                  } else if (_bmi >= 18 && _bmi <= 25) {
                    _bmiResult = "Normal Weight";
                  } else {
                    _bmiResult = "Under Weight";
                  }
                });
              },
              child: Text(
                "Calculate",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              _bmi.toStringAsFixed(2),
              style: TextStyle(fontSize: 70, color: primaryColor),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _bmiResult.isNotEmpty,
              child: Text(
                _bmiResult,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: primaryColor),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const RightBar(barwidth: 40),
            const SizedBox(
              height: 20,
            ),
            const RightBar(barwidth: 80),
            const SizedBox(
              height: 20,
            ),
            const RightBar(barwidth: 40),
            const SizedBox(
              height: 20,
            ),
            const LeftBart(barwidth: 70),
            const SizedBox(
              height: 20,
            ),
            const LeftBart(barwidth: 70),
          ],
        ),
      ),
    );
  }
}
