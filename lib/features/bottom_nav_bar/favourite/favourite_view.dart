import 'package:easy_shop/features/test/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
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
                      child:
                          SvgPicture.asset("assets/images/svg/suffix_icon.svg"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 555,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          width: 200,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade100, blurRadius: 10)
                          ]),
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
                                        child: SizedBox(
                                          width: 200,
                                          height: 80,
                                          child: Image.asset("assets/images/png/computer.png"),
                                        )),
                                    const Positioned(
                                        top: 12,
                                        right: 12,
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xff749791),
                                          child: Icon(
                                              Icons.favorite_border_outlined,
                                              color: Colors.white),
                                        ))
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const SizedBox(
                                  height: 20,
                                  child: CustomText(
                                      text:
                                          "{cubit.data!.products![index].name}",
                                      textSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                  child: CustomText(
                                      text:
                                          "{cubit.data!.products![index].description}",
                                      textSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                        text: "price",
                                        textSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    Padding(
                                      padding: EdgeInsets.only(right: 8),
                                      child: Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors.orangeAccent,
                                              size: 20),
                                          SizedBox(width: 6),
                                          Text("id")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
