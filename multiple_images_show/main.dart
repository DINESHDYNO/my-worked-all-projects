import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ram(),
    );
  }
}

class ram extends StatefulWidget {
  const ram({Key? key}) : super(key: key);

  @override
  State<ram> createState() => _ramState();
}

class _ramState extends State<ram> {


  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imagefileList = [];



  Future selectImage() async {
    final List<XFile>? selectedimage = await imagePicker.pickMultiImage();
    if (selectedimage!.isNotEmpty) {
      imagefileList!.addAll(selectedimage);
    }
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Container(alignment: Alignment.center, child: Text('Image Picker')),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: imagefileList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.file(
                      File(imagefileList[index].path),
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red
              ),
              onPressed: () {
                selectImage();
              },
              child: Text(
                'Multiple images show',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
