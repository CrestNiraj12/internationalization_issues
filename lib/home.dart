import 'package:flutter/material.dart';
import 'package:internationalization_issues/components/home_card.dart';
import 'package:internationalization_issues/localized_images/localized_images.dart';
import 'package:internationalization_issues/localized_strings/localized_strings.dart';

import 'design_issues/design_issues.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
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
        child: Wrap(
          children: [
            HomeCard(
              image: 'assets/images/string_localize.png',
              title: 'String localization',
              description:
                  'Issues while formatting dates, times, numbers, and currencies.',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LocalizedStrings()));
              },
            ),
            HomeCard(
              image: 'assets/images/image_localize.png',
              title: 'Image localization',
              description:
                  'Images may need to be localized in some cases. For example, an app may need to display different images for different languages or regions.',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LocalizedImages()));
              },
            ),
            HomeCard(
              image: 'assets/images/overflow.png',
              title: 'Design and Layout issues',
              description:
                  'This includes issues occurring in UI due to different languages as languages differ in typography, spacing and text length. The problem can be technical or logical. Logical issue can be occurred according to the design requirements and responsiveness.',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DesignIssues()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
