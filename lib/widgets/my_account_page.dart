import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/models/my_user.dart';
import 'package:flutter_mobile_shopping_app/providers/user_model.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  final formkey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _name = TextEditingController();
  final _surname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    _email.text = userModel.myUser!.email;
    _name.text = userModel.myUser!.firstName;
    _surname.text = userModel.myUser!.lastName;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Spacer(),
              Text(
                'My Account',
                style: TextStyle(fontSize: getProportionateScreenWidth(30)),
              ),
              const Spacer(),
              Form(
                  key: formkey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(20),
                        horizontal: getProportionateScreenWidth(20)),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _name,
                          decoration: const InputDecoration(
                            hintText: 'Please enter name',
                            labelText: 'Name',
                          ),
                          onSaved: (newValue) {
                            if (newValue!.isNotEmpty) {
                              _name.text = newValue;
                            } else {
                              _name.text = userModel.myUser!.firstName;
                            }
                          },
                          onTap: () {
                            _name.value = TextEditingValue(
                                text: _name.text,
                                selection: TextSelection.collapsed(
                                    offset: _name.text.length));
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        TextFormField(
                          controller: _surname,
                          decoration: const InputDecoration(
                            labelText: 'Surname',
                            hintText: 'Please enter surname',
                          ),
                          onSaved: (newValue) {
                            if (newValue!.isNotEmpty) {
                              _surname.text = newValue;
                            }
                          },
                          onTap: () {
                            _surname.value = TextEditingValue(
                                text: _surname.text,
                                selection: TextSelection.collapsed(
                                    offset: _surname.text.length));
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Please enter email',
                          ),
                          onSaved: (newValue) {
                            if (newValue!.isNotEmpty) {
                              _email.text = newValue;
                            }
                          },
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              if (!EmailValidator.validate(value)) {
                                return 'Email is not in valid format';
                              }
                            }
                            return null;
                          },
                          onTap: () {
                            _email.value = TextEditingValue(
                                text: _email.text,
                                selection: TextSelection.collapsed(
                                    offset: _email.text.length));
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    backgroundColor: Colors.white),
                                child: const Text(
                                  'CANCEL',
                                  style: TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 2.2,
                                      color: Colors.black),
                                )),
                            ElevatedButton(
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    formkey.currentState!.save();

                                    MyUser newMyUser = MyUser(
                                        id: userModel.myUser!.id,
                                        firstName: _name.text,
                                        lastName: _surname.text,
                                        email: _email.text,
                                        password: userModel.myUser!.password,
                                        image: '');

                                    if (userModel.myUser != newMyUser) {
                                      if (userModel.myUser!.email !=
                                          newMyUser.email) {
                                        //   userModel.changeEmail(newMyUser.email);
                                      }
                                      /*  await userModel
                                          .updateUser(
                                              userModel.myUser!, newMyUser)
                                          .whenComplete(() =>
                                              Fluttertoast.showToast(
                                                  msg: 'Successfully updated',
                                                  backgroundColor:
                                                      Colors.green)); */
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: 'No change detected');
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    backgroundColor: Colors.green),
                                child: const Text(
                                  'SAVE',
                                  style: TextStyle(
                                      fontSize: 14, letterSpacing: 2.2),
                                ))
                          ],
                        )
                      ],
                    ),
                  )),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
