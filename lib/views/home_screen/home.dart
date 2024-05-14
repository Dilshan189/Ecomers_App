import 'package:eroorhanler/consts/consts.dart';
import 'package:eroorhanler/controllers/home_controller.dart';
import 'package:eroorhanler/widgets_common/exit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../cart_screen/cart_screen.dart';
import '../category_screen/category_screeen.dart';
import '../profile_screen/profile_screen.dart';
import 'home_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
//ini home controller
  var  controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(icon: Image.asset(icHome,width: 26),label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26),label:categories ),
      BottomNavigationBarItem(icon: Image.asset(icCart,width: 26),label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26),label: account),


    ];

    var navBody = [
      const HomeScreen(),
      const categoryScreen(),
      const CartScreen(),
      const ProfilSecreen(),


    ];

    return WillPopScope(
      onWillPop: () async{
        showDialog(
            barrierDismissible: false,
            context: context, builder: (context) => exitDialog(context));
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(() => Expanded(
                child: navBody.elementAt(controller.currentNavIndex.value)),
            ),
          ],
        ),
        bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              currentIndex: controller.currentNavIndex.value,
            selectedItemColor: redColor,
            selectedLabelStyle: const TextStyle(fontFamily: semibold),
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            items:navbarItem ,
              onTap: (value){
                controller.currentNavIndex.value = value;
              },
          ),
        ),
      ),
    );
  }
}
