import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'CardWidget.dart';
import 'event.dart';


class UserScreen extends StatefulWidget {
  UserScreen({Key key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List widgets = <List<Event>>[];

  getEvents() async {
    var url = 'http://uncroptv.000webhostapp.com/Read.php';
    var response = await post(url, body: {'id': '92'});
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    widgets = parsed.map<Event>((json) => Event.fromJson(json)).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: MyFloatingButton(),
        appBar: AppBar(
          title: Text("Todo Helper"),
        ),
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(184, 210, 253, 1),
                          Color.fromRGBO(207, 237, 250, 1)
                        ])),
                child: ListView.builder(
                    itemCount: widgets.length,
                    itemBuilder: (BuildContext context, int position) {
                      return CardWidget(widgets[position]);
                    }))));
  }


}

class MyFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Fluttertoast.showToast(
            msg: "This is Center Short Toast",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      },
      child: Icon(
        Icons.control_point,
        color: Colors.greenAccent,
      ),
      backgroundColor: Colors.pink,
    );
  }
}