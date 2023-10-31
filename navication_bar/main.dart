import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Air(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Air extends StatefulWidget {
  @override
  _AirState createState() => _AirState();
}

class _AirState extends State<Air> {
  int myIndex = 0;
  final List<Widget> tabs = [
    Center(child: Text('Home', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.red),)),
    Center(child: Text('Search',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.red),)),
    Center(child: Text('Chat',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.red),)),
    Center(child: Text('Music',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.red),)),
  Center(child: Text('Gmail',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.red),)),
  Center(child: Text('Person',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.red),))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation bar example"),
      ),
      body: tabs[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
            backgroundColor: Colors.yellow
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Music',
            backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline_sharp),
              label: 'Gmail',
              backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Person',
              backgroundColor: Colors.cyanAccent
          ),
        ],
      ),
    );
  }
}
