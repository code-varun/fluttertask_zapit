import 'dart:convert';

List<CryptoListModel> cryptoListModelFromJson(String str) =>
    List<CryptoListModel>.from(
        json.decode(str).map((x) => CryptoListModel.fromJson(x)));

String cryptoListModelToJson(List<CryptoListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CryptoListModel {
  CryptoListModel({
    required this.id,
    required this.symbol,
    required this.name,
  });

  final String id;
  final String symbol;
  final String name;

  factory CryptoListModel.fromJson(Map<String, dynamic> json) =>
      CryptoListModel(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
      };
}
