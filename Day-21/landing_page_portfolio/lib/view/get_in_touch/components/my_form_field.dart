import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../components/my_text_field.dart';
import '../../constans/colors.dart';
import '../../constans/spacing.dart';

class MyFormField extends StatelessWidget {
  const MyFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController messageController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Container(
      height: 530,
      padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 44.0),
      decoration: const BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                MyTextField(
                    label: "Name",
                    hinttext: "Enter your name",
                    textController: nameController,
                    color: kTextFieldColor,
                    lines: 1),
                const SizedBox(height: kDefaultPadding),
                MyTextField(
                    label: "Email",
                    hinttext: "Enter your email",
                    textController: emailController,
                    color: kTextFieldColor,
                    lines: 1),
                const SizedBox(height: kDefaultPadding),
                MyTextField(
                    label: "Message",
                    hinttext: "Type your message",
                    textController: messageController,
                    color: kTextFieldColor,
                    lines: 6),
              ],
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                await sendEmail(
                    name: nameController.text,
                    email: emailController.text,
                    subject: "Email-About-My-Portfolio",
                    message: messageController.text);
              },
              child: Container(
                height: 58,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  gradient: kPrimaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: const Text(
                  "Send message",
                  style: TextStyle(fontSize: 18, color: kTextColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    const serviceID = 'service_dyg5ugk';
    const tempaleteID = 'template_u02m12d';
    const userID = 'jgSd73wOy0Kd02e-V';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'service_id': serviceID,
          'template_id': tempaleteID,
          'user_id': userID,
          'template_params': {
            'user_name': name,
            'subject': subject,
            'message': message,
            'user_email': email,
          }
        },
      ),
    );
    if (kDebugMode) {
      print(response.body);
    }
  }
}
