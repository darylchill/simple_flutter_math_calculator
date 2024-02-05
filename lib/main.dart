import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toast_bar/flutter_toast_bar.dart';
import 'package:simplecalculator/operations.dart';

import 'floatingactionbutton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
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
  String math ="";
  double value = 0;
  TextEditingController txtNumber1 = TextEditingController();
  TextEditingController txtNumber2 = TextEditingController();
  Operation operation = Operation();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                child:  TextField(
                  controller: txtNumber1,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Number 1',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                child:  TextField(
                  controller: txtNumber2,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Number 2',
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                  child: Text('$math of ${txtNumber1.text} and ${txtNumber2.text}'),
              ),

            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          child:Stack(
            //alignment to the bottomright ->
            alignment: Alignment.bottomRight,
            children: [
              Positioned(
                  bottom: 300,
                  child: FloatingActionButtonCustom(
                    title: 'Addition',
                    onPressed: (){
                      setState(() {
                        math="add";
                      });
                      operation.calculate(context,math,double.parse(txtNumber1.text),double.parse(txtNumber2.text));
                    },
                    icon: const Icon(Icons.add),)
              ),
              Positioned(
                  bottom: 200,
                  child: FloatingActionButtonCustom(
                    title: 'Subtraction',
                    onPressed: (){
                      setState(() {
                        math="subtract";
                      });
                      operation.calculate(context,math,double.parse(txtNumber1.text),double.parse(txtNumber2.text));
                    },
                    icon: const Icon(Icons.remove),)
              ),
              //position 100px below the below widget
              Positioned(
                  bottom: 100,
                  child: FloatingActionButtonCustom(
                    title: 'Multiplication',
                    onPressed: (){
                      setState(() {
                        math="multiply";
                      });
                      operation.calculate(context,math,double.parse(txtNumber1.text),double.parse(txtNumber2.text));
                    },
                    icon: const Icon(CupertinoIcons.multiply),)
              ),
              //position 0px bottom
              Positioned(
                  bottom: 0,
                  child: FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        math="divide";
                      });
                      operation.calculate(context,math,double.parse(txtNumber1.text),double.parse(txtNumber2.text));
                    },
                    tooltip: 'Division',
                    child:  const Icon(CupertinoIcons.divide),
                  )
              ),

            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
