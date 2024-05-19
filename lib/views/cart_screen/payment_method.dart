import 'package:eroorhanler/consts/consts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets_common/our_button.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar:SizedBox(
        height: 60,
        child: ourButton(
          onPress: (){

          },
          color: redColor,
          textColor: whiteColor,
          title:"Place My Oder",
        ),
      ),
      appBar: AppBar(
        title: "Choose Payment Method".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
    );
  }
}
