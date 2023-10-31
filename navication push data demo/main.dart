import 'package:flutter/material.dart';
import 'package:navicator11/second.dart';

void main() {
  runApp(const one());
}

class one extends StatelessWidget {
  const one({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: two(),
      color: Colors.green,
    );
  }
}

class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {
  var  _num1=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            TextFormField(
              controller: _num1,
              decoration: InputDecoration(
                label:Text('Enter a Text'),
                border: OutlineInputBorder(),
                hintText: 'Enter a text...'
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => kumar(ram: _num1.text)));
                  setState(() {
                  });
                },
                icon: Icon(Icons.ads_click_outlined),
                label: Text('Click Me!!'),
              ),
            )

          ],
        ),
      ),
    );

  }
}