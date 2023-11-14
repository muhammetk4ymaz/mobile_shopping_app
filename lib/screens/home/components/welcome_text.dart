import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/providers/user_model.dart';
import 'package:provider/provider.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Consumer<UserModel>(
          builder: (context, value, child) => Text(
            'Good Days, ${value.myUser!.firstName}',
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
          ),
        ));
  }
}
