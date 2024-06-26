import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_budget/presentation/state/transaction_store.dart';
import 'package:go_router/go_router.dart';
import '../data/models/transaction_model.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  String _transactionName = '';
  double _transactionCost = 0.0;
  bool _isIncome = true;
  DateTime _selectedDate = DateTime.now();

  final TransactionStore transactionStore = GetIt.instance<TransactionStore>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      locale: const Locale('ru'),
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xffd2d9ec),
      appBar: AppBar(
        backgroundColor: const Color(0xffd2d9ec),
        title: const Text(
          'Добавить транзакцию',
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
                height: screenHeight * 0.4,
                fit: BoxFit.cover,
              ),
              Row(
                children: [
                  Text(
                    'Дата: ${DateFormat("dd.MM.yyyy").format(_selectedDate)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Название'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите название';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _transactionName = value!;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Сумма'),
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
                        _transactionCost = double.parse(value!);
                      },
                    ),
                    DropdownButtonFormField<bool>(
                      decoration: const InputDecoration(labelText: 'Тип'),
                      value: _isIncome,
                      items: const [
                        DropdownMenuItem(
                          value: true,
                          child: Text('Доходы'),
                        ),
                        DropdownMenuItem(
                          value: false,
                          child: Text('Расходы'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _isIncome = value!;
                        });
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
        child: const Icon(Icons.done),
      ),
    );
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newTransaction = TransactionModel(
        id: transactionStore.nextId,
        name: _transactionName,
        date: _selectedDate,
        isIncome: _isIncome,
        cost: _transactionCost,
      );
      await transactionStore.createTransaction(newTransaction);
      context.pop();
    }
  }
}