import 'package:appadsgp1/view/holiday_page.dart';
import 'package:appadsgp1/view/home_page.dart';
import 'package:appadsgp1/view/login_page.dart';
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text("Feriados"),
              onTap: () {
                //navegar para uma nova tela
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HolidayPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
