// To parse this JSON data, do
//
//     final marketCoinModel = marketCoinModelFromJson(jsonString);

import 'dart:convert';

List<MarketCoinModel> marketCoinModelFromJson(String str) =>
    List<MarketCoinModel>.from(
        json.decode(str).map((x) => MarketCoinModel.fromJson(x)));

String marketCoinModelToJson(List<MarketCoinModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MarketCoinModel {
  MarketCoinModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    required this.roi,
    required this.lastUpdated,
  });

  final String id;
  final String symbol;
  final String name;
  final String image;
  final double? currentPrice;
  final int? marketCapRank;
  final dynamic? fullyDilutedValuation;
  final dynamic? totalVolume;
  final double? high24H;
  final double? low24H;
  final double? priceChange24H;
  final double? priceChangePercentage24H;
  final double? marketCapChange24H;
  final double? marketCapChangePercentage24H;
  final double? circulatingSupply;
  final double? totalSupply;
  final dynamic? maxSupply;
  final double? ath;
  final double athChangePercentage;
  final DateTime? athDate;
  final double? atl;
  final double atlChangePercentage;
  final DateTime? atlDate;
  final dynamic? roi;
  final DateTime? lastUpdated;

  factory MarketCoinModel.fromJson(Map<String, dynamic> json) =>
      MarketCoinModel(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"],
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation: json["fully_diluted_valuation"],
        totalVolume: json["total_volume"],
        high24H: json["high_24h"],
        low24H: json["low_24h"],
        priceChange24H: json["price_change_24h"],
        priceChangePercentage24H: json["price_change_percentage_24h"],
        marketCapChange24H: json["market_cap_change_24h"],
        marketCapChangePercentage24H: json["market_cap_change_percentage_24h"],
        circulatingSupply: json['circulating_supply'] != null
            ? (json['circulating_supply'] as double?)?.toDouble()
            : null,
        totalSupply: json["total_supply"],
        maxSupply: json["max_supply"],
        ath: json["ath"],
        athChangePercentage: json["ath_change_percentage"],
        athDate: json["ath_date"] == null
            ? null
            : DateTime.parse(json["ath_date"] as String),
        atl: json["atl"],
        atlChangePercentage: json["atl_change_percentage"],
        atlDate:
            json["atl_date"] == null ? null : DateTime.parse(json["atl_date"]),
        roi: json["roi"],
        lastUpdated: json["last_updated"] == null
            ? null
            : DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "market_cap_rank": marketCapRank,
        "fully_diluted_valuation": fullyDilutedValuation,
        "total_volume": totalVolume,
        "high_24h": high24H,
        "low_24h": low24H,
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        "ath": ath,
        "ath_change_percentage": athChangePercentage,
        "ath_date": athDate?.toIso8601String(),
        "atl": atl,
        "atl_change_percentage": atlChangePercentage,
        "atl_date": atlDate?.toIso8601String(),
        "roi": roi,
        "last_updated": lastUpdated?.toIso8601String(),
      };
}
