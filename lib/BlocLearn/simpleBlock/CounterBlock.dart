import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CounterViewModel.dart';

class CounterBlock extends StatefulWidget {
  CounterBlock({Key? key}) : super(key: key);

  @override
  _CounterBlockState createState() => _CounterBlockState();
}

class _CounterBlockState extends State<CounterBlock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: BlocBuilder<CounterViewModel, int>(
        builder: (BuildContext context, int count) {
          return Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                debugPrint("add");
                context.read<CounterViewModel>().add(CounterIncrementPressed());
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                context.read<CounterViewModel>().add(CounterDecrementPressed());
              },
            ),
          ),
        ],
      ),
    );
  }
}
