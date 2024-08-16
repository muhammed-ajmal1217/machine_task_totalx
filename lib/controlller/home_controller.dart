import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:totalx/model/data_model.dart';
import 'package:totalx/service/data_service.dart';

class HomeController extends ChangeNotifier {
  final imagePicker = ImagePicker();
  final DataService dataService = DataService();
  File? selectedImage;
  List<DataModel> allUsers = [];
  List<DataModel> filteredUsers = [];

  HomeController() {
    fetchUsers();
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await imagePicker.pickImage(source: source);
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void fetchUsers() {
    try {
      dataService.getUsers().listen((List<DataModel> users) {
        allUsers = users;
        filteredUsers = List.from(allUsers);
        notifyListeners();
      });
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  void searchUsers(String query) {
    if (query.isEmpty) {
      filteredUsers = List.from(allUsers);
    } else {
      filteredUsers = allUsers.where((user) =>
          user.name!.toLowerCase().contains(query.toLowerCase())).toList();
    }
    notifyListeners();
  }

  Future<void> addUsersCollection({
    required String name,
    required String age,
    required File imageFile,
  }) async {
    try {
      await dataService.addUserCollection(name: name, age: age, imageFile: imageFile);
      fetchUsers();
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
  }
}
