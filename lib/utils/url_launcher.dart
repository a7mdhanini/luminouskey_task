import 'package:url_launcher/url_launcher.dart';

class URLLauncherClass {
  ///////////////////
  ///Launching Url///
  ///////////////////
  static Future<void> luanchUrl(String path) async {
    String newPath = path.substring(8);
    final Uri params = Uri(
      scheme: 'https',
      path: newPath,
    );
    Uri url = params;

    if (await canLaunchUrl(url).then((value) => true)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ////////////////
  ///Send Email///
  ////////////////
  static Future<void> sendEmail(String path) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: path,
      query:
          'subject=App Feedback&body=App Version 3.23', //add subject and body here
    );

    Uri url = params;
    if (await canLaunchUrl(url).then((value) => true)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ///////////////////
  ////Phone Call/////
  ///////////////////
  static Future<void> phoneCall(String number) async {
    Uri uri = Uri.parse('tel:$number');

    if (await canLaunchUrl(uri).then((value) => true)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  //////////////
  ///Open Map///
  //////////////
  static Future<void> openMap(String latitude, String longitude) async {
    Uri uri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    if (await canLaunchUrl(uri).then((value) => true)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
