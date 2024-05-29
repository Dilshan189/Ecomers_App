import 'package:eroorhanler/consts/consts.dart';

Widget orderStatus({icon,color,title,showDone}){
  return ListTile(
    leading:  Icon(
      icon,
      color: color,)
        .box.border(
        color: color)
        .make(),
    trailing: Row(
      children: [
        "$title".text.color(darkFontGrey).make(),
        showDone ? const Icon(
          Icons.done,
          color: redColor,
        ):Container(),
      ],
    ),
  );
}