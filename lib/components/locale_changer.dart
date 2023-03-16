import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internationalization_issues/components/bloc/locale_cubit.dart';

class LocaleChanger extends StatelessWidget {
  const LocaleChanger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text('Locale:'),
          const SizedBox(
            width: 10,
          ),
          DropdownButton<String>(
            value: context.locale.toString(),
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 14,
            ),
            underline: Container(
              height: 2,
              color: Colors.blue,
            ),
            onChanged: (String? value) =>
                context.setLocale(Locale(value ?? 'en')),
            items: context.supportedLocales.map((Locale locale) {
              return DropdownMenuItem<String>(
                value: locale.toString(),
                child: Text('$locale'),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}