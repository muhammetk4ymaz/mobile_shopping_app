import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/models/my_user.dart';
import 'package:flutter_mobile_shopping_app/providers/user_model.dart';
import 'package:flutter_mobile_shopping_app/widgets/user_information_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);

    if (_userModel.myUser != null) {
      MyUser myUser = _userModel.myUser!;
      String nameAndSurname = myUser.name + ' ' + myUser.surname;
      return SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                          color: Colors.teal,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Icon(
                        Icons.person,
                        size: 75,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 5),
                    child: Text(
                      nameAndSurname.toUpperCase(),
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'EDIT PROFILE',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.black)),
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
                destinations: [
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
            SizedBox(
              height: 15,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInformationPage(myUser: myUser),
                ));
              },
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              title: Text(
                'MY USER INFORMATION',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('View'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
            Divider(color: Colors.grey, endIndent: 16, indent: 16),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              title: Text(
                'CHANGE PASSWORD',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('View'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
          ],
        ),
      ));
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
