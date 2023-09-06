import 'package:flutter/material.dart';

void main() {
  runApp(CombinationCalculatorApp());
}

class CombinationCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kombinasyon Hesaplayıcı'),
        ),
        body: CombinationCalculator(),
      ),
    );
  }
}

class CombinationCalculator extends StatefulWidget {
  @override
  _CombinationCalculatorState createState() => _CombinationCalculatorState();
}

class _CombinationCalculatorState extends State<CombinationCalculator> {
  TextEditingController _nController = TextEditingController();
  TextEditingController _rController = TextEditingController();
  String result = '';

  int calculateCombination(int n, int r) {
    if (n < r) return 0; // r, n'den büyükse kombinasyon yok.
    int numerator = 1;
    int denominator = 1;
    for (int i = 1; i <= r; i++) {
      numerator *= n;
      denominator *= i;
      n--;
    }
    return numerator ~/ denominator;
  }

  void calculate() {
    int n = int.tryParse(_nController.text) ?? 0;
    int r = int.tryParse(_rController.text) ?? 0;

    int combination = calculateCombination(n, r);

    setState(() {
      result = 'C($n, $r) = $combination';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _nController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: 'n (Toplam Öğrenci Sayısı)',
                labelStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _rController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: 'r (Seçilecek Öğrenci Sayısı)',
                labelStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: calculate,
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: TextStyle(fontSize: 18),
            ),
            child: Text('Hesapla'),
          ),
          SizedBox(height: 20),
          Text(
            result,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
