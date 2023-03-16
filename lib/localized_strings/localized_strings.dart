import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:internationalization_issues/components/locale_changer.dart';

Map<String, String> symbols = {
  'en': '\$',
  'ja': '円',
  'hi': '₹',
  'fr': '€',
  'ne': 'रु',
};

class LocalizedStrings extends StatefulWidget {
  const LocalizedStrings({Key? key}) : super(key: key);

  @override
  State<LocalizedStrings> createState() => _LocalizedStringsState();
}

class _LocalizedStringsState extends State<LocalizedStrings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Localized Strings',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontSize: 18,
                color: Colors.white,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 20.0,
        ),
        child: Column(
          children: [
            const LocaleChanger(),
            Text(
              'Solution for issues while formatting dates, times, numbers, and currencies',
              style:
                  Theme.of(context).textTheme.headline6?.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 25,
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Text(
                  '1. DateTime Localization',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${tr('Current DateTime')}: ${DateFormat('MMMM d, y hh:mm:ss a', context.locale.toString()).format(DateTime.now())}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 13),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '2. Number Localization',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  NumberFormat.decimalPattern(context.locale.toString())
                      .format(19221.123),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 13),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '3. Currency Localization',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  NumberFormat.currency(
                    locale: context.locale.toString(),
                    symbol: symbols[context.locale.toString()],
                  ).format(121229221.123),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 13),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
