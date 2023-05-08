import 'package:eiboard_flutter/pages/components/page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UsefulLinksScreen extends StatelessWidget {
  const UsefulLinksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri dhbwHomePageLink =
        Uri.parse('https://www.karlsruhe.dhbw.de/startseite.html');
    final Uri dualisLink = Uri.parse('https://dualis.dhbw.de/');
    final Uri moodleLink = Uri.parse('https://moodle.dhbw.de/');
    final Uri swLink = Uri.parse('https://www.sw-ka.de/de/');

    return PageBackground(
        topic: 'Useful Links',
        showPlusIcon: false,
        child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    buildLinkText(
                        linkText: 'DHBW Homepage', link: dhbwHomePageLink),
                    const SizedBox(
                      height: 30,
                    ),
                    buildLinkText(linkText: 'Dualis', link: dualisLink),
                    const SizedBox(
                      height: 30,
                    ),
                    buildLinkText(linkText: 'Moodle', link: moodleLink),
                    const SizedBox(
                      height: 30,
                    ),
                    buildLinkText(linkText: 'Studierendenwerk', link: swLink),
                  ]),
            )));
  }

  buildLinkText({required String linkText, required Uri link}) {
    return TextButton(
        onPressed: () {
          launchURL(link);
        },
        child: Text(
          linkText,
          style: const TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
        ));
  }

  void launchURL(Uri link) async {
    if (await canLaunchUrl(link)) {
      await launchUrl(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}
