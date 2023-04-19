import 'package:flutter/material.dart';
import 'dietary_form.dart';

class Food {
  String name;
  double proteins;
  double fibres;
  double oils;
  double ash;
  double moisture;

  Food(this.name, this.proteins, this.fibres, this.oils, this.ash,
      [this.moisture = 0]);
}

class Foods extends StatefulWidget {
  const Foods({super.key});

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  final List<Food> _allFoods = [
    Food('Bob\'s Biscs', 0.21, 0.03, 0.1265, 0.08),
    Food('Chompers Choice', 0.23, 0.022, 0.14, 0.07),
    Food('Furry Feast', 0.19, 0.05, 0.135, 0.09),
    Food('Purrfectly Posh', 0.18, 0.06, 0.13, 0.1),
    Food('Bowwow\'s Best', 0.22, 0.025, 0.1375, 0.075),
    Food('Meow Mix Deluxe', 0.19, 0.045, 0.1325, 0.085),
    Food('Tail Waggin\' Treats', 0.205, 0.035, 0.13375, 0.0825),
    Food('Kibble Kingdom', 0.195, 0.055, 0.13625, 0.0925),
    Food('Woofalicious', 0.215, 0.0275, 0.13875, 0.0725),
  ];

  List<Food> _foundFoods = [];

  @override
  initState() {
    _foundFoods = _allFoods;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    setState(() {
      _foundFoods = enteredKeyword.isEmpty
          ? _allFoods
          : _allFoods
              .where((food) => food.name
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: const InputDecoration(
                        labelText: 'Search', suffixIcon: Icon(Icons.search)),
                  )),
              Expanded(
                child: _foundFoods.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: _foundFoods.length,
                        itemBuilder: (context, index) => Card(
                          key: ValueKey(index),
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            title: Text(_foundFoods[index].name),
                            subtitle: Text(
                              'Protein: ${_foundFoods[index].proteins * 100}%, Crude Fibres: ${_foundFoods[index].fibres * 100}%, Crude Oils and Fats: ${_foundFoods[index].oils * 100}%, Crude Ash: ${_foundFoods[index].ash * 100}%',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )
                    : const Center(
                        child: Text(
                        'No results found',
                      )),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DietaryForm()),
              );
            },
            child: const Icon(Icons.add)));
  }
}
