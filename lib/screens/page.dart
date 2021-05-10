import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:games_app/components/bottom_purchase.dart';
import 'package:games_app/components/card_list.dart';
import 'package:games_app/components/constants.dart';
import 'package:games_app/components/icons_card_button.dart';
import 'package:games_app/components/text_gamer.dart';
import 'package:games_app/models/provider.dart';
import 'package:games_app/screens/page_purchase.dart';
import 'package:provider/provider.dart';

class PageGame extends StatefulWidget {
  @override
  _PageGameState createState() => _PageGameState();
}

class _PageGameState extends State<PageGame> {
  List list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: TextGamer(
          text: 'Loja de Jogos',
          color: kColorTextGamerName,
        ),
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
        child: FutureBuilder(
          builder: (context, snapshot) {
            return Consumer<CartData>(
              builder: (context, cartData, child) {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: cartData.jsonCode.length,
                    itemBuilder: (context, int index) {
                      double pay = cartData.jsonCode[index]['price'];
                      return CardList(
                        iconData: Icons.add_shopping_cart,
                        onPressed: () {
                          setState(() {
                            cartData.addList(index);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PurchaseCart(
                                  index: index,
                                ),
                              ),
                            );
                          });
                        },
                        image: 'images/${cartData.jsonCode[index]['image']}',
                        textCardName: cartData.jsonCode[index]['name'],
                        textCardScore:
                            'Pontuação: ${cartData.jsonCode[index]['score']}',
                        textCardPrice:
                            'R\$ ${cartData.jsonCode[index]['price']}',
                        addShipping: pay + 10.0,
                        buttom: BottomPurchase(
                          textPurchase: 'Valor da compra:',
                          textPrice:
                              'Valor: R\$ ${cartData.jsonCode[index]['price']}',
                          textShipping: 'frete: R\$  10.0',
                          textAmount:
                              'Valor Total: R\$ ${pay < 250.0 ? pay + 10.0 : pay} reais',
                        ),
                      );
                    });
              },
            );
          },
        ),
      ),
    );
  }
}
