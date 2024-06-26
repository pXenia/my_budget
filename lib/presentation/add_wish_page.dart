import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_budget/presentation/state/wish_store.dart';
import '../data/models/wish_model.dart';
import 'package:go_router/go_router.dart';

class AddWishPage extends StatefulWidget {
  @override
  _AddWishPageState createState() => _AddWishPageState();
}

class _AddWishPageState extends State<AddWishPage> {
  final _formKey = GlobalKey<FormState>();
  String _wishName = '';
  double _wishCost = 0.0;

  final WishStore wishStore = GetIt.instance<WishStore>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xffd2d9ec),
      appBar: AppBar(
        backgroundColor: Color(0xffd2d9ec),
        title: const Text(
          'Добавить желание',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                'assets/personal_finance.png',
                width: double.infinity,
                height: screenHeight * 0.5,
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
                      decoration: InputDecoration(labelText: 'Сумма'),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveForm,
        child: Icon(Icons.done),
      ),
    );
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newWish = WishModel(
        id: wishStore.nextId,
        name: _wishName,
        cost: _wishCost,
        isDone: false,
      );
      await wishStore.createWish(newWish);
      context.pop();
    }
  }
}
