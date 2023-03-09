import 'dart:async';
import 'dart:convert';

import 'package:currency_rate_challange/bloc/bloc_base.dart';
import 'package:currency_rate_challange/data/models/rate_model.dart';
import 'package:currency_rate_challange/data/remote/api_helper.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class MainPageBloc extends BlocBase {
  final _updateList = PublishSubject<bool>();

  Stream<bool> get updateList => _updateList.stream;

  var lastUpdate = DateTime.now().obs;

  List<RateModel> data = [];
  List<RateModel> oldData = [];

  late Timer timer;

  @override
  void onInit() {
    super.onInit();

    timer = Timer.periodic(const Duration(seconds: 10), (t) {
      updateData();
    });
  }

  Future<void> getData() async {
    try {
      showLoading();

      var res = await ApiHelper().getRates();
      var json = jsonDecode(res);

      data.clear();

      for (var item in json["rates"]) {
        var rate = RateModel.fromJson(item);
        data.add(rate);
      }

      _updateList.sink.add(true);
      lastUpdate.value = DateTime.now();

      hideLoading();
    } catch (x) {
      print(x);
      hideLoading();
    }
  }

  Future<void> updateData() async {
    try {
      var res = await ApiHelper().getRates();
      var json = jsonDecode(res);

      oldData.clear();
      oldData.addAll(data);
      data.clear();

      for (var item in json["rates"]) {
        var rate = RateModel.fromJson(item);
        data.add(rate);
      }

      _updateList.sink.add(true);
      lastUpdate.value = DateTime.now();
    } catch (x) {
      print(x);
    }
  }
}
