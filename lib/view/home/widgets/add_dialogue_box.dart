import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:totalx/controlller/home_controller.dart';
import 'package:totalx/view/home/widgets/custom_text_field.dart';

class AddDialogueBox extends StatelessWidget {
  const AddDialogueBox({
    super.key,
    required this.nameController,
    required this.ageController,
    required this.homePro,
  });

  final TextEditingController nameController;
  final TextEditingController ageController;
  final HomeController homePro;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Add User's",
        style: GoogleFonts.montserrat(),
      ),
      actions: [
        Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: homePro.selectedImage != null
                    ? FileImage(File(homePro.selectedImage?.path ?? ''))
                    : AssetImage('assets/profile_icon.png') as ImageProvider,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Select Image'),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  homePro.pickImage(ImageSource.camera);
                                },
                                child: Icon(Icons.camera_alt_outlined),
                              ),
                              InkWell(
                                onTap: () {
                                  homePro.pickImage(ImageSource.gallery);
                                },
                                child: Icon(Icons.image_outlined),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  height: 35,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(200),
                          bottomRight: Radius.circular(200))),
                  child: Center(
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        CustomTextField(nameController: nameController, hintText: 'Name'),
        SizedBox(height: 10),
        CustomTextField(nameController: ageController, hintText: 'Age'),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.montserrat(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {
                homePro.addUsersCollection(
                  name: nameController.text,
                  age: ageController.text,
                  imageFile: homePro.selectedImage!,
                );
                Navigator.pop(context);
              },
              child: Text(
                'Save',
                style: GoogleFonts.montserrat(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}