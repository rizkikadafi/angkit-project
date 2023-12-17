import 'package:angkit_project/controller/bottom_navigation_controller.dart';
import 'package:angkit_project/pages/batch_input_page.dart';
import 'package:angkit_project/widgets/bottom_navigation.dart';
import 'package:angkit_project/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BottomNavigationController bottomNavigationController =
      BottomNavigationController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Selamat datang, guest",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "Peternak",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
      actions: [SvgPicture.asset('assets/img/profile.svg')],
      body: const Column(
        children: [Text("item1")],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const BatchInputPage()));
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
          child: BottomNavigation(menuIcons: [
            MenuIcon(
              icon: Icons.home,
              title: "Home",
              activeIconColor: Theme.of(context).primaryColor,
            ),
            const MenuIcon(
              icon: Icons.dataset,
              title: "Data",
            ),
          ], controller: bottomNavigationController),
        ),
      ),
    );
  }
}
