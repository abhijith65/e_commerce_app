import 'package:flutter/material.dart';

import 'orderdone.dart';


class Buynow extends StatefulWidget {
  //final List<Product> products;

  //PaymentScreen({required this.products});

  @override
  _BuynowState createState() => _BuynowState();
}

class _BuynowState extends State<Buynow> {
  int selectedPaymentMethod = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: ColorTheme.backgroundclr,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
           // color: ColorTheme.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
       // backgroundColor: ColorTheme.backgroundclr,
        title: Text(
          "PAYMENT",
          //style: GlTextStyles.robotoStyl(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Payment Method',
              style: TextStyle(
                //color: ColorTheme.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  buildPaymentMethodTile(
                    context,
                    title: 'Google Pay',
                    value: 1,
                    selectedValue: selectedPaymentMethod,
                    icon: Icons.account_balance_wallet,
                  ),
                  buildPaymentMethodTile(
                    context,
                    title: 'Paytm',
                    value: 2,
                    selectedValue: selectedPaymentMethod,
                    icon: Icons.payment,
                  ),
                  buildPaymentMethodTile(
                    context,
                    title: 'Cash on Delivery',
                    value: 3,
                    selectedValue: selectedPaymentMethod,
                    icon: Icons.money,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: MaterialButton(
                //shape: StadiumBorder(),
                //color: ColorTheme.text,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Orderdone(
                      ),
                    ),
                  );
                },
                child: Text(
                    'CONFIRM',
                   // style: TextStyle(color: ColorTheme.black,fontWeight: FontWeight.bold)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentMethodTile(BuildContext context,
      {required String title,
        required int value,
        required int selectedValue,
        required IconData icon}) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        leading: Icon(icon, color: Colors.black),
        trailing: Radio(
          value: value,
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedPaymentMethod = value as int;
            });
          },
        ),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}