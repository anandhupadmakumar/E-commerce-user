import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0), // here the desired height
        child: AppBarWidget(
          title: 'Notification',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Today',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            NotificationCircularAvatarWidget(
              title: '30% Special Discount',
              subTitle: 'Special promotion only valid today',
              icon: Icons.percent,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Yesterday',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            NotificationCircularAvatarWidget(
              title: 'Top Up E-Wallet Successful!',
              subTitle: 'you have to top up your e-wallet',
              icon: Icons.wallet_giftcard_outlined,
            ),
            NotificationCircularAvatarWidget(
              title: 'New Services Available!',
              subTitle: 'Now you can track orders in real time',
              icon: Icons.location_on_outlined,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'December 22 2022',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            NotificationCircularAvatarWidget(
              title: 'Credit card Connected',
              subTitle: 'Credit Card has been linked!',
              icon: Icons.credit_card_outlined,
            ),
            NotificationCircularAvatarWidget(
              title: 'Account Setup Successful!',
              subTitle: 'Your account has been created!',
              icon: Icons.person_outline_rounded,
            )
          ],
        ),
      ),
    );
  }
}

class NotificationCircularAvatarWidget extends StatelessWidget {
  const NotificationCircularAvatarWidget({
    required this.title,
    required this.subTitle,
    required this.icon,
    Key? key,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (() {}),
      contentPadding: const EdgeInsets.all(10),
      minVerticalPadding: 20,
      leading: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 40,
        child: Icon(icon),
      ),
      title: Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      subtitle: Text(subTitle),
    );

    // return Row(
    //   children: [
    //     const Padding(
    //       padding: EdgeInsets.all(20.0),
    //       child: CircleAvatar(
    //         backgroundColor: Colors.black,
    //         radius: 30,
    //         child: Icon(Icons.percent_outlined),
    //       ),
    //     ),
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: const [
    //         Text('30% Special Discount',
    //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    //         Text('Special promotion only valid today'),
    //       ],
    //     )
    //   ],
    // );
  }
}
