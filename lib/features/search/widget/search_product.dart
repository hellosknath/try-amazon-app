// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:try_amazon_app/model/product.dart';

class SearchedProducts extends StatelessWidget {
  final Product products;
  const SearchedProducts({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.network(
                products.images[0],
                fit: BoxFit.fitHeight,
                height: 135,
                width: 135,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
