import 'package:flutter/material.dart';
import 'browser_page.dart';
import 'config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final username = routeArgs['user'];
    return Scaffold(
        backgroundColor: const Color(0xFF3700B3),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 67, 29, 126)),
                  currentAccountPicture: const CircleAvatar(
                    child: Text("S.A"),
                  ),
                  accountName: const Text("Santosh Adhikari"),
                  accountEmail: Text(username.toString()))
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3700B3),
          title: const Text("Home Screen"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/");
                },
                icon: const Icon(Icons.logout)),
          ],
        ),
        body: GridView.builder(
            itemCount: Config.allsites.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BrowserPage(
                              Config.allsites.keys
                                      .toList()[index][0]
                                      .toUpperCase() +
                                  Config.allsites.keys
                                      .toList()[index]
                                      .substring(1),
                              Config.allsites.values.toList()[index])),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.indigo,
                      border: Border.all(
                          color: const Color.fromARGB(255, 13, 17, 44)),
                    ),
                    height: 200,
                    child: Center(
                        child: Text(
                      Config.allsites.keys.toList()[index][0].toUpperCase() +
                          Config.allsites.keys.toList()[index].substring(1),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 220, 216, 228),
                          fontSize: 25),
                    )),
                  ),
                ),
              );
            }));
  }
}
