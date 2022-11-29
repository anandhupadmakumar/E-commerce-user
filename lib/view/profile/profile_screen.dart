import 'package:clippy_flutter/arc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_cart/controller/user_controller.dart';
import 'package:shoe_cart/view/profile/update_profile.dart';
import 'package:shoe_cart/view/shipping_address/shipping_address.dart';
import 'package:shoe_cart/view/user_login/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final controller = Get.put(UserController());

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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        controller.loggedInuser?.imageUrl ?? '',
                        scale: 1.2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            ListTile(
              onTap: () {
                Get.to(() => EditProfileScreen());
              },
              leading: const Icon(Icons.person),
              title: const Text('Edit Profile'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {
                Get.to(() => ShippingAddress());
              },
              leading: const Icon(Icons.location_on),
              title: const Text('Address'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.lock),
              title: const Text('Privacy Policy'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAll(() => LoginScreen());
              },
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
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
