// To parse this JSON data, do
//
//     final transactionStatusModel = transactionStatusModelFromMap(jsonString);

import 'dart:convert';

TransactionStatusModel transactionStatusModelFromMap(String str) =>
    TransactionStatusModel.fromMap(json.decode(str));

String transactionStatusModelToMap(TransactionStatusModel data) =>
    json.encode(data.toMap());

class TransactionStatusModel {
  TransactionStatusModel({
    required this.amount,
    required this.to,
    required this.from,
    required this.date,
    required this.time,
    required this.status,
  });

  final String amount;
  final String to;
  final String from;
  final String date;
  final String time;
  final String status;

  factory TransactionStatusModel.fromMap(Map<String, dynamic> json) =>
      TransactionStatusModel(
        amount: json["amount"],
        to: json["to"],
        from: json["from"],
        date: json["date"],
        time: json["time"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "to": to,
        "from": from,
        "date": date,
        "time": time,
        "status": status,
      };
}
