import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:petgusto/widgets/timeline.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/event.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const ListTile(
            leading: Icon(Icons.wb_twilight_outlined, size: 32),
            title: Text(
              'Minnie\'s Morning Walk',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('April 10 2023 at 8:04 AM'),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
              height: 400,
              child: FlutterMap(
                  options: MapOptions(
                      zoom: 15,
                      center: LatLng(54.18018968750336, -4.550544861118485)),
                  nonRotatedChildren: [
                    AttributionWidget.defaultWidget(
                      source: 'OpenStreetMap contributors',
                      onSourceTapped: null,
                    ),
                  ],
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    PolylineLayer(
                      polylineCulling: false,
                      polylines: [
                        Polyline(
                          strokeWidth: 3,
                          color: Colors.orange,
                          points: [
                            LatLng(54.1785495, -4.5564294),
                            LatLng(54.1791428, -4.5555282),
                            LatLng(54.1797205, -4.5536774),
                            LatLng(54.1802888, -4.5521003),
                            LatLng(54.181196, -4.5506895),
                            LatLng(54.1819495, -4.549697),
                            LatLng(54.1816513, -4.5494342),
                            LatLng(54.1811113, -4.5487851),
                            LatLng(54.179934, -4.5466071),
                            LatLng(54.1798273, -4.5455182),
                            LatLng(54.1799152, -4.5447242),
                            LatLng(54.1797393, -4.5443809),
                            LatLng(54.1795981, -4.5443594),
                            LatLng(54.178989, -4.5451319),
                            LatLng(54.1785495, -4.5459473),
                            LatLng(54.1786123, -4.5463121),
                            LatLng(54.1796232, -4.5478356),
                            LatLng(54.1801192, -4.5490158),
                            LatLng(54.1801067, -4.5494342),
                            LatLng(54.1779153, -4.5496488),
                            LatLng(54.1775385, -4.5489943),
                            LatLng(54.1769859, -4.5481253),
                            LatLng(54.1763077, -4.5479321),
                            LatLng(54.1740847, -4.5494986),
                            LatLng(54.1759498, -4.5527601),
                            LatLng(54.1785746, -4.5564294),
                          ],
                        ),
                      ],
                    ),
                  ])),
          Table(
              border: TableBorder(
                horizontalInside: BorderSide(
                    width: 1,
                    color: Colors.grey[200]!,
                    style: BorderStyle.solid),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  _buildStat(Icons.landscape_outlined, '2.25', 'km'),
                  _buildStat(Icons.timer_outlined, '1h02', 'm'),
                ]),
                TableRow(children: [
                  _buildStat(Icons.trending_up_outlined, '36', 'm'),
                  _buildStat(Icons.pets_outlined, '8142', 'steps'),
                ]),
                TableRow(children: [
                  _buildStat(
                      Icons.local_fire_department_outlined, '204', 'calories'),
                  _buildStat(Icons.monitor_heart_outlined, '142', 'bpm'),
                ]),
              ]),
          const Divider(
            height: 50,
          ),
          const Text('Related events',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Timeline(
              events: events.where((event) {
            return event.dateTime.isAfter(DateTime(2023, 4, 11, 8, 4));
          }).toList())
        ])));
  }
}

Widget _buildStat(IconData icon, String stat, String units) {
  return TableCell(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Icon(icon, color: Colors.orange)),
            RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                          text: stat,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' $units')
                    ]),
                textAlign: TextAlign.center),
          ])));
}
