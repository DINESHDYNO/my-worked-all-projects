import 'package:flutter/material.dart';
import 'package:second_page_show_image/kumar.dart';

void main() {
  runApp(const One());
}

class One extends StatelessWidget {
  const One({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Two(),
    );
  }
}

class Two extends StatefulWidget {
  const Two({Key? key}) : super(key: key);

  @override
  _TwoState createState() => _TwoState();
}

class _TwoState extends State<Two> {
  var a;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            child: Column(

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
                          image:AssetImage('images/dyno.png'),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>kumar(a:'images/dyno.png'),));
                }, icon: Icon(Icons.ads_click_outlined)),
                Text('Click Me!!')
              ],
              // Corrected the image path
            ),
          ),
        ],
      ),
    );
  }
}
