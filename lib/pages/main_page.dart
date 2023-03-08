import 'package:currency_rate_challange/components/currency_row_item.dart';
import 'package:currency_rate_challange/configs.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Configs.colorPageBackground,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,top:60,right: 20,bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Rates",style: TextStyle(
              color: Configs.colorTextBlack,
              fontWeight: FontWeight.w700,
              fontSize: 48
            ),),
            Expanded(
              child:ListView.builder(
                itemBuilder: (ctx,index){
                  return const CurrencyRowItem();
                },
                itemCount: 10,
              ),
            ),
            const SizedBox(height: 30,),
            const Center(
              child: Text("Last updated: 30/03/2023 - 16:00",style: TextStyle(
                  color: Configs.colorTextGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
