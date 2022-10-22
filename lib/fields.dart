import 'dart:convert';

import 'package:deep_nucleus/appDrawer.dart';
import 'package:deep_nucleus/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './data.dart';

class Fields extends StatefulWidget {
  // const Fields({Key? key}) : super(key: key);
  static const rounteName = 'fields';

  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  final _formKey = GlobalKey<FormState>();
  var _compTitle = "";
  var _compDesc = "";
  void _trySubmit(
    BuildContext ctx,
  ) async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }
    const url =
        "https://deep-nucleus-10e76-default-rtdb.firebaseio.com/products.json";
    await http.post(Uri.parse(url),
        body: jsonEncode({
          "name": _compTitle,
          "precise text": _compDesc,
          "category": selected_field,
          "sub category": selected_subfield
        }));
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(
          "successfully Inserted",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        duration: Duration(seconds: 5),
      ),
    );
  }

  var selected_field = 'A';
  var selected_subfield = 'A1';
  int selected_length = 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'Fields',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20, right: 5, top: 5, bottom: 5),
                    child: Expanded(
                      child: GestureDetector(
                        onTap: (() {
                          setState(() {
                            selected_field = 'A';
                            selected_length = 8;
                          });
                        }),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 0,
                          color: selected_field == 'A'
                              ? Color.fromARGB(255, 234, 165, 188)
                              : Color.fromARGB(255, 181, 221, 135),
                          child: const SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Text(
                                'A',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Expanded(
                      child: GestureDetector(
                        onTap: (() {
                          setState(() {
                            selected_field = 'B';
                            selected_length = 20;
                          });
                        }),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 0,
                          color: selected_field == 'B'
                              ? Color.fromARGB(255, 234, 165, 188)
                              : Color.fromARGB(255, 181, 221, 135),
                          child: const SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                                child: Text(
                              'B',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Expanded(
                      child: GestureDetector(
                        onTap: (() {
                          setState(() {
                            selected_field = 'C';
                            selected_length = 8;
                          });
                        }),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 0,
                          color: selected_field == 'C'
                              ? Color.fromARGB(255, 234, 165, 188)
                              : Color.fromARGB(255, 181, 221, 135),
                          child: const SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                                child: Text(
                              'C',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              const Divider(
                height: 20,
                thickness: 0.5,
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(255, 96, 95, 95),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Text(
                  "Subfields of $selected_field",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 1,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemBuilder: (ctx, i) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selected_subfield = 'A${i + 1}';
                      print(selected_subfield);
                    });
                  },
                  child: Card(
                    color: selected_subfield == 'A${i + 1}'
                        ? Color.fromARGB(255, 234, 165, 188)
                        : Colors.white,
                    child: Center(
                        child: Text(
                      "$selected_field${i + 1}",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                itemCount: selected_length,
              ),
              SizedBox(
                height: 8,
              ),
              const Divider(
                height: 20,
                thickness: 0.5,
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(255, 96, 95, 95),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                width: double.infinity,
                child: Text(
                  'Name(required)',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  textDirection: TextDirection.ltr,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      child: TextFormField(
                        key: ValueKey('name'),
                        decoration: InputDecoration(
                          hintText: "Enter the Text here",
                          hintMaxLines: 30,
                          filled: true,
                          fillColor: Color.fromARGB(31, 183, 175, 175),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(31, 183, 175, 175)),
                          ),
                        ),

                        textInputAction: TextInputAction.next,
                        // onFieldSubmitted: (_) {
                        //   FocusScope.of(context).requestFocus(_passwordFocusNode);
                        // },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name is requird';
                          }
                          if (value.length > 30) {
                            return 'Name length must between 0-30';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _compTitle = value!;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      width: double.infinity,
                      child: Text(
                        'Precise text(required)',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      child: TextFormField(
                        key: ValueKey('Precise Text'),
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Enter the Text here",
                          suffixText: 'under As',
                          filled: true,
                          fillColor: Color.fromARGB(31, 183, 175, 175),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(31, 183, 175, 175)),
                          ),
                        ),
                        maxLines: 3,
                        // focusNode: _passwordFocusNode,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'description is requird';
                          }
                          if (value.length < 8) {
                            return 'Should be at least 8 characters';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _compDesc = value!;
                        },
                        onFieldSubmitted: (_) {
                          _trySubmit(context);
                        },
                        // obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          RaisedButton(
                            color: Colors.white,
                            elevation: 5,
                            onPressed: () {
                              _trySubmit(context);
                            },
                            textColor: Colors.black,
                            padding: const EdgeInsets.all(0),
                            child: Container(
                              alignment: Alignment.center,
                              height: 35.0,
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                "Save",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          RaisedButton(
                            color: Colors.white,
                            elevation: 5,
                            onPressed: () {
                              _trySubmit(context);
                            },
                            textColor: Colors.black,
                            padding: const EdgeInsets.all(0),
                            child: Container(
                              // margin: EdgeInsets.only(left: 5),
                              alignment: Alignment.center,
                              height: 35.0,

                              padding: const EdgeInsets.all(0),
                              child: Text(
                                "Delete",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
