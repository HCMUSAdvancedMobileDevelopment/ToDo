import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/generated/l10n.dart';

class EmptyAnimation extends StatelessWidget {
  const EmptyAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/animations/checklist.gif", width: 100),
        Text(
          S.current.empty.toUpperCase(),
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }
}