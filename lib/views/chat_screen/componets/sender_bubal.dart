import 'package:eroorhanler/consts/consts.dart';

Widget senderBubble(){
  return  Container(
    decoration: const  BoxDecoration(
        color: redColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
    child: Column(
      children: [
        "Message here.......".text.white.size(16).make(),
        10.heightBox,
        "11.45 PM".text.color(whiteColor.withOpacity(0.5)).size(16).make(),
      ],
    ),
  );
}