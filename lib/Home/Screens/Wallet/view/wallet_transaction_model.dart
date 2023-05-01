import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'wallet_transaction_model.g.dart';

@entity
class WalletTransactionModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String title;
  final String subTitle;
  final double amount;

  WalletTransactionModel({
    this.id,
    required this.title,
    required this.subTitle,
    required this.amount,
  });

  WalletTransactionModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        subTitle = res["subTitle"],
        amount = res["amount"];

  Map<String, Object?> toMap() {
    return {'id': id, 'title': title, 'subTitle': subTitle, 'amount': amount};
  }
}

@dao
abstract class WalletTransactionModelDao {
  @Query('SELECT * FROM WalletTransactionModel')
  Future<List<WalletTransactionModel>> findAllWalletTransactions();

  @Query('SELECT * FROM WalletTransactionModel WHERE id = :id')
  Stream<WalletTransactionModel?> findWalletTransactionById(int id);

  @insert
  Future<void> insertWalletTransaction(
      WalletTransactionModel walletTransaction);

  @insert
  Future<void> insertWalletTransactions(List<WalletTransactionModel> tasks);
}

@Database(version: 1, entities: [WalletTransactionModel])
abstract class AppDatabase extends FloorDatabase {
  WalletTransactionModelDao get walletTransactionModelDao;
}
