import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/model/products/products.dart';
import 'package:e_commerce_app/view/cart/cart.dart';
import 'package:e_commerce_app/view/details/details.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class Home extends StatelessWidget {
 // final List<Map> productsList = products;
var controller =Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    //final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
       leading: Icon(null),
        title: Text(
          'Shoppy',
         // style: GlTextStyles.robotoStyl(),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0), // Add padding around the grid view
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: .5,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding:
            const EdgeInsets.all(8.0), // Add padding around each grid item
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(index),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(8.0)),
                        child: Image.network(
                          '${product['thumbnail']}',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${product['title']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            '₹${product['price']}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Center(
                            child: MaterialButton(
                             // color: ColorTheme.backgroundclr,
                              //shape: StadiumBorder(),
                              onPressed: () {controller.add1(product);
                               // cartProvider.addProduct(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                    Text('product added to cart'),
                                  ),
                                );
                              },
                              child: Text(
                                'ADD TO CART',style: TextStyle(color: Colors.black),
                                // style: GlTextStyles.hintstyle(
                                //   size: 15,
                                //   //color: ColorTheme.text,
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton:  badges.Badge(
        badgeContent:Obx( ()=>Text('${controller.list.length}',
          // cartProvider.cart.length.toString(),
          style: TextStyle(color: Colors.white),
        )),
        child: Container(
          child:FloatingActionButton(
            child: Icon(Icons.shopping_cart_outlined,size: 50,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(),
                ),
              );
            },
          )
        ),
      ),
    );
  }
}