import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/images/svg/basket.svg"),
                SizedBox(width: 12),
                SvgPicture.asset("assets/images/svg/EasyShop.svg"),
              ],
            ),
            Icon(Icons.add_alert_outlined)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/images/svg/suffix_icon.svg"),
                ),
              ),
            ),
            SvgPicture.asset("assets/images/svg/Rectangle.svg"),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recommended Products"),
                Text("Show All"),
              ],
            ),
            Container(
              padding: EdgeInsets.all(18),
              color: Colors.white,
              height: 210,
              width: 154,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children:[
                    SvgPicture.asset("assets/images/svg/computer.svg"),
                    SvgPicture.asset("assets/images/svg/favourites.svg"),
                  ]),
                  Text("Dell Laptop"),
                  Text("Laptop modern"),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$212.99"),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow,),
                          Text("5.0"),
                        ],
                      )
                    ],
                  ),
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}
