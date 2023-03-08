class RateModel {
  String? symbol;
  num? price;

  RateModel({
    this.symbol,
    this.price,
  });

  RateModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    price = json['price'];
  }
}
