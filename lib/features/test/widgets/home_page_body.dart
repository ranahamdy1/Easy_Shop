import 'package:flutter/material.dart';

import 'custom_text.dart';
import 'list_view_item.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 4 : 0.0),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 10)]),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                child: Image.network(
                                    "https://www.google.com/imgres?q=image%20of%20laptop&imgurl=https%3A%2F%2Fcdn.thewirecutter.com%2Fwp-content%2Fmedia%2F2023%2F06%2Fbestlaptops-2048px-9765.jpg%3Fauto%3Dwebp%26quality%3D75%26width%3D1024&imgrefurl=https%3A%2F%2Fwww.nytimes.com%2Fwirecutter%2Freviews%2Fbest-laptops%2F&docid=bCRo6qqk06R8zM&tbnid=Z5RYU5pgfbPZFM&vet=12ahUKEwiF-fG35o-FAxXzcaQEHXo6D1gQM3oECGIQAA..i&w=1024&h=683&hcb=2&ved=2ahUKEwiF-fG35o-FAxXzcaQEHXo6D1gQM3oECGIQAA")),
                            const Positioned(
                                top: 12,
                                right: 12,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff749791),
                                  child: Icon(Icons.favorite_border_outlined,
                                      color: Colors.white),
                                ))
                          ],
                        ),
                        const SizedBox(height: 8),
                        const CustomText(
                            text: 'Dell Laptop',
                            textSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        const CustomText(
                            text: 'Laptop modern',
                            textSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: '\$ 212.99',
                                textSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Row(
                                children: [
                                  Icon(Icons.star, color: Colors.orangeAccent, size: 20),
                                  SizedBox(width: 6),
                                  Text('5.0')
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
