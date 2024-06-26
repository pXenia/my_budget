import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_budget/presentation/add_transaction_page.dart';
import 'package:my_budget/presentation/add_wish_page.dart';
import 'package:my_budget/presentation/history_page.dart';
import 'package:my_budget/presentation/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_budget/presentation/wish_page.dart';
import 'app.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) {
          return MainPage(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => HomePage(),
            routes: [
              GoRoute(
                path: 'wish',
                builder: (context, state) => WishPage(),
                routes: [
                  GoRoute(
                    path: 'add',
                    builder: (context, state) => AddWishPage(),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/history',
            builder: (context, state) => HistoryPage(),
            routes: [
              GoRoute(
                path: 'add',
                builder: (context, state) => AddTransactionPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Мой Бюджет',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('ru'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  final Widget child;
  const MainPage({required this.child});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          context.go('/');
          break;
        case 1:
          context.go('/history');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "История",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}