import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/product_write/product_write_page.dart';

class ProductDetailActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //TODO 자신의 글이 아니면 보여주지 않기
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 50,
            height: 50,
            color: Colors.transparent,
            child: Icon(Icons.delete),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProductWritePage();
                },
              ),
            );
          },
          child: Container(
            width: 50,
            height: 50,
            color: Colors.transparent,
            child: Icon(Icons.edit),
          ),
        ),
      ],
    );
  }
}
