import 'package:appadsgp1/view/home_page.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text("Menu"),
          ),
          ListTile(
              leading: Icon(Icons.person),
              title: Text("Cursos"),
              onTap: () {
                //navegar para uma nova tela
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                ).then((value) => Navigator.of(context).pop());
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text("Feriados"),
              onTap: () {
                //navegar para uma nova tela
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              onTap: () {
                //navegar pro login com pushReplacement
              },
            ),
      

        ],
      ),
    );
  }
}
