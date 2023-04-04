import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RowOverflow extends StatelessWidget {
  const RowOverflow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1. Preventing overflow in row',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          '1.1 Using Expanded',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              tr("Hello I am Text 1"),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  elevation: 0,
                ),
                child: Text(
                  tr("Button Text"),
                ),
              ),
            ),
          ],
        ),
        Text(
          '1.2 Using Wrap',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14),
        ),
        const SizedBox(
          height: 15,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              tr("Hello I am Text 1"),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                elevation: 0,
              ),
              child: Text(
                tr("Button Text"),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '1.3 Using Constraints',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              tr("Hello I am Text 1"),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: min(MediaQuery.of(context).size.width / 3, 130)),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  elevation: 0,
                ),
                child: Text(
                  tr("Button Text"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
