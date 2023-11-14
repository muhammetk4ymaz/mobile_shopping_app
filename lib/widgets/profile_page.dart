import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/models/my_user.dart';
import 'package:flutter_mobile_shopping_app/providers/user_model.dart';
import 'package:flutter_mobile_shopping_app/screens/sign_in/sign_in_screen.dart';

import 'package:flutter_mobile_shopping_app/widgets/my_account_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3;

  Future<void> _signOut() async {
    final userModel = Provider.of<UserModel>(context, listen: false);

    try {
      await userModel.signOut().whenComplete(() => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          )));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context, listen: true);

    MyUser myUser = userModel.myUser!;
    String nameAndSurname = '${myUser.firstName} ${myUser.lastName}';
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          image: DecorationImage(
                              image: NetworkImage(myUser.image))),
                    ),
                  ),
                  /*  Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.all(Radius.circular(50))),
                        child: const Icon(
                          Icons.person,
                          size: 75,
                        ),
                      ),
                    ), */
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 5),
                    child: Text(
                      nameAndSurname.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black)),
                    child: const Text(
                      'EDIT PROFILE',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            NavigationBar(
                onDestinationSelected: (value) {
                  setState(() {
                    _selectedIndex = value;
                  });
                },
                elevation: 2,
                indicatorColor: Colors.white,
                height: 75,
                backgroundColor: Colors.white,
                selectedIndex: _selectedIndex,
                destinations: const [
                  NavigationDestination(
                      selectedIcon: Icon(
                        Icons.auto_awesome_mosaic,
                        size: 30,
                      ),
                      icon: Icon(
                        Icons.auto_awesome_mosaic_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
                      label: 'Orders'),
                  NavigationDestination(
                      selectedIcon: Icon(
                        Icons.badge,
                        size: 30,
                      ),
                      icon: Icon(
                        Icons.badge_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
                      label: 'Pass'),
                  NavigationDestination(
                      selectedIcon: Icon(
                        Icons.event,
                        size: 30,
                      ),
                      icon: Icon(
                        Icons.event_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
                      label: 'Events'),
                  NavigationDestination(
                      selectedIcon: Icon(
                        Icons.settings,
                        size: 30,
                      ),
                      icon: Icon(
                        Icons.settings_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
                      label: 'Settings'),
                ]),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyAccountPage(),
                    ));
              },
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              leading: const Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
                size: 30,
              ),
              title: const Text(
                'My Account',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 25,
                color: Colors.black,
              ),
            ),
            const Divider(color: Colors.grey, endIndent: 16, indent: 16),
            const ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              leading: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'Notifications',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 25,
                color: Colors.black,
              ),
            ),
            const Divider(color: Colors.grey, endIndent: 16, indent: 16),
            ListTile(
              onTap: () {
                _signOut();
              },
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              leading: const Icon(
                Icons.logout_rounded,
                color: Colors.black,
                size: 30,
              ),
              title: const Text(
                'Log Out',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
          ],
        ),
      ),
    ));
  }
}
