import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 195,),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
               history,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xB3FFFFFF)),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white),
                ),
              ),
            ),
            Row(
              children: [
                dynoOutlinedButton('7'),
                dynoOutlinedButton('8'),
                dynoOutlinedButton('9'),
                dynoOutlinedButton('+'),
              ],
            ),
            Row(
              children: [
                dynoOutlinedButton('4'),
                dynoOutlinedButton('5'),
                dynoOutlinedButton('6'),
                dynoOutlinedButton('-'),
              ],
            ),
            Row(
              children: [
                dynoOutlinedButton('1'),
                dynoOutlinedButton('2'),
                dynoOutlinedButton('3'),
                dynoOutlinedButton('x'),
              ],
            ),
            Row(
              children: [
                dynoOutlinedButton('.'),
                dynoOutlinedButton('0'),
                dynoOutlinedButton('%'),
                dynoOutlinedButton('/'),
              ],
            ),
            Row(
              children: [
                dynoOutlinedButton('AC'),
                dynoOutlinedButton('⌫'),
                dynoOutlinedButton('+/-'),
                dynoOutlinedButton('='),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Padding dynoOutlinedButton(String val) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () => buttonclick(val),
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          width: 82.0,
          height: 55.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Center(
            child: Text(
              val,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  var number1, number2;
  var result;
  var _operator;
  String history = "";
  String text = "";
  void buttonclick(String buttontext) {
    if(buttontext=="AC"){
     result="";
     text="";
     number1=0;
     number2=0;
     history='';
    }else if(buttontext=="+"||buttontext=="-"||
        buttontext=="x"||buttontext=="/")
    {
      number1=int.parse(text);
      result="";
      _operator=buttontext;
    }
    else if(buttontext=="="){
      number2=int.parse(text);
      if(_operator=="+"){
        result=(number1+number2).toString();
        history=number1.toString()+_operator.toString()+number2.toString();
      }
      if(_operator=="-"){
        result=(number1-number2).toString();
        history=number1.toString()+_operator.toString()+number2.toString();
      }
      if(_operator=="x"){
        result=(number1*number2).toString();
        history=number1.toString()+_operator.toString()+number2.toString();
      }
      if (_operator == "/") {
        if (number2 != 0) {
          result = (number1 / number2).toString();
          history=number1.toString()+_operator.toString()+number2.toString();
        } else {
          result = 'Error';
        }
      }
    }
    
    
    else if (buttontext == "%" && text.isNotEmpty) {
      double percentage = double.parse(text);
      if (percentage != null) {
        result = (percentage / 100.0).toString();
        history = percentage.toString() + '  Percentage'.toString();
      }
    }
    

    else if(buttontext=="+/-"){
      if(text[0]!="-"){
        result="-"+text;
      }else{
        result=text.substring(1);
      }
    }
    
    
    else if (buttontext == ".") {
      if(text.isEmpty){
        result='0.';
      }
      else {
        result=text+'.';
      }
    }

    else if(buttontext=="⌫"){
      result=text.substring(0,text.length-1);
    }

    
    else {
      result = double.parse(text + buttontext).toStringAsFixed(0);
    }
    
   setState(() {
     text=result;
   });
  }
}
