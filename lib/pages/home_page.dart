import 'package:angkit_project/controller/bottom_navigation_controller.dart';
import 'package:angkit_project/pages/batch_input_page.dart';
import 'package:angkit_project/pages/login_page.dart';
import 'package:angkit_project/pages/register/register_page1.dart';
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
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;

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
          icon: const Icon(Icons.exit_to_app, color: Colors.red, size: 32),
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: const Text("Logout sekarang?"),
                  content: const Text("YAKINNNNNNNN?????????"),
                  actions: [
                    FilledButton.tonal(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/dataPage');
                        // Navigator.of(context).pop();
                      },
                      child: const Text("Tidak"),
                    ),
                    FilledButton(
                      onPressed: () {
                        prefs.remove("username");
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/loginPage', (route) => false);
                      },
                      child: const Text("Ya"),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
      body: [LoginPage(), RegisterPage1()][currentPageIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          Navigator.pushNamed(context, '/batchInputPage');
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          weight: 100,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          elevation: 5,
          shadowColor: Colors.transparent,
          // color: Colors.red,
          child: NavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.data_thresholding_rounded),
                label: 'Data',
              ),
            ],
            labelBehavior: labelBehavior,
            selectedIndex: currentPageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
