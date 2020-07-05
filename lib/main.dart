import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

import 'details.dart';
import 'event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color.fromARGB(345, 533, 545, 455),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
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

class CardWidget extends StatefulWidget {
  final Event event;

  CardWidget(this.event);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 4, 20, 4),
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(event: widget.event)));
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(widget.event.name,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(16, 10, 10, 5),
                    child: Text(widget.event.description)),
                Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.fromLTRB(16, 5, 10, 10),
                    child: Text(widget.event.time,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 10))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//class MyFloatingButton {
//  static Widget getFloatingButton(Function function) {
//    return FloatingActionButton(
//      onPressed: () {
//        function();
//      },
//      child: Icon(
//        Icons.control_point,
//        color: Colors.greenAccent,
//      ),
//      backgroundColor: Colors.pink,
//    );
//  }
//}

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


