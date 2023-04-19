import 'package:flutter/material.dart';

Widget _buildFormInput({String labelText = '', String hintText = ''}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    child: TextFormField(
      decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: labelText,
          hintText: hintText),
    ),
  );
}

class DietaryForm extends StatefulWidget {
  const DietaryForm({super.key});

  @override
  DietaryFormState createState() {
    return DietaryFormState();
  }
}

class DietaryFormState extends State<DietaryForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Ink(
                            decoration: ShapeDecoration(
                              color: Colors.grey[100]!,
                              shape: const CircleBorder(),
                            ),
                            child: (IconButton(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 48, vertical: 48),
                              icon: const Icon(Icons.add_a_photo),
                              onPressed: () {},
                            ))),
                        _buildFormInput(labelText: 'Name'),
                        const Divider(),
                        _buildFormInput(labelText: 'Proteins (%)'),
                        _buildFormInput(labelText: 'Crude Fibres (%)'),
                        _buildFormInput(labelText: 'Crude Oils and Fats (%)'),
                        _buildFormInput(labelText: 'Crude Ash (%)'),
                        _buildFormInput(labelText: 'Moisture (%)'),
                      ],
                    )))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Saving...')),
              );
              Navigator.pop(context);
            }
          },
          child: const Icon(Icons.done),
        ));
  }
}
