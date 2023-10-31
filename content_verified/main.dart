import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main(){
  runApp(tree());
}
class tree extends StatelessWidget {
  const tree({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: leaf(),
    );
  }
}
class leaf extends StatefulWidget {
  const leaf({super.key});

  @override
  State<leaf> createState() => _leafState();
}

class _leafState extends State<leaf> {
  var a= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mobile no verification',),),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: a,
              maxLength: 10,
              inputFormatters:[
                FilteringTextInputFormatter.digitsOnly,
              ],

              decoration: InputDecoration(
                border: OutlineInputBorder(
                ),
                labelText: 'Enter your phone no',
                icon: Icon(Icons.phone),
                hintText: 'Enter your phone no ',
              ),
            ),
            TextButton(onPressed: () {
              if (isValidNumber(a.text)) {
                showDialog(context: context, builder: (context) =>
                    AlertDialog(
                      backgroundColor: Colors.green[500],
                      title: Text('succesfull!'),
                      content: Text('The number your enter is valid.'),
                      actions: [
                        ElevatedButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text('Go back'))
                      ],
                    ),
                );
                print("---true");
              }
              else {
                showDialog(context: context, builder: (context) =>
                    AlertDialog(
                        backgroundColor: Colors.red[500],
                      title: Text('Failuer!'),
                      content: Text('The number your enter not valid.'),
                      actions: [
                        ElevatedButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text('Go back'))
                      ],
                    ),
                );
                print("---true");
              }
            }, child: Text('Check')
            )
          ],
        ),
      ),
    );
  }
  bool isValidNumber(String number) {
    final numberregex = RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$');
    return number.length==10;
  }
}
