import 'package:flutter/material.dart';
import '../widgets/event.dart';
import '../widgets/timeline.dart' as widget;

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16),
        child: Column(children: [
          const Text('Today',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStat(Icons.restaurant_outlined, '243 eaten'),
                    _buildStat(
                        Icons.local_fire_department_outlined, '204 burned'),
                    _buildStat(Icons.flag_outlined, '199 to go')
                  ])),
          const Divider(height: 32),
          const Text('Events',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          widget.Timeline(events: events)
        ]));
  }
}

Widget _buildStat(IconData icon, String stat) {
  return Column(children: [
    Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.orange[100],
        ),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Icon(icon, color: Colors.orange)),
          Text(stat,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.orange))
        ]))
  ]);
}
