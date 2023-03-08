import 'package:flutter/material.dart';

class CurrencyRowItem extends StatelessWidget {
  const CurrencyRowItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xfff9f9f9),
        borderRadius: BorderRadius.circular(20)
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Text("EUR/USD",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 18
              ),),
            ],
          ),
          Row(
            children: const [
              Text("0.8682",style: TextStyle(
                  color: Color(0xff02cb16),
                  fontWeight: FontWeight.w500,
                  fontSize: 20
              ),),
              SizedBox(width: 4,),
              Icon(Icons.arrow_upward,color: Color(0xff02cb16)),
            ],
          )
        ],
      ),
    );
  }
}