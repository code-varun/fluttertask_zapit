import 'package:crypto_app/GlobalModels/user_model_bloc/user_model_bloc.dart';
import 'package:crypto_app/Home/Screens/HomePage/floor_bloc/floor_database_bloc.dart';
import 'package:crypto_app/Home/Screens/Wallet/view/wallet_transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Home/home_view.dart';

Future initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
}

void main() {
  initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserModelBloc>(
          create: (BuildContext context) => UserModelBloc(),
        ),
        BlocProvider<FloorDatabaseBloc>(
          create: (BuildContext context) => FloorDatabaseBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyFlutterApp(),
      ),
    );
  }
}

class MyFlutterApp extends StatefulWidget {
  const MyFlutterApp({Key? key}) : super(key: key);

  @override
  State<MyFlutterApp> createState() => _MyFlutterAppState();
}

class _MyFlutterAppState extends State<MyFlutterApp> {
  @override
  void initState() {
    // TODO: implement initState
    addTransactionToDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Homelanding(menuScreenContext: context));
  }

  Future<void> addTransactionToDB() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    var walletTransactionModelDao = database.walletTransactionModelDao;

    List<WalletTransactionModel> trxLs = [
      WalletTransactionModel(
        title: "abcdef",
        subTitle: "mnnz",
        amount: 12,
      ),
      WalletTransactionModel(
        title: "abcdef",
        subTitle: "mnnz",
        amount: 24,
      ),
      WalletTransactionModel(
        title: "abcdef",
        subTitle: "mnnz",
        amount: -14,
      ),
      WalletTransactionModel(
        title: "abcdef",
        subTitle: "mnnz",
        amount: 5,
      ),
      WalletTransactionModel(
        title: "abcdef",
        subTitle: "mnnz",
        amount: -33,
      )
    ];
    await walletTransactionModelDao.insertWalletTransactions(trxLs);

    BlocProvider.of<FloorDatabaseBloc>(context)
        .add(onFloorDatabaseAddedEvent(database: database));
  }
}
