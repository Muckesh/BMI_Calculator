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
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
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
                    Container(
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
            SizedBox(
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
              child: Container(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmi.toStringAsFixed(2),
                style: TextStyle(fontSize: 70, color: primaryColor),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _bmiResult.isNotEmpty,
              child: Container(
                child: Text(
                  _bmiResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: primaryColor),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RightBar(barwidth: 40),
            SizedBox(
              height: 20,
            ),
            RightBar(barwidth: 80),
            SizedBox(
              height: 20,
            ),
            RightBar(barwidth: 40),
            SizedBox(
              height: 20,
            ),
            LeftBart(barwidth: 70),
            SizedBox(
              height: 20,
            ),
            LeftBart(barwidth: 70),
          ],
        ),
      ),
    );
  }
}
