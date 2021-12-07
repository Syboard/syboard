import 'package:flutter/material.dart';
import 'package:syboard/utils/styles.dart';
import 'package:syboard/models/product.dart';
import 'package:syboard/ui/cart_item.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  //CartItem
  static final _CartItemList = <Product>[
    Product(
        imgURL:
            "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/msi/thumb/v2-84267-6_large.jpg",
        productName: "Nvidia Geforce GTX1050ti",
        rating: 5,
        price: 100.99,
        seller: "Vatan PC"),
    Product(
        imgURL:
            "https://www.incehesap.com/resim/urun/202109/6145d6afce4703.99445409_pgnkeiolfmqhj_500.jpg",
        productName: "MSI Prestige Notebook",
        rating: 3.9,
        price: 2000.99,
        seller: "İtopya.com"),
    Product(
        imgURL:
            "https://m.media-amazon.com/images/I/91LSF1iZUFL._AC_SL1500_.jpg",
        productName: "Gaming PC",
        rating: 4.4,
        price: 1000.99,
        seller: "Hasan Hüseyin"),
    Product(
        imgURL: "https://static.sinerji.gen.tr/Images/MD/N8H-da-s1.jpg",
        productName: "Gaming PC",
        rating: 4.5,
        price: 12.99,
        seller: "Seller2"),
    Product(
        imgURL:
            "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/asus/thumb/118533_large.jpg",
        productName: "Gaming Monitor",
        rating: 4.7,
        price: 179.99,
        seller: "Seller1"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
          style: kAppBarTitleTextStyle,
        ),
        backgroundColor: Colors.white38,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 28,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _CartItemList.length,
                itemBuilder: (context, i) {
                  return CartItem(_CartItemList[i]);
                }),
          )
        ],
      ),
    );
  }
}
