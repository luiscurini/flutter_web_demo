import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(
        builder: (context) {
          return const Text(
            'Something went wrong',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          );
        },
      ),
    );
  }
}
