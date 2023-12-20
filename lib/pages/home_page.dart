import 'package:angkit_project/controller/bottom_navigation_controller.dart';
import 'package:angkit_project/pages/batch_input_page.dart';
import 'package:angkit_project/widgets/bottom_navigation.dart';
import 'package:angkit_project/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BottomNavigationController bottomNavigationController =
      BottomNavigationController();
  late SharedPreferences prefs;
  late String username;

  void getPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("username")!;
    });
  }

  @override
  void initState() {
    getPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      topMarginBody: 200,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Selamat datang, $username",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "Peternak",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.red, size: 32),
          onPressed: () {
            showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: Text("Logout sekarang?"),
                    content: Text("YAKINNNNNNNN?????????"),
                    actions: [
                      FilledButton.tonal(onPressed: () {
                        Navigator.of(context).pushNamed('/dataPage');
                        // Navigator.of(context).pop();
                      }, child: Text("Tidak"),),
                      FilledButton(
                        onPressed: () {
                          prefs.remove("username");
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/loginPage', (route) => false);
                        },
                        child: Text("Ya"),
                      ),
                    ],
                  );
                });
          },
        ),
      ],
      body: const Column(
        children: [Text("item1")],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          Navigator.pushNamed(context, '/batchInputPage');
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          weight: 25,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomAppBar(
          surfaceTintColor: Theme.of(context).colorScheme.secondary,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          elevation: 5,
          child: BottomNavigation(
            menuIcons: [
              MenuIcon(
                icon: Icons.home,
                title: "Home",
                activeIconColor: Theme.of(context).primaryColor,
              ),
              const MenuIcon(
                icon: Icons.dataset,
                title: "Data",
              ),
            ],
            controller: bottomNavigationController,
          ),
        ),
      ),
    );
  }
}
