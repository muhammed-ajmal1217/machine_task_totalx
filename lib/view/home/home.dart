import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:totalx/controlller/home_controller.dart';
import 'package:totalx/view/home/widgets/add_dialogue_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Nilambur',
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
        leading: Icon(
          Icons.location_on,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (value) {
                          Provider.of<HomeController>(context, listen: false)
                              .searchUsers(value);
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search_sharp,
                            color: Colors.grey,
                          ),
                          hintText: 'Search by name',
                          hintStyle: GoogleFonts.montserrat(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.menu,color: Colors.white,),
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Users Lists',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.grey[500]),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Consumer<HomeController>(
                builder: (context, homeController, child) {
                  if (homeController.filteredUsers.isEmpty) {
                    return Center(child: Text('No users found.'));
                  }
                  return ListView.builder(
                    itemCount: homeController.filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = homeController.filteredUsers[index];
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 35,
                          backgroundImage: user.image != null
                              ? NetworkImage(user.image!)
                              : AssetImage('assets/profile_icon.png')
                                  as ImageProvider,
                        ),
                        title: Text(user.name ?? ''),
                        subtitle: Text(user.age ?? ''),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.black,
        shape: CircleBorder(),
      ),
    );
  }
}
