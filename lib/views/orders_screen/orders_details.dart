import 'package:eroorhanler/views/cart_screen/componets/order_status.dart';
import 'package:flutter/material.dart';

import '../../consts/consts.dart';

class OrderDetails extends StatelessWidget {
  final dynamic data;
  const OrderDetails({super.key,this.data});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: "Order Details".text.fontFamily(semibold).color(whiteColor).make(),
      ),
      body: Column(
        children: [
          orderStatus(
                color: redColor,icon: Icons.done,title:"Order placed",showDone: data['order_placed'],
              )
            ],
          )
    );
  }
}
