import 'package:easy_shop/core/cubits/product_cubit/product_cubit.dart';
import 'package:easy_shop/core/models/product_model.dart';
import 'package:easy_shop/features/test/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_info_item_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProduct(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          ProductModel? cubit = ProductCubit.get(context).productModel;
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
              child: SingleChildScrollView(
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
                          child: SvgPicture.asset(
                              "assets/images/svg/suffix_icon.svg"),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Image.asset("assets/images/png/computer.png"),
                    SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recommended Products"),
                        Text("Show All"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: cubit!.data!.products!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final item = cubit.data!.products![index];
                            return Padding(
                                padding:
                                    EdgeInsets.only(left: index == 0 ? 4 : 0.0),
                                child: Container(
                                  width: 200,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade100,
                                        blurRadius: 10)
                                  ]),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                          CustomInfoItemScreen(item: item)));
                                    },
                                    child: Card(
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(8),
                                                          topRight:
                                                              Radius.circular(8)),
                                                  child: SizedBox(
                                                    width: 200,
                                                    height: 80,
                                                    child: Image.network(
                                                      "${cubit.data!.products![index].image}",
                                                    ),
                                                  )),
                                              const Positioned(
                                                  top: 12,
                                                  right: 12,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Color(0xff749791),
                                                    child: Icon(
                                                        Icons
                                                            .favorite_border_outlined,
                                                        color: Colors.white),
                                                  ))
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          SizedBox(
                                            height: 40,
                                            child: CustomText(
                                                text:
                                                    "${cubit.data!.products![index].name}",
                                                textSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: CustomText(
                                                text:
                                                    "${cubit.data!.products![index].description}",
                                                textSize: 12,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                  text:
                                                      "${cubit.data!.products![index].price}",
                                                  textSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: Row(
                                                  children: [
                                                    const Icon(Icons.star,
                                                        color:
                                                            Colors.orangeAccent,
                                                        size: 20),
                                                    SizedBox(width: 6),
                                                    Text(
                                                        "${cubit.data!.products![index].id}")
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                          }),
                    ),
                    SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Featured Products"),
                        Text("Show All"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            final item = cubit.data!.products![index];
                            return Padding(
                                padding:
                                    EdgeInsets.only(left: index == 0 ? 4 : 0.0),
                                child: Container(
                                  width: 200,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade100,
                                        blurRadius: 10)
                                  ]),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                       CustomInfoItemScreen(item: item)));
                                    },
                                    child: Card(
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft: Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(8)),
                                              child: SizedBox(
                                                width: 80,
                                                height: 80,
                                                child: Image.network(
                                                  "${cubit.data!.products![index].image}",
                                                ),
                                              )),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 40,
                                                child: CustomText(
                                                  text:
                                                      "${cubit.data!.products![index].name}",
                                                  textSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                                child: Text(
                                                  "${cubit.data!.products![index].description}",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  CustomText(
                                                      text:
                                                          "${cubit.data!.products![index].price}",
                                                      textSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  SizedBox(width: 166),
                                                  Row(
                                                    children: [
                                                      const Icon(Icons.star,
                                                          color:
                                                              Colors.orangeAccent,
                                                          size: 20),
                                                      Text(
                                                          "${cubit.data!.products![index].id}")
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
