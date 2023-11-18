// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hello_world/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomaPageState();
  }
}

class HomaPageState extends State<HomePage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(children: [
         UserAccountsDrawerHeader(
            currentAccountPicture: const Card(color: Colors.grey),
            accountName: const Text('Diogo Lindoso'),
            accountEmail: const Text('diogolindoso@gmail.com'),
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: const Text('Início'),
            subtitle: const Text('Tela de início'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          ListTile(
            title: const Text('Sair'),
            subtitle: const Text('Sair da aplicação'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ]),
      ),
      appBar: AppBar(
        title: const Text('Hello World'),
        actions: [CustomSwitcher()],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(children: [
          Text(
            'Contador $counter',
            style: const TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomSwitcher extends StatelessWidget {
  const CustomSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return const Icon(Icons.check);
          }
          return const Icon(Icons.close);
        },
      ),
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
