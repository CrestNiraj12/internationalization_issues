import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:internationalization_issues/components/locale_changer.dart';

class LocalizedImages extends StatefulWidget {
  const LocalizedImages({Key? key}) : super(key: key);

  @override
  State<LocalizedImages> createState() => _LocalizedImagesState();
}

class _LocalizedImagesState extends State<LocalizedImages>
    with AutomaticKeepAliveClientMixin<LocalizedImages> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    String locale = context.locale.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Localized Images',
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
              'Images may need to be localized in some cases. For example, an app may need to display different images for different languages or regions.',
              style:
                  Theme.of(context).textTheme.headline6?.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 25,
            ),
            Image.asset(
              'assets/images/$locale.jpg',
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
