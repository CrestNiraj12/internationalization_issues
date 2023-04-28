import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:internationalization_issues/components/locale_changer.dart';
import 'package:nepali_utils/nepali_utils.dart';

Map<String, String> symbols = {
  'en': '\$',
  'ja': '円',
  'hi': '₹',
  'fr': '€',
  'ne': 'रु',
};

class RTLSupport extends StatefulWidget {
  const RTLSupport({Key? key}) : super(key: key);

  @override
  State<RTLSupport> createState() => _RTLSupportState();
}

class _RTLSupportState extends State<RTLSupport> {
  @override
  Widget build(BuildContext context) {
    String locale = context.locale.toString();
    String currentDateTime =
        DateFormat('MMMM d, y hh:mm:ss a', locale).format(DateTime.now());
    String currentNepaliDateTime =
        NepaliDateFormat('MMMM d, y hh:mm:ss a').format(NepaliDateTime.now());

    String numberFormat =
        NumberFormat.decimalPattern(locale).format(119221.123);
    String nepaliNumberFormat = NepaliNumberFormat().format(119221.123);

    String currencyFormat = NumberFormat.currency(
      locale: locale,
      symbol: symbols[locale],
    ).format(121229221.123);
    String nepaliCurrencyFormat = NepaliNumberFormat(
      symbol: symbols[locale],
      isMonetory: true,
    ).format(121229221.123);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RTL Support',
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
              textDirection: ui.TextDirection.ltr,
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
                  '${tr('Current DateTime')}: ${locale == 'ne' ? currentNepaliDateTime : currentDateTime}',
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
                  locale == 'ne' ? nepaliNumberFormat : numberFormat,
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
                  locale == 'ne' ? nepaliCurrencyFormat : currencyFormat,
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
