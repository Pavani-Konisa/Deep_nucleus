import 'package:deep_nucleus/fields.dart';
import 'package:deep_nucleus/image.dart';
import 'package:deep_nucleus/main.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          backgroundColor: Color(0xFF2661FA),
          title: Text(
            'Hello Deep Nucleus',
            style: TextStyle(
                color: Color.fromARGB(255, 249, 246, 246),
                fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Display',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17)),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(MyApp.routename);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.dataset_sharp),
          title: Text('Fields',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17)),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(Fields.rounteName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.dataset_sharp),
          title: Text('Image Upload',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17)),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(ImageUpload.routeName);
          },
        ),
        Divider(),
      ]),
    );
  }
}
