import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_budget/presentation/history_page.dart';
import 'package:my_budget/presentation/home_page.dart';
import 'package:my_budget/presentation/state/transaction_store.dart';

import 'data/data_sources/local/database.dart';
import 'app.dart' as di;
import 'data/repositories/transaction_repository_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final hiveDatabase = Database();
  await hiveDatabase.init();

  GetIt.instance.registerSingleton<Database>(hiveDatabase);
  GetIt.instance.registerSingleton<TransactionRepository>(TransactionRepository(hiveDatabase));
  GetIt.instance.registerSingleton<TransactionStore>(TransactionStore());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(),
          HistoryPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Главная"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "История"
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
