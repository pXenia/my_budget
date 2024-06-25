import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../data/models/wish_model.dart';
import '../state/wish_store.dart';

class WishWidget extends StatefulWidget {
  final WishModel wish;

  WishWidget({required this.wish});

  @override
  _WishWidgetState createState() => _WishWidgetState();
}

class _WishWidgetState extends State<WishWidget> {
  late bool _isDone;
  final WishStore wishStore = GetIt.instance<WishStore>();

  @override
  void initState() {
    super.initState();
    _isDone = widget.wish.isDone;
  }

  void _toggleCompletion(bool? value) async {
    if (value != null) {
      setState(() {
        _isDone = value;
      });
      widget.wish.isDone = _isDone;
      await wishStore.updateWishIsDone(widget.wish);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: _isDone,
            onChanged: _toggleCompletion,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.wish.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _isDone ? Colors.grey : Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${widget.wish.cost.toStringAsFixed(0)} RUB',
                      style: TextStyle(
                        fontSize: 16,
                        color: _isDone ? Colors.grey : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}