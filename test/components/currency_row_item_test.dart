import 'package:currency_rate_challange/components/currency_row_item.dart';
import 'package:currency_rate_challange/data/models/rate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("test currency row item",(){
    testWidgets("Must Have a Text for symbol",(tester)async {
      //ARRANGE
      await tester.pumpWidget(MaterialApp(home: CurrencyRowItem(data: RateModel(price: 10,symbol: "EURUSD"),)));
      await tester.pumpAndSettle();

      //ACT
      var txtSymbol=find.text("EURUSD");

      //ASSERT
      expect(txtSymbol,findsOneWidget);
    });

    testWidgets("Must Have a Text for Price with 4 decimal ",(tester)async {
      //ARRANGE
      await tester.pumpWidget(MaterialApp(home: CurrencyRowItem(data: RateModel(price: 10,symbol: "EURUSD"),)));
      await tester.pumpAndSettle();

      //ACT
      var txtPrice=find.text("10.0000");

      //ASSERT
      expect(txtPrice,findsOneWidget);
    });

    testWidgets("Must Have an Icon upward ",(tester)async {
      //ARRANGE
      await tester.pumpWidget(MaterialApp(home: CurrencyRowItem(data: RateModel(price: 10,symbol: "EURUSD"),)));
      await tester.pumpAndSettle();

      //ACT
      var iconUpward=find.byIcon(Icons.arrow_upward);

      //ASSERT
      expect(iconUpward,findsOneWidget);
    });
  });
}