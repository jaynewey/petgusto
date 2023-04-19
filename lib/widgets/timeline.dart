import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'event.dart';

class Timeline extends StatelessWidget {
  final List<Event> events;

  const Timeline({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String prevDate = '';
    return ListView.builder(
        padding: const EdgeInsets.all(18),
        shrinkWrap: true,
        primary: false,
        itemCount: events.length,
        itemBuilder: (BuildContext context, int i) {
          var card = buildEvent(context, events[i]);
          var formatted = DateFormat('MMMMEEEEd').format(events[i].dateTime);
          var sameDate = prevDate == formatted;
          prevDate = formatted;
          return sameDate
              ? Container(child: card)
              : Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(formatted)),
                  card
                ]);
        });
  }
}
