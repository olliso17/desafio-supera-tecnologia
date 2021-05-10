import 'package:flutter/material.dart';
import 'package:games_app/components/constants.dart';
import 'package:games_app/models/provider.dart';
import 'package:games_app/screens/page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartData(),
      builder: (context) => CartData(),
      child: MaterialApp(
        title: 'Loja de Jogos',
        theme: ThemeData(primaryColor: kColorTextGamer),
        home: PageGame(),
      ),
    );
  }
}
