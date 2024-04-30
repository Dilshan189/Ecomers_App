import 'package:eroorhanler/consts/consts.dart';
import 'package:eroorhanler/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/customer_textfield.dart';
import '../../widgets_common/our_button.dart';
import '../home_screen/home.dart';

class singupScreen extends StatefulWidget {
  const singupScreen({super.key});

  @override
  State<singupScreen> createState() => _singupScreenState();
}

class _singupScreenState extends State<singupScreen> {

  bool? isCheck = false;
  var controller = Get.put(AuthController());
 

  ///text controllers/////////////////////////////////////////////////////////

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();




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
              "Join the $appname".text.fontFamily(bold).white.size(18).make(),
              Column(
                children: [
                  customTextField(hint: namHint, title: name,controller: nameController),
                  customTextField(hint: emailHint, title: email,controller: emailController),
                  customTextField(hint: passwordHint, title: password,controller: passwordController),
                  customTextField(hint: passwordHint, title: retypePassword,controller: passwordRetypeController),

                   Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){}, child: forgetpassword.text.make())),


                    Row(                        /// added check box
                      children: [
                        Checkbox(
                          checkColor: redColor,
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue;
                            });
                          },
                        ),
                        5.widthBox,

                        Expanded(
                          child: RichText(text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "I agree to the ",style: TextStyle(
                                fontFamily: regular,
                                color: fontGrey,
                              ),
                              ),
                              TextSpan(
                                text: termAndCond,style: TextStyle(
                                fontFamily: regular,
                                color: redColor,
                              ),
                              ),

                              TextSpan(
                                text:" & ",
                                style: TextStyle(
                                fontFamily: regular,
                                color: fontGrey,
                              ),
                              ),

                              TextSpan(
                                text: privacyPolicy,
                                style: TextStyle(
                                fontFamily: regular,
                                color: redColor,

                              ),
                              ),


                            ]
                          ),

                          ),
                        ),

                      ],
                    ),
                  5.heightBox,
                  ourButton(
                    color:isCheck == true? redColor:lightGrey,
                    title: signup,
                    textColor: whiteColor,
                    onPress: () async {
                      if(isCheck !=false){
                        try {
                          await controller.signupMethod(context:context,email:emailController.text,password:passwordController.text).then((value) {
                            return controller.storeUserDta(email: emailController.text, password: passwordController.text, name: nameController.text);
                          }).then((value) {
                            VxToast.show(context, msg: loggedin);
                            Get.offAll(()=>Home());
                          });
                        }catch (e) {}
                      }
                    },
                  ).box.width(context.screenWidth - 50).make(),
                 
                 
                  10.heightBox,

                  ///wrapping into gesture of velocity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      alreadyHaveAccount.text.color(fontGrey).make(),
                      login.text.color(redColor).make().onTap(() {
                        Get.back();
                      })
                    ],
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

