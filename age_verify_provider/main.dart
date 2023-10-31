import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ageverify.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Eighteen_yers_above(),
      child: const one(),
    ),
  );
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
 final TextEditingController car = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Consumer<Eighteen_yers_above>(
          builder: (context, provider, child) {
            return Column(
              children: [
                TextFormField(
                  controller: car,
                  decoration: InputDecoration(
                    labelText: 'Enter age',
                    labelStyle: TextStyle(color: Colors.grey)
                  ),
                ),
                ElevatedButton(onPressed: (){
                  final int age=int.parse(car.text);
                  provider.eligiblechek(age);
                }, child:Text(''
                    'click'
                    ) ),
                Text(provider.eighteen_yers_above_msg,style: TextStyle(fontSize: 20),)
              ],
            );
          },
        ),
      ),
    );
  }
}
