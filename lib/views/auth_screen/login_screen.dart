import 'package:eroorhanler/consts/consts.dart';
import 'package:eroorhanler/consts/list.dart';
import 'package:eroorhanler/views/auth_screen/singup_screen.dart';
import 'package:eroorhanler/views/home_screen/home.dart';
import 'package:eroorhanler/widgets_common/applogo_widget.dart';
import 'package:eroorhanler/widgets_common/bg_widget.dart';
import 'package:eroorhanler/widgets_common/customer_textfield.dart';
import 'package:eroorhanler/widgets_common/our_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogiWidget(),
              10.heightBox,
              "Login in to $appname".text.fontFamily(bold).white.size(18).make(),
              Column(
                children: [
                  customTextField(hint: emailHint, title: email),
                  customTextField(hint: passwordHint, title: password),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetpassword.text.make(),
                    ),
                  ),
                  5.heightBox,
                  ourButton(                      ///login button
                    color: redColor,
                    title: login,
                    textColor: whiteColor,
                    onPress: () {
                      Get.to(()=> const Home());
                    },
                  ).box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,

                  ourButton(                       /// sing up button
                    color:  redColor,
                    title: signup,
                    textColor: whiteColor,
                    onPress: () {
                      Get.to(() => const singupScreen());
                    },
                  ).box.width(context.screenWidth - 50).make(),

                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  15.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                                    backgroundColor: lightGrey,
                                                    radius: 25,
                                                    child: Image.asset(socialIconList[index],
                                                    width: 30,),
                                                  ),
                            )),
                  ),



                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),

            ],
          ),
        ),
      ),
    );
  }

  Text get createNewAccount => const Text("Create New Account");

}
