import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/main.dart';
import 'package:flutter_mobile_shopping_app/providers/user_model.dart';
import 'package:flutter_mobile_shopping_app/widgets/login_page.dart';
import 'package:flutter_mobile_shopping_app/widgets/sign_up_page.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);

    if (_userModel.state == ViewState.Idle) {
      if (_userModel.myUser == null) {
        return LandingWigdet(context);
      } else {
        return MyHomePage();
      }
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  SafeArea LandingWigdet(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // color: Colors.red,
              height: MediaQuery.of(context).size.height / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hello There!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Automatic identity vertification which enable you to verify your identity',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                // color: Colors.yellow,
                image: DecorationImage(
                  image: NetworkImage('https://safekaro.com/images/login.png'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          )),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: MediaQuery.of(context).size.height / 15,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(46, 98, 188, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: const Center(
                                child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: MediaQuery.of(context).size.height / 15,
                            decoration: BoxDecoration(
                                color: Colors.red.shade400,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            child: const Center(
                                child: Text('Sign Up',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ),
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
