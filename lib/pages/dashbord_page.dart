import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:  [
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
                          // prefs.remove("username");
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
      ),
      body: Container(),
    );
  }
}
