import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:games_app/components/bottom_purchase.dart';
import 'package:games_app/components/card_list.dart';
import 'package:games_app/components/constants.dart';
import 'package:games_app/components/icons_card_button.dart';
import 'package:provider/provider.dart';

import '../models/provider.dart';

// ignore: must_be_immutable
class PurchaseCart extends StatefulWidget {
  int index;
  PurchaseCart({
    this.index,
  });
  @override
  _PurchaseCartState createState() => _PurchaseCartState();
}

class _PurchaseCartState extends State<PurchaseCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        actions: [
          IconsStyle(
              iconData: Icons.first_page,
              onPressed: () {
                setState(() {
                  Provider.of<CartData>(context).orderBy('score');
                });
              }),
          IconsStyle(
              iconData: Icons.sort_by_alpha,
              onPressed: () {
                setState(() {
                  Provider.of<CartData>(context).orderBy('name');
                });
              }),
          IconsStyle(
              iconData: Icons.attach_money,
              onPressed: () {
                setState(() {
                  Provider.of<CartData>(context).orderBy('price');
                });
              }),
        ],
      ),
      body: Container(
        color: kBackgroundColorContainer,
        child: FutureBuilder(builder: (context, snapshot) {
          return Consumer<CartData>(
            builder: (context, cartData, child) {
              return ListView.builder(
                itemCount: cartData.list.length,
                itemBuilder: (context, int index) {
                  double pay = cartData.jsonCode[widget.index]['price'];
                  return CardList(
                    image: 'images/${cartData.jsonCode[widget.index]['image']}',
                    textCardName: cartData.jsonCode[widget.index]['name'],
                    textCardScore:
                        'Pontuação: ${cartData.jsonCode[widget.index]['score']}',
                    textCardPrice:
                        'R\$ ${cartData.jsonCode[widget.index]['price']}',
                    addShipping: pay + 10.0,
                    buttom: BottomPurchase(
                      textPurchase: 'Valor da compra:',
                      textPrice:
                          'Valor: R\$ ${cartData.jsonCode[index]['price']}',
                      textShipping: 'frete: R\$  10.0',
                      textAmount:
                          'Valor Total: R\$ ${pay < 250.0 ? pay + 10.0 : pay} reais',
                    ),
                    iconData: Icons.remove_shopping_cart,
                    onPressed: () {
                      setState(
                        () {
                          Provider.of<CartData>(context).removeList(index);
                        },
                      );
                    },
                  );
                },
              );
            },
          );
        }),
      ),
    );
  }
}
