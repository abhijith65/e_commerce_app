import 'dart:math';

import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/view/cart/cart.dart';
import 'package:e_commerce_app/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scratcher/widgets.dart';

import '../../model/products/products.dart';

class Scratchcard extends StatefulWidget {
   Scratchcard({super.key});

  @override
  State<Scratchcard> createState() => _ScratchcardState();
}

class _ScratchcardState extends State<Scratchcard> {
var controller=Get.put(CartController());

var random=Random();

var item;

var i=0;
@override
  void initState() {
  i=random.nextInt(20);
    item= products[i];
    item['price']=0;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(

          decoration: BoxDecoration(

            boxShadow: [
              BoxShadow(
                color: Colors.redAccent,
                blurRadius: 8,
                spreadRadius: 2,
                blurStyle: BlurStyle.outer
              )
            ]
          ),// Set a fixed height for the ScratchCard
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Scratcher(
                  brushSize: 50,
                  threshold: 50,
                  color: Colors.blueGrey,
                 //  onThreshold: () {
                 //    i=random.nextInt(20);
                 //     item= products[i];
                 //  },
                  child: Container(
                    height: 200, // Adjust the height as needed
                    width: 200,  // Adjust the width as needed

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network('${item['thumbnail']}',
                          //imageUrl,
                          height: 100,  // Adjust image size if necessary
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Price: \$0',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${item['title']}',
                          style: TextStyle(fontSize: 14, ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                 // onPressed: onAddToCart,
                  style: ElevatedButton.styleFrom(
                   // backgroundColor: ColorTheme.text,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {controller.add1(item);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Cart())); },
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16,
                      //color: ColorTheme.backgroundclr,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
