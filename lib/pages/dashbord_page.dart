import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late SharedPreferences prefs;

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Logout sekarang?"),
          content: const Text("Anda akan keluar dari sesi akun anda."),
          actions: [
            FilledButton.tonal(
              onPressed: () {
                // Navigator.of(context).pushNamed('/dataPage');
                Navigator.of(context).pop();
              },
              child: const Text("Tidak"),
            ),
            FilledButton(
              onPressed: () {
                prefs.remove("username");
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/loginPage',
                  (route) => false,
                );
              },
              child: const Text("Ya"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: SharedPreferences.getInstance(), builder: (ctx, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasData) {
          String username = snapshot.data!.getString('username')!;
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                  icon: const Icon(Icons.exit_to_app, color: Colors.red, size: 32),
                  onPressed: () => logout(context),
                ),
              ],
            ),
            body: Column(
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  height: 150,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 10, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Halo $username!',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          'Peternak',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,

                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40))),
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          );
        }
        else {
          return Container();
        }
      } else {
        return Container();
      }
    });
  }
}
