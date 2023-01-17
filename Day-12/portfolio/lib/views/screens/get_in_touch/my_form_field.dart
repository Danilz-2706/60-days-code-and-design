import 'package:flutter/material.dart';
import 'package:portfolio/views/constans/spacing.dart';

import '../../components/my_text_field.dart';
import '../../constans/colors.dart';

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
              onTap: () {},
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
}
