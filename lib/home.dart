import 'package:flutter/material.dart';
import 'package:internationalization_issues/localized_images/localized_images.dart';
import 'package:internationalization_issues/localized_strings/localized_strings.dart';

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
                }),
          ],
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  final String image;
  final String title;
  final String description;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 180,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
