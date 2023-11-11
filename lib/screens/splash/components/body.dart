import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/components/default_button.dart';
import 'package:flutter_mobile_shopping_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_mobile_shopping_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_mobile_shopping_app/screens/splash/components/splash_content.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to EYTSHOP, Let's shop!",
      "image":
          "https://static.vecteezy.com/system/resources/previews/005/879/539/non_2x/cloud-computing-modern-flat-concept-for-web-banner-design-man-enters-password-and-login-to-access-cloud-storage-for-uploading-and-processing-files-illustration-with-isolated-people-scene-free-vector.jpg"
    },
    {
      "text": "We help people connect with store \naround Turkey",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFfX3qNAjGfrc0uLQVoWHcJOX-Z0l1ofvMBQ&usqp=CAU"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    text: splashData[index]["text"]!,
                    image: splashData[index]["image"]!,
                  ),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            splashData.length, (index) => buildDot(index)),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Column(
                        children: [
                          DefaultButton(
                            text: 'Sign In',
                            press: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ));
                            },
                            color: Color.fromRGBO(46, 98, 188, 1),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          DefaultButton(
                            text: 'Sign Up',
                            press: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ));
                            },
                            color: Colors.red.shade400,
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: currentPage == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blue.shade400 : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
