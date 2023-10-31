import 'package:flutter/material.dart';
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
  var c=['abi','boy','chandru','dileep','egale','apple','balla','chan','dinesh','saro'];
  var b=['A','B','C','D','E','A','B','C','D','S'];
  var a=['9129929229','9129922434','9129935353','9187878777','91299999009','9129111110','91299776767','9129211211','91299897898','9128887777'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LIST VIEW',
      style: TextStyle(color: Colors.white),
      ),
      leading: Icon(Icons.menu,color: Colors.white,),backgroundColor: Colors.red,),
        body: ListView.builder(
          itemCount:a.length,itemBuilder: (BuildContext context,index){
        return ListTile(
          title: Text(c[index].toString(),
          style: TextStyle(color: Colors.black),),
          leading: CircleAvatar(backgroundColor: Colors.red,
          child: Text(b[index].toString()),),
          subtitle: Text(a[index].toString()),
          trailing: Icon(Icons.more_vert,
          color: Colors.red,),
        );
    }
    ),backgroundColor: Colors.white,
    );

  }
}

