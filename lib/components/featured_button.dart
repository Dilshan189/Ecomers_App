import 'package:eroorhanler/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget featuredButoon({String? title ,icon}) {
  return Row(
    children: [
      Image.asset(icon,width: 60,fit: BoxFit.fill),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  ).box.width(200).margin(const EdgeInsets.symmetric(horizontal:4)).white.padding(const EdgeInsets.all(4)).roundedSM.outerShadow.make();
}