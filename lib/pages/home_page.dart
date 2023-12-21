import 'package:angkit_project/controller/bottom_navigation_controller.dart';
import 'package:angkit_project/pages/batch_input_page.dart';
import 'package:angkit_project/pages/dashbord_page.dart';
import 'package:angkit_project/pages/data_page.dart';
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
    return Scaffold(
      body: [
        const DashboardPage(),
        const DataPage(),
      ][currentPageIndex],
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
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        elevation: 35,
        shadowColor: Colors.green,
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        child: NavigationBar(
          indicatorColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          destinations: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: currentPageIndex == 0 ? Colors.green : Colors.black54,
                ),
                label: 'Home',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: NavigationDestination(
                tooltip: 'yes',
                icon: Icon(
                  Icons.data_thresholding_rounded,
                  color: currentPageIndex == 1 ? Colors.green : Colors.black54,
                ),
                label: 'Data',
              ),
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
    );
  }
}
