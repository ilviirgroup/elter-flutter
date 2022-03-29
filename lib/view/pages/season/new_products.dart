import 'package:flutter/material.dart';

class NewProducts extends StatelessWidget {
  const NewProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.yellow),
          onPressed: () {},
          child: const Text('Next screen'),
        ),
      ),
    );
  }
}
