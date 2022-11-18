import 'package:clippy_flutter/arc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/view/signup/sign_up_form.dart';
import 'package:shoe_cart/view/user_login/login_screen.dart';
import 'package:shoe_cart/view/widgets/appbar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Arc(
              height: 30,
              child: Container(
                width: double.infinity,
                height: 150,
                color: const Color.fromARGB(255, 196, 195, 193),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        'asset/images/2e4a46f066948168ad652c5562e03f5c.jpeg'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const ProfileListTileWidget(
                icon: Icons.person,
                title: 'Edit Profile',
                trailingIcon: Icons.arrow_forward_ios),
            const ProfileListTileWidget(
                icon: Icons.location_on,
                title: 'Address',
                trailingIcon: Icons.arrow_forward_ios),
            const ProfileListTileWidget(
                icon: Icons.notifications,
                title: 'Notification',
                trailingIcon: Icons.arrow_forward_ios),
            const ProfileListTileWidget(
                icon: Icons.wallet,
                title: 'Payment ',
                trailingIcon: Icons.arrow_forward_ios),
            const ProfileListTileWidget(
                icon: Icons.lock,
                title: 'Privacy Policy',
                trailingIcon: Icons.arrow_forward_ios),
            const ProfileListTileWidget(
                icon: Icons.logout,
                title: 'Logout',
                trailingIcon: Icons.arrow_forward_ios),
          ],
        ));
  }
}

class ProfileListTileWidget extends StatelessWidget {
  const ProfileListTileWidget({
    required this.icon,
    required this.title,
    required this.trailingIcon,
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final IconData trailingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        await FirebaseAuth.instance.signOut();
        Get.offAll(() => LoginScreen());
      },
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(trailingIcon),
    );
  }
}
