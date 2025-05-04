import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holly_quran/core/extension/extensions.dart';
import 'package:holly_quran/core/resources/app_assets.dart';
import 'package:holly_quran/core/resources/app_colors.dart';
import 'package:holly_quran/core/resources/app_constants.dart';
import 'package:holly_quran/core/resources/app_fonts.dart';
import 'package:holly_quran/core/resources/app_strings.dart';
import 'package:holly_quran/core/resources/values_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsViewBody extends StatefulWidget {
  const ContactUsViewBody({super.key});

  @override
  State<ContactUsViewBody> createState() => _ContactUsViewBodyState();
}

class _ContactUsViewBodyState extends State<ContactUsViewBody> {
  final TextEditingController _messageController = TextEditingController();
  bool _formValid = false;

  void _validateForm() {
    setState(() {
      _formValid = _messageController.text.isNotEmpty;
    });
  }

  void _submitForm() async {
    final message = _messageController.text.trim();
    const String phone = AppConstants.whatsPhone;
    final url = 'whatsapp://send?phone=$phone&text=${Uri.parse(message)}';
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.background),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: context.height * 0.25,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.s20),
                        child: Image.asset(
                          "assets/images/icon.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.s20),
                        child: Image.asset(
                          "assets/images/mawasem_logo.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSize.s8),
            const Text(
              AppStrings.contactTitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: FontSize.s17),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "تابعنا على وسائل التواصل الاجتماعي:",
                style: TextStyle(
                  fontSize: FontSize.s15,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: AppSize.s16),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: AppSize.s20,
              runSpacing: AppSize.s16,
              children: [
                _buildSocialIcon("واتساب", FontAwesomeIcons.whatsapp,
                    AppConstants.whatsPhone,
                    isWhatsApp: true),
                _buildSocialIcon("فيسبوك", FontAwesomeIcons.facebook,
                    "https://www.facebook.com/maasi.hajj"),
                // _buildSocialIcon(
                //     "تويتر", FontAwesomeIcons.twitter, "https://twitter.com/"),
                // _buildSocialIcon("انستغرام", FontAwesomeIcons.instagram,
                //     "https://instagram.com/"),
              ],
            ),
            const SizedBox(height: AppSize.s10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppStrings.sendWhats,
                style: TextStyle(
                    fontSize: FontSize.s15,
                    color: AppColors.red,
                    decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: AppSize.s8),
            TextField(
              controller: _messageController,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: AppStrings.contactMessage,
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => _validateForm(),
            ),
            const SizedBox(height: AppSize.s8),
            SizedBox(
              height: AppSize.s50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _formValid ? _submitForm : null,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(WidgetState.disabled)) {
                        return AppColors.grey;
                      }
                      return AppColors.primary;
                    },
                  ),
                ),
                child: Text(
                  AppStrings.sendNow,
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Build a social media contact icon
Widget _buildSocialIcon(String label, IconData fontAwesomeIcons, String url,
    {bool isWhatsApp = false}) {
  return GestureDetector(
    onTap: () async {
      final launchUrlStr = isWhatsApp ? 'whatsapp://send?phone=$url' : url;
      if (await canLaunchUrl(Uri.parse(launchUrlStr))) {
        await launchUrl(Uri.parse(launchUrlStr),
            mode: LaunchMode.externalApplication);
      }
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
          ),
          child: FaIcon(fontAwesomeIcons, color: Colors.green, size: 40),
        ),
        const SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 13)),
      ],
    ),
  );
}
