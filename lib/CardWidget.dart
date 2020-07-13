import 'package:flutter/material.dart';
import 'details.dart';
import 'event.dart';

class CardWidget extends StatelessWidget {
  final Event event;

  CardWidget(this.event);

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
                      builder: (context) => Details(event: event)));
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(event.name,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(16, 10, 10, 5),
                    child: Text(event.description)),
                Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.fromLTRB(16, 5, 10, 10),
                    child: Text(event.time,
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