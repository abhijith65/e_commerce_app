import 'package:e_commerce_app/view/buynow/buynow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controller/cart_controller.dart';
import '../../model/products/products.dart';
import '../checkout/checkout.dart';
import '../home/home.dart';


class Cart extends StatelessWidget {
  var controller =Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);


    return Scaffold(
     backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
           // color: ColorTheme.white,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()), // Replace with your home screen
              ModalRoute.withName('/'), // Clear all previous routes
            );
          },
        ),
       // backgroundColor: ColorTheme.backgroundclr,
        title: Text(
          "CART",
         // style: GlTextStyles.robotoStyl(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child:Obx(()=> ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: controller.list.length,
              itemBuilder: (context, index) {


                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Image.network(
                          '${controller.list[index]['thumbnail']}',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${controller.list[index]['title']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  //color: ColorTheme.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '₹${controller.list[index]['price']}',
                                style: TextStyle(
                                  fontSize: 14,
                                  //color: ColorTheme.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_outline,
                              //color: ColorTheme.black
                            ),
                          onPressed: () {
                            controller.remove1(controller.list[index]);

                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.1,
                ),

                SizedBox(
                  width: size.width * 0.15,
                ),
                MaterialButton(
                  //color: ColorTheme.text,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Buynow(),
                      ),
                    );
                  },
                  child: Text(
                    'CHECK OUT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        //color: ColorTheme.black,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}