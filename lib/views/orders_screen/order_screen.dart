import 'package:eroorhanler/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'orders_details.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:"Orders".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('orders').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator());
          } 
          else if (snapshot.hasError)
          {
            return Center(
                child: Text('Error: ${snapshot.error}'));

          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) 
          {

            return const Center(child: Text('No orders found.'));

          } else {

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                var order = snapshot.data!.docs[index];
                return ListTile(
                  leading: "${index + 1}".text.fontFamily(semibold).color(darkFontGrey).make(),
                  title: Text('Order: ${order['order_code']}'),
                  subtitle: Text('Price.${order['total_amount'].toString().numCurrency}'),
                  trailing: IconButton(
                    onPressed: (){
                      Get.to(()=> const OrderDetails());
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: redColor,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
