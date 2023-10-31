import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int kumar = 0;
  List<String> ram = [
    'images/dyno.png',
    'images/dyno.png',
    'images/dyno.png',
    'images/dyno.png',
  ];

  void change_image() {
    setState(() {
      kumar = kumar < 4 ? kumar + 1 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Box in image change program example'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 20),
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10),
                        image: kumar == 1
                            ? DecorationImage(
                                image: AssetImage(ram[0]),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10),
                        image: kumar == 2
                            ? DecorationImage(
                                image: AssetImage(ram[1]),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 20),
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10),
                        image: kumar == 3
                            ? DecorationImage(
                                image: AssetImage(ram[2]),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10),
                        image: kumar == 4
                            ? DecorationImage(
                                image: AssetImage(ram[3]),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: change_image,
                  child: Text('Click me to image change',
                  style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
