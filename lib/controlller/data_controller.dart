// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:totalx/model/data_model.dart';
// import 'package:totalx/service/data_service.dart';

// class DataProvider extends ChangeNotifier {
//   DataService service = DataService();
//   Stream<List<DataModel>> getUsers() {
//     return service.getUsers();
//   }

//   addUsersCollection(
//       {required String name,
//       required String age,
//       required File image}) async {
//     try {
      
//     await service.addUserCollection(name: name, age: age, imageFile: image);
//     notifyListeners();
//     } catch (e) {
      
//     }
//   }
// }
