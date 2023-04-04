import 'package:flutter/material.dart';
import 'package:internationalization_issues/components/locale_changer.dart';
import 'package:internationalization_issues/components/test_card.dart';
import 'package:internationalization_issues/design_issues/row_overflow.dart';

class DesignIssues extends StatefulWidget {
  const DesignIssues({Key? key}) : super(key: key);

  @override
  State<DesignIssues> createState() => _DesignIssuesState();
}

class _DesignIssuesState extends State<DesignIssues> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Design and Layout issues',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontSize: 18,
                color: Colors.white,
              ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 30.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const RowOverflow(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '2. Preventing card height difference',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Use height or hide text overflow using ellipsis with maxLines in text style. In this example, I have used height in description and maxLines 1 and overflow ellipsis in title.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: const [
                      TestCard(
                        image: 'assets/images/test.jpg',
                        title: 'Test Card 1',
                        description: 'Test Card',
                      ),
                      TestCard(
                        image: 'assets/images/test.jpg',
                        title: 'Test Card double line',
                        description: 'Testing double line description',
                      ),
                      TestCard(
                        image: 'assets/images/test.jpg',
                        title:
                            'Test Card 3 multi line title is here overflowing',
                        description:
                            'Testing multi line description which will change card height',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              color: Colors.grey[50],
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 10.0,
                bottom: 0,
              ),
              width: MediaQuery.of(context).size.width,
              child: const LocaleChanger(),
            ),
          ),
        ],
      ),
    );
  }
}
