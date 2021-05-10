import 'package:flutter/foundation.dart';
import 'package:games_app/api/api.dart';
import 'package:games_app/components/card_list.dart';

class CartData extends ChangeNotifier {
  List jsonCode = GamerApi().jsonData;
  bool isDone = false;
  List list = [];

  void orderBy(String order) {
    jsonCode.sort((a, b) => a[order].compareTo(b[order]));
  }

  void addList(int index) {
    double pay = jsonCode[index]['price'];
    list.add(
      CardList(
        image: 'images/${jsonCode[index]['image']}',
        textCardName: jsonCode[index]['name'],
        textCardScore: 'Pontuação: ${jsonCode[index]['score']}',
        textCardPrice: 'Preço: ${jsonCode[index]['price']}',
        addShipping: pay + 10.0,
      ),
    );
  }

  void removeList(int index) {
    list.removeAt(index);
  }
}
