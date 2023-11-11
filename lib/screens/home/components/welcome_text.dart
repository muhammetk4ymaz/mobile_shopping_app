import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/providers/user_model.dart';
import 'package:provider/provider.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context, listen: true);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Good Days, ${userModel.myUser!.firstName}',
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
      ),
    );
  }
}
