import 'package:flutter/material.dart';
import 'package:testing/Features/home/Model/ProductListMode.dart';
import 'package:testing/Features/home/bloc/homebloc_bloc.dart';

class ProductListWidget extends StatelessWidget {
  final ProductListDataModel product;
  final HomeblocBloc homeblocBloc;

  ProductListWidget(
      {super.key, required this.product, required this.homeblocBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(product.image.toString()))),
          ),
          Text(
            product.name.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(product.brand.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + product.price.toString()),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeblocBloc.add(HomeProductWishListButtonClickedEvent(
                            clicked: product));
                      },
                      icon: Icon(Icons.favorite)),
                  IconButton(
                      onPressed: () {
                        homeblocBloc.add(HomeProductCartButtonClickedEvent(
                            clicked: product));
                      },
                      icon: Icon(Icons.shopping_bag)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
