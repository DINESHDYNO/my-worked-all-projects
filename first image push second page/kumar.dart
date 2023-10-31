import 'package:flutter/material.dart';
import 'package:second_page_show_image/main.dart';


class kumar extends StatefulWidget {
  final String a;
  const kumar({super.key,required this.a});

  @override
  State<kumar> createState() => _kumarState();
}

class _kumarState extends State<kumar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image:AssetImage(widget.a),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          ElevatedButton.icon(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>One()));
          }, icon: Icon(Icons.pan_tool_alt), label: Text('Click Me !!'))
        ],
      ),
    );

  }
}