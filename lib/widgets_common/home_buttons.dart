import 'package:eroorhanler/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget homeButtons({ icon, width,height, String ? title, onPress , brand }) {
  return  Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon,width: 26),
        10.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make(),
      ],
  ).box.rounded.white.size(width, height, ).shadowSm.make();

}