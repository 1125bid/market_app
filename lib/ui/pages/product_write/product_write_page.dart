import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_market_app/core/validator_util.dart';
import 'package:flutter_market_app/ui/pages/product_write/widgets/prodcut_category_box.dart';
import 'package:flutter_market_app/ui/pages/product_write/widgets/product_write_picture_area.dart';

class ProductWritePage extends StatefulWidget {
  @override
  State<ProductWritePage> createState() => _ProductWritePageState();
}

class _ProductWritePageState extends State<ProductWritePage> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final contentController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void onWriteDone() {
    formkey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: formkey,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              ProductWritePictureArea(),
              SizedBox(height: 20),
              ProductCategoryBox(),
              SizedBox(height: 20),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: '상품명을 입력해주세요.',
                ),
                validator: ValidatorUtil.validatorTitle,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                  hintText: '가격을 입력해주세요.',
                ),
                validator: ValidatorUtil.validatorPrice,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: contentController,
                decoration: InputDecoration(
                  hintText: '내용을 입력해주세요.',
                ),
                validator: ValidatorUtil.validatorContent,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: onWriteDone,
                child: Text('작성완료'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
