import 'package:eroorhanler/consts/consts.dart';
import 'package:eroorhanler/controllers/profile_controler.dart';
import 'package:eroorhanler/widgets_common/bg_widget.dart';
import 'package:eroorhanler/widgets_common/customer_textfield.dart';
import 'package:eroorhanler/widgets_common/our_button.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'dart:io';

class EditprofileScreen extends StatelessWidget {

final dynamic data;



  const EditprofileScreen({super.key,this.data});

  get imgUrl => null;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();


    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body:Obx(()=> SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

             /// if data imageUrl and controller path is Empty

             data['imageUrl']== '' &&   controller.profileImgPath.isEmpty
                 ? Image.asset(imgProfile2, width: 80, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()



               /// if data is not empty  but controller path is Empty

                 : data['imageUrl'] != '' && controller.profileImgPath.isEmpty?
                     Image.network(data['imageUrl'],
                       width: 100,
                    fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()

             /// if both are Empty

                    : Image.file(File(controller.profileImgPath.value),
                width: 100,
                fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),

                10.heightBox,

                ourButton(color: redColor,onPress: (){
                  controller.changeImage(context);
                },textColor: whiteColor,title: 'Change'),
                const Divider(),

                20.heightBox,
                customTextField(
                  controller: controller.nameController,
                    hint: nameHint,
                    title: name,
                    isPass:false),

                10.heightBox,
                customTextField(
                  controller: controller.oldpassController,
                    hint: passwordHint,
                    title: oldpass,
                    isPass:true),

                10.heightBox,
                customTextField(
                    controller: controller.oldpassController,
                    hint: passwordHint,
                    title: newpass,
                    isPass:true),

                20.heightBox,
                 controller.isloading.value? const CircularProgressIndicator(
                   valueColor: AlwaysStoppedAnimation(redColor))
                     : SizedBox(
                      width: context.screenWidth - 60 ,
                       child: ourButton(color: redColor,
                        onPress: () async {



                      controller.isloading(true);

                /// if image is not selected

              if(controller.profileImgPath.value.isEmpty){
              await controller.uploadProfileImage();
              }else{
                controller.profileImageLink = data['imageUrl'];
              }

              /// if old password match database


                      if(data['password'] == controller.oldpassController.text) {


                      await  controller.changeAuthPassword(
                        email: data['email'],
                        password: controller.oldpassController.text,
                        newpassword: controller.newpassController.text,
                      );


                        await controller.uploadProfileImage();
                        await controller.updateProfile(
                          imgUrl: controller.profileImageLink,
                          name: controller.nameController,
                          password: controller.newpassController.text,
                        );
                        VxToast.show(context, msg: "Updated");
                      }else{
                        VxToast.show(context, msg: "wrong old password");
                        controller.isloading(false);
                      }
                    },textColor: whiteColor,title: 'Save')),
              ],
            ).box.white.shadowSm.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(top: 50,left: 12,right: 12)).rounded.make(),
        ),
        ),
      ),
    );
  }
}
