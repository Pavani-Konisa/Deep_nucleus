import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:deep_nucleus/appDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key}) : super(key: key);
  static const routeName = 'image';

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  // File? imageFile;
  // final picker = ImagePicker();
  // Future pickImage() async {
  //   final PickedFile = await picker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     imageFile = PickedFile as File?;
  //     print(imageFile);
  //   });
  // }
  Future<void> uploadFile(String filepath, String fileName) async {
    File file = File(filepath);
    try {
      await storage.ref('foldername/$fileName').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Image Upload',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          )),
      body: Center(
        child: Column(children: [
          // Container(
          //   child: FlatButton(
          //     child: Icon(Icons.camera_alt_outlined),
          //   ),
          // ),
          Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: FlatButton(
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['png', 'jpg']);
                  if (result == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('no file choosemn')));
                    return null;
                  }
                  final path = result.files.single.path;
                  final filename = result.files.single.name;
                  // print(path);
                  // print(filename);
                  uploadFile(path.toString(), filename).then((value) =>
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('SUCCESSFULLY IMAGE UPLOADED'))));
                },
                child: Text(
                  'Image Upload',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
        ]),
      ),
    );
  }
}
