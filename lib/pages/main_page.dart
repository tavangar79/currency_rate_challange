import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:currency_rate_challange/bloc/main_page_bloc.dart';
import 'package:currency_rate_challange/components/currency_row_item.dart';
import 'package:currency_rate_challange/configs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AfterLayoutMixin {
  MainPageBloc bloc = Get.put(MainPageBloc());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Configs.colorPageBackground,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 60, right: 20, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Rates",
              style: TextStyle(
                  color: Configs.colorTextBlack,
                  fontWeight: FontWeight.w700,
                  fontSize: 48),
            ),
            Expanded(
              child: StreamBuilder<bool>(
                  stream: bloc.updateList,
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemBuilder: (ctx, index) {
                        var item = bloc.data[index];
                        var old = bloc.oldData.firstWhereOrNull(
                            (element) => element.symbol == item.symbol);
                        return CurrencyRowItem(
                          data: item,
                          oldData: old,
                        );
                      },
                      itemCount: bloc.data.length,
                    );
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: StreamBuilder<DateTime>(
                  stream: bloc.lastUpdate.stream,
                  builder: (context, snapshot) {
                    return Text(
                      "Last updated: ${snapshot.data.toString()}",
                      style: const TextStyle(
                          color: Configs.colorTextGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    bloc.getData();
  }
}
