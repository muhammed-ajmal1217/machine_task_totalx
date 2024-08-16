import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx/controlller/home_controller.dart';
import 'package:totalx/view/home/widgets/add_dialogue_box.dart';

class FloatingActoionWidget extends StatelessWidget {
  const FloatingActoionWidget({
    super.key,
    required this.nameController,
    required this.ageController,
  });

  final TextEditingController nameController;
  final TextEditingController ageController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Consumer<HomeController>(
              builder: (context, homePro, child) => AddDialogueBox(
                nameController: nameController,
                ageController: ageController,
                homePro: homePro,
              ),
            );
          },
        );
      },
      backgroundColor: Colors.black,
      shape: const CircleBorder(),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}