import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:totalx/controlller/home_controller.dart';
import 'package:totalx/service/auth_service.dart';
import 'package:totalx/view/home/widgets/floating_action_button.dart';
import 'package:totalx/view/home/widgets/search_filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

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
        leading: const Icon(
          Icons.location_on,
          color: Colors.white,
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
           Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () => AuthService().signOut(),
              child: const Icon(Icons.logout, color: Colors.white)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchFilterWidget(searchController: searchController),
            ),
            const SizedBox(height: 20),
            Text(
              'Users Lists',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.grey[500]),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Consumer<HomeController>(
                builder: (context, homeController, child) {
                  return RefreshIndicator(
                    onRefresh: () {
                      return homeController.refreshUsers();
                    },
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification notification) {
                        if (notification is ScrollEndNotification &&
                            notification.metrics.extentAfter == 0 &&
                            !homeController.isLoading &&
                            homeController.hasMore) {
                          _loadMoreData();
                        }
                        return false;
                      },
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: homeController.filteredUsers.length +
                            (isLoadingMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == homeController.filteredUsers.length) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          final user = homeController.filteredUsers[index];
                          return Card(
                            elevation: 2,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 35,
                                backgroundImage: user.image != null
                                    ? NetworkImage(user.image!)
                                    : const AssetImage('assets/profile_icon.png')
                                        as ImageProvider,
                              ),
                              title: Text(user.name ?? ''),
                              subtitle: Text(user.age ?? ''),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActoionWidget(nameController: nameController, ageController: ageController),
    );
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  Future<void> _loadMoreData() async {
    final homeController = Provider.of<HomeController>(context, listen: false);
    if (!homeController.isLoadingMore && homeController.hasMore) {
      await homeController.loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}


