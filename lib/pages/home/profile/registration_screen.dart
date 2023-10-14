import 'package:dreamtier/components/ui/custom_date_picker.dart';
import 'package:dreamtier/components/ui/custom_textfield.dart';
import 'package:dreamtier/pages/home/profile/personal_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                splashRadius: 40,
                iconSize: 34,
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              IconButton(
                  splashRadius: 40,
                  iconSize: 34,
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios))
            ],
          ),
        ),
        body: const PersonalDetails());
  }
}
