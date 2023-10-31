import 'package:flutter/material.dart';


class histroy extends StatefulWidget {
  const histroy({super.key});

  @override
  State<histroy> createState() => _histroyState();
}

class _histroyState extends State<histroy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.delete,size: 30,))
        ],
      ),
      backgroundColor: Colors.deepPurple[200],
    );
  }
}
