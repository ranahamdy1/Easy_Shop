import 'package:easy_shop/core/models/product_model.dart';
import 'package:easy_shop/features/paymwnt_screen/payment_screen.dart';
import 'package:easy_shop/public/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomInfoItemScreen extends StatelessWidget {
   CustomInfoItemScreen({Key? key, required this.item}) : super(key: key);
   final Products item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(item.image!),
              SizedBox(height: 20),
              Text(item.name! ,style: TextStyle(color: colorPrimary ,fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              Text(item.description! ),
              SizedBox(height: 20),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PaymentScreen()));
                },
                child: Container(
                  width: 392,
                  height: 55,
                  decoration: BoxDecoration(
                    color: colorPrimary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                    child: Text(
                      "add to cart | \$ ${item.price}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
