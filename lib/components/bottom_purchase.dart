import 'package:flutter/material.dart';
import 'package:games_app/components/text_gamer.dart';
import 'package:games_app/components/constants.dart';

import 'bottom_confirm.dart';

class BottomPurchase extends StatelessWidget {
  final String textPurchase;
  final String textPrice;
  final String textShipping;
  final String textAmount;
  BottomPurchase({
    @required this.textPurchase,
    @required this.textPrice,
    @required this.textShipping,
    @required this.textAmount,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(height * 0.02),
        ),
        gradient: kLinearGradientBottom,
      ),
      child: FlatButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                    color: kBackgroundColorContainer,
                    child: Container(
                      padding: EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                        gradient: kGradientCardList,
                      ),
                      child: Column(
                        children: [
                          TextGamer(
                            text: textPurchase,
                            color: kColorTextGamerScore,
                          ),
                          TextGamer(
                            text: textPrice,
                            color: kColorTextGamerScore,
                          ),
                          TextGamer(
                            text: textShipping,
                            color: kColorTextGamerScore,
                          ),
                          TextGamer(
                            text: textAmount,
                            color: kColorTextGamerName,
                          ),
                          BottomConfirm(
                            textBottom: TextGamer(
                                color: kColorTextGamerName, text: 'Confirmar'),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: kAlertColor,
                                      title: TextGamer(
                                        text: 'Olá!',
                                        color: kColorTextGamerScore,
                                      ),
                                      content: TextGamer(
                                        text:
                                            'Tem certeza que deseja efetuar a compra?',
                                        color: kColorTextGamerScore,
                                      ),
                                      actions: [
                                        BottomConfirm(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        kAlertColor,
                                                    title: TextGamer(
                                                      text: 'Obrigada!',
                                                      color:
                                                          kColorTextGamerScore,
                                                    ),
                                                    content: TextGamer(
                                                      text:
                                                          'Sua compra foi realizada com sucesso!',
                                                      color:
                                                          kColorTextGamerScore,
                                                    ),
                                                  );
                                                });
                                          },
                                          textBottom: TextGamer(
                                              color: kColorTextGamerName,
                                              text: 'Confirmar'),
                                        ),
                                        BottomConfirm(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          textBottom: TextGamer(
                                              color: kColorTextGamerName,
                                              text: 'Cancelar'),
                                        ),
                                      ],
                                    );
                                  });
                            },
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextGamer(
                            text:
                                'Obs.: Valor igual ou acima de R\$ 250,0 o frete é gratuito',
                            color: kColorTextGamerScore,
                          )
                        ],
                      ),
                    ),
                  ));
        },
        child: TextGamer(color: kColorTextGamerName, text: 'Confirmar'),
      ),
    );
  }
}
