import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/activity.dart';

enum EventType { activity, weight, refill, dispense, consume }

class Event {
  EventType type;
  String description;
  DateTime dateTime;

  Event(this.type, this.description, this.dateTime);
}

IconData _getIcon(EventType type) {
  switch (type) {
    case EventType.activity:
      return Icons.pets_outlined;
    case EventType.weight:
      return Icons.monitor_weight_outlined;
    case EventType.refill:
      return Icons.switch_access_shortcut_add_outlined;
    case EventType.dispense:
      return Icons.system_update_alt_outlined;
    case EventType.consume:
      return Icons.restaurant_outlined;
  }
}

Widget buildEvent(BuildContext context, Event event) {
  var formatter = DateFormat('jm');
  return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
          onTap: event.type == EventType.activity
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Activity()),
                  );
                }
              : null,
          child: ListTile(
            leading: SizedBox(
                height: double.infinity,
                child:
                    Icon(_getIcon(event.type), size: 24, color: Colors.orange)),
            title: Text(event.description),
            subtitle: Text(formatter.format(event.dateTime)),
            trailing: event.type == EventType.activity
                ? const SizedBox(
                    height: double.infinity,
                    child:
                        Icon(Icons.open_in_new, size: 24, color: Colors.orange))
                : null,
          )));
}

const petName = 'Minnie';
List<Event> events = [
  Event(EventType.dispense, 'Dispensed 100g Bob\'s Biscs.',
      DateTime(2023, 4, 11, 10)),
  Event(EventType.weight, 'Recorded weight of $petName: 8.7kg',
      DateTime(2023, 4, 11, 9, 18)),
  Event(EventType.consume, '$petName consumed 60g Bob\'s Biscs',
      DateTime(2023, 4, 11, 9, 15)),
  Event(EventType.activity, '$petName walked 2.7km.',
      DateTime(2023, 4, 11, 8, 4)),
  Event(EventType.refill, 'Refilled container with Bob\'s Biscs (1kg).',
      DateTime(2023, 4, 10, 13, 22)),
  Event(EventType.dispense, 'Dispensed 80g Bob\'s Biscs.',
      DateTime(2023, 4, 10, 10)),
  Event(EventType.consume, '$petName consumed 80g Bob\'s Biscs.',
      DateTime(2023, 4, 10, 9, 42))
];
