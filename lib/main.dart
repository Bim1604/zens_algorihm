import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  String result = "";

  void calculator () {
    try {
      String value = controller.text.trim();
      List<String> listTemp = value.split(" ");
      if (listTemp.length == 5) {
        List<int> numbers = listTemp.map(int.parse).toList();
        int totalSum = numbers.reduce((a, b) => a + b);
        int minValue = numbers.reduce((a, b) => a < b ? a : b);
        int maxValue = numbers.reduce((a, b) => a > b ? a : b);

        int minSum = totalSum - maxValue;
        int maxSum = totalSum - minValue;
        result = "Min: $minSum    Max: $maxSum";
      } else {
        result = "Chưa nhập đủ 5 số";
      }
      if (mounted) {
        setState(() {
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          result = "Hãy nhập chữ số";
        });
      }
    }
  }
  
  void resetData () {
    if (mounted) {
      setState(() {
        controller.text = "";
        result = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mini-Max Sum"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(result),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 1.0, color: Colors.black)
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Nhập dãy 5 số nguyên cách nhau dấu cách",
                  hintStyle: TextStyle(fontSize: 13),
                  isDense: true,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10,right: 5,top: 7.0, bottom: 7.0)
                ),
                controller: controller,
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: (){
                calculator();
              }, child: const Text("Tính")
            ),
            ElevatedButton(
              onPressed: (){
                resetData();
              }, child: const Text("Đặt lại")
            )
          ],
        ),
      ),
    );
  }
}