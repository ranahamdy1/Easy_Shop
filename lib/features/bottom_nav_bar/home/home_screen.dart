import 'package:easy_shop/core/cubits/product_cubit/product_cubit.dart';
import 'package:easy_shop/core/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    SvgPicture.asset("assets/images/svg/Rectangle.svg"),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recommended Products"),
                        Text("Show All"),
                      ],
                    ),
                    ListView.builder(
                        itemCount: cubit!.data!.products!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        //scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                              padding: const EdgeInsets.all(18),
                              color: Colors.white,
                              height: 210,
                              width: 154,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        //color: Colors.red,
                                        child: Image.network(
                                            "${cubit!.data!.products![index].image}"),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/svg/favourites.svg",
                                        alignment: Alignment.bottomCenter,
                                      ),
                                    ],
                                  ),
                                  Text("${cubit!.data!.products![index].name}"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("\$" +
                                          "${cubit!.data!.products![index].price}"),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Text("5.0"),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
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
