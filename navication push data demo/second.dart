import 'package:flutter/material.dart';

class kumar extends StatefulWidget {
  final String? ram;

  kumar({this.ram, Key? key}) : super(key: key);

  @override
  State<kumar> createState() => _kumarState();
}

class _kumarState extends State<kumar> {
  TextEditingController _num2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _num2.text = widget.ram ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second page'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            TextFormField(
              controller: _num2,
              decoration: InputDecoration(
                labelText: 'get text',
                border: OutlineInputBorder(),
                hintText: 'Get text',
              ),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),
            ),
          ],
        ),
      ),
    );
  }
}

