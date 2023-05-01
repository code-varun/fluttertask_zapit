// To parse this JSON data, do
//
//     final marketCounStatusModel = marketCounStatusModelFromMap(jsonString);

import 'dart:convert';

MarketCounStatusModel marketCounStatusModelFromMap(String str) =>
    MarketCounStatusModel.fromMap(json.decode(str));

String marketCounStatusModelToMap(MarketCounStatusModel data) =>
    json.encode(data.toMap());

class MarketCounStatusModel {
  MarketCounStatusModel({
    required this.name,
    required this.currentPrice,
    required this.unit,
    required this.yesterdayClosingPrice,
  });

  final String name;
  final String currentPrice;
  final String unit;
  final String yesterdayClosingPrice;

  factory MarketCounStatusModel.fromMap(Map<String, dynamic> json) =>
      MarketCounStatusModel(
        name: json["name"],
        currentPrice: json["currentPrice"],
        unit: json["unit"],
        yesterdayClosingPrice: json["yesterdayClosingPrice"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "currentPrice": currentPrice,
        "unit": unit,
        "yesterdayClosingPrice": yesterdayClosingPrice,
      };
}
