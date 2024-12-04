import 'package:flutter/material.dart';
import 'package:test01/components/my_drawer_tile.dart';
import 'package:test01/pages/setting_page.dart';
import 'package:test01/services/auth/auth_service.dart';
import 'package:test01/services/auth/login_or_register.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app_logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Image.asset(
              'lib/images/chicken momo.png',
              height: 80,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //home_list_title
          MyDrawerTile(
            text: "Home",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          //setting_list_title
          MyDrawerTile(
            text: "Setting",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingPage(),
                ),
              );
            },
          ),

          const Spacer(),
          //logout_title
          MyDrawerTile(
              text: "Logout",
              icon: Icons.logout,
              onTap: () {
                logout();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginOrRegister(),
                  ),
                );
              }),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
