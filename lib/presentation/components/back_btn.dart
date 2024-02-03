import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
    );
  }
}
