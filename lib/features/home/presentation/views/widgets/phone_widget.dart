import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holly_quran/core/extension/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/resources/values_manager.dart';

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({super.key, required this.phone});
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.s16),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: AppSize.s8),
            child: Text(
              phone.toFormattedPhone(),
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () async {
                      final url = 'https://wa.me/$phone';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      }
                    },
                    child: const Icon(FontAwesomeIcons.whatsapp,
                        color: Colors.green, size: 36),
                  ),
                  Text("مراسلة")
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () async {
                      final uri = Uri.parse('tel:$phone');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    },
                    child: const Icon(Icons.call_outlined,
                        color: Colors.green, size: 36),
                  ),
                  Text("اتصال"),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
