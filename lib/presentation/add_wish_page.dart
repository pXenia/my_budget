import 'package:flutter/material.dart';
import 'package:my_budget/presentation/wish_page.dart';

class AddWishScreen extends StatefulWidget {
  @override
  _AddWishScreenState createState() => _AddWishScreenState();
}

class _AddWishScreenState extends State<AddWishScreen> {
  final _formKey = GlobalKey<FormState>();
  String _wishName = '';
  double _wishCost = 0.0;
  bool _progress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd2d9ec),
      appBar: AppBar(
        backgroundColor: Color(0xffd2d9ec),
        title: Text(
          'Добавить желание',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/personal_finance.png',
              width: double.infinity,
              height: 380,
              fit: BoxFit.cover,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Название'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите название';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _wishName = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Стоимость'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите стоимость';
                      }
                      try {
                        double.parse(value);
                      } catch (_) {
                        return 'Пожалуйста, введите правильное значение';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _wishCost = double.parse(value!);
                    },
                  ),
                  DropdownButtonFormField<bool>(
                    decoration: InputDecoration(labelText: 'Статус'),
                    value: _progress,
                    items: [
                      DropdownMenuItem(
                        value: false,
                        child: Text('Не выполнено'),
                      ),
                      DropdownMenuItem(
                        value: true,
                        child: Text('Выполнено'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _progress = value!;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  // Кнопка для сохранения формы
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffb6bfdb),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddWishScreen(),
              ));
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
