import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DisplayItem extends StatelessWidget {
  // const DisplayItem({Key? key}) : super(key: key);
  final String image;
  final String title;
  final String price;
  final String label;
  final Object bgcolor;
  DisplayItem(this.title, this.image, this.price, this.label, this.bgcolor);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          // child: Image.network(
          //   image,
          //   fit: BoxFit.cover,
          // ),
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            //margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.black,
                //   width: 1.0,
                // ),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Cell $label",
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: (label == 'A'
                          ? Colors.orange
                          : label == 'B'
                              ? Colors.green
                              : Colors.blue)),
                ),
              ),
            ),
          ),
          footer: Container(
            // margin: EdgeInsets.only(left: 1, right: 1),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 219, 217, 217),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Column(children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(4),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(4),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price),
                      Text('3KM'),
                    ]),
              )
            ]),
          )
          //   GridTileBar(
          //     title: Text(
          //       title,
          //       textAlign: TextAlign.left,
          //     ),
          //     backgroundColor: Color.fromARGB(51, 61, 60, 60),
          //   ),
          ),
    );
  }
}
