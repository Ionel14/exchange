import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _lei = "";
  late double _euro;
  final double _exchangeValue = 4.9;

  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Currency Convertor")),
      ),
      body: Column(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Image(
            image: NetworkImage("http://storage0.dms.mpinteractiv.ro/media/1/1481/22466/19117627/1/76459788-l.jpg"),
            width: 300,
            height: 300,),
           Padding(
             padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
             child: TextField(
              keyboardType: TextInputType.number,
               style: const TextStyle(fontSize: 30),
              decoration: InputDecoration(
                  hintText: "enter the amount in Eur",
                  errorText: error? "please enter a number" : null
              ),
              onChanged: (value) {
                try {
                  _euro = double.parse(value);
                  error = false;
                } catch (e) {
                  error = true;
                }
              },
          ),
           ),
          TextButton(
            onPressed: (){
              setState(() {
                if(!error)
                {
                  _lei = (_euro * _exchangeValue).toString();
                }
              });
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(const Size(100, 50)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black26)),
            child: const Text(
                'Convert',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black
              )
            ),
          ),
          Text(
            _lei,
              style: const TextStyle(fontSize: 30))
        ],
      ),
    );
  }
}
