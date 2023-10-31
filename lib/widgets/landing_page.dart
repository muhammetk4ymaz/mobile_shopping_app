import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/widgets/login_page.dart';
import 'package:flutter_mobile_shopping_app/widgets/sign_up_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: MediaQuery.of(context).size.height / 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Hello There!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image:
                          NetworkImage('https://safekaro.com/images/login.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    )),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(46, 98, 188, 1),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: const Center(
                          child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      child: const Center(
                          child: Text('Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
