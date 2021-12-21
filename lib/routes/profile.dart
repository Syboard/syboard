import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syboard/services/auth.dart';
import 'package:syboard/utils/styles.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/models/account_list_item.dart';
import 'package:syboard/ui/account_list_item_tile.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService authService = AuthService();

  Future<void> start() async {

  }

  @override
  void initState() {
    super.initState();
    start();
    // obtain shared preferences
  }

  static final _itemList = <AccountListItem>[
    AccountListItem(
        icon: Icon(Icons.local_shipping_outlined,
            size: 30, color: Colors.black.withOpacity(0.7)),
        name: 'My Orders',
        route: '/'),
    AccountListItem(
        icon: Icon(Icons.favorite_border,
            size: 30, color: Colors.black.withOpacity(0.7)),
        name: 'My Favorites',
        route: '/'),
    AccountListItem(
        icon: Icon(Icons.reviews_outlined,
            size: 30, color: Colors.black.withOpacity(0.7)),
        name: 'My Reviews',
        route: '/'),
    AccountListItem(
        icon: Icon(Icons.notifications_outlined,
            size: 30, color: Colors.black.withOpacity(0.7)),
        name: 'Notifications',
        route: '/'),
    AccountListItem(
        icon: Icon(Icons.edit_outlined,
            size: 30, color: Colors.black.withOpacity(0.7)),
        name: 'Edit My Account',
        route: '/edit_account')
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.primary.withOpacity(0.1),
              height: 210,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'My Account',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const CircleAvatar(
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.grey,
                            size: 60,
                          ),
                          backgroundColor: Colors.white,
                          radius: 40,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Doğkan Saraç', style: kAppBarTitleTextStyle)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: List.generate(
                    _itemList.length,
                    (index) => Row(children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1),
                            child: AccountListItemTile(_itemList[index], context),
                          ))
                        ])),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10),
                          primary: Colors.grey,
                        ),
                        onPressed: () {
                          authService.signOut();
                          Navigator.popAndPushNamed(  context, '/login');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.logout, size: 24),
                            SizedBox(width: 8,),
                            Text("Log Out",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 17.0,
                                ))
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
