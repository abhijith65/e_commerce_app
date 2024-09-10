
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';


class Orderdone extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
var controller =Get.put(CartController());
var productlist=controller.list.where((e)=>e['title']).toList();
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
     backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,

          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Text(
          "ORDER INFO",

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          contentPadding: EdgeInsets.all(16.0),
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.4,
                ),
                Text(
                  'Your order has been placed successfully!',
                  style: TextStyle(

                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: 20),
                Center(
                  child: MaterialButton(

                    onPressed: () async {
                      final pdf = pdfWidgets.Document();
                      pdf.addPage(
                        pdfWidgets.Page(
                          build: (pdfContext) => pdfWidgets.Column(
                            children: [
                              pdfWidgets.Text('Products :-'),
                              pdfWidgets.Text(
                                '''$productlist'''
                              ),
                              pdfWidgets.Text(
                                'Thank you for shopping with us!',
                              ),
                            ],
                          ),
                        ),
                      );
                      await Printing.layoutPdf(
                        onLayout: (PdfPageFormat format) async => pdf.save(),
                      );
                    },
                    child: Text(
                      'PRINT PDF',
                      style: TextStyle(color: Colors.yellow),
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