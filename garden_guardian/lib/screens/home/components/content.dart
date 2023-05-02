import 'package:flutter/material.dart';
import 'package:garden_guardian/db/plants_database.dart';

import '../../../models/plant.dart';
import '../../add_plant/add_plant_screen.dart';

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  //List<Map<String, dynamic>> myData = [];
  late List<Plant> plants;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    refreshPlants();
  }

  @override
  void dispose() {
    PlantsDatabase.instance.close();

    super.dispose();
  }

  Future<void> refreshPlants() async {
    setState(() => isLoading = true);

    this.plants = await PlantsDatabase.instance.readAllPlants();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : plants.isEmpty
                ? Text(
                    'No Plants',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )
                : buildPlants(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPlant()));
          refreshPlants();
        },
      ),
    );
  }

  Widget buildPlants() => ListView.builder(
        itemCount: plants.length,
        itemBuilder: (context, index) {
          final plant = plants[index];

          return SizedBox(
            height: 80,
            child: Card(
              elevation: 1,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                title: Text(
                  plant.name,
                  style: TextStyle(fontSize: 16, color: Color(0xFF191C19)),
                ),
                subtitle: Text(
                  plant.type,
                  style: TextStyle(fontSize: 14, color: Color(0xFF191C19)),
                ),
              ),
            ),
          );
        },
      );
}
