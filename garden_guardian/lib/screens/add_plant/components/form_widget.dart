import "package:flutter/material.dart";
import "package:garden_guardian/db/plants_database.dart";
import "package:garden_guardian/models/plant.dart";

const List<String> list = <String>['Cactus', 'Orchid', 'Aloe Vera', 'Pine Tree', 'Lemon Tree', 'Strawberry Bush', 'Flowering Plant'];

class FormWidget extends StatefulWidget {
  const FormWidget({super.key}); // Que?

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String name = "";
  late String type = list.first;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<String>> plantTypeEntries =
        <DropdownMenuEntry<String>>[];
    for (final String type in list) {
      plantTypeEntries.add(DropdownMenuEntry<String>(value: type, label: type));
    }

    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
                initialValue: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Plant Name',
                ),
                validator: (name) =>
                    name != null && name.isEmpty ? 'Enter a plant name' : null,
                onChanged: (String? value) {
                  setState(() {
                    name = value!;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: DropdownMenu<String>(
                initialSelection: type,
                label: const Text("Plant Type"),
                dropdownMenuEntries: plantTypeEntries,
                onSelected: (String? value) {
                  setState(() {
                    type = value!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: addPlant,
                child: const Text("Submit"),
              ),
            ),
          ],
        ));
  }

  void addPlant() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final plant = Plant(
        name: name,
        type: type,
      );

      await PlantsDatabase.instance.create(plant);

      Navigator.of(context).pop();
    }
  }
}
