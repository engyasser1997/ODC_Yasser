import 'dart:convert';

import 'package:courses_orange/view/bottomtapbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


var emailcontroller = TextEditingController();
var passwordcontroller = TextEditingController();
//-------------------------------------------------------------

Future<void> fetchEnrrol(String email, String password, BuildContext context) async {
  var url = Uri.parse("https://5742-196-205-94-85.eu.ngrok.io/api/v1/courses");
  var response = await http.post(url, body: {
    'email': emailcontroller.text,
    'password': passwordcontroller.text,
  },
  );
  var responsbody = jsonDecode(response.body);
  if (responsbody["success"] == true) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
        BottomTapBar())
    );
    final snacBar=SnackBar(
      content: Text("successfully"),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snacBar);
  }  else{
    print(responsbody["message"]);
    final snacBar=SnackBar(
      content: Text(responsbody["message"]),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snacBar);
  }
}

// -------------------------End -----------------------------

