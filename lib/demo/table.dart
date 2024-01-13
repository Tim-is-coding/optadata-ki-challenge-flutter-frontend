import 'package:flutter/material.dart';

class TableExample extends StatelessWidget {
  const TableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Example'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          children: [
            TableRowWidget(rowItems: ['Item 1', 'Item 2', 'Item 3']),
            TableRowWidget(rowItems: ['Item 4', 'Item 5', 'Item 6']),
            TableRowWidget(rowItems: ['Item 7', 'Item 8']),
            TableRowWidget(rowItems: ['Item 9']),
          ],
        ),
      ),
    );
  }
}

class TableRowWidget extends StatelessWidget {
  final List<String> rowItems;

  const TableRowWidget({super.key, required this.rowItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: rowItems.map((item) => Expanded(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Text(item),
        ),
      )).toList(),
    );
  }
}


