import 'package:dreamtier/components/ui/custom_date_picker.dart';
import 'package:dreamtier/components/ui/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalDetails extends ConsumerStatefulWidget {
  const PersonalDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PersonalDetailsState();
}

class _PersonalDetailsState extends ConsumerState<PersonalDetails> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 834 / 667,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/headfinal.png'),
                fit: BoxFit.cover,
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _phoneController,
                    label: 'Enter your Phone',
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please enter your phone';
                      }
                      if (RegExp('[0-9]').hasMatch(val) == false) {
                        return 'Please enter a valid phone';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomDatePicker(
                    label: 'Enter your Date of Birth',
                    controller: _dobController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      controller: _pincodeController,
                      label: 'Enter your Pincode',
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter your pincode';
                        }
                        if (RegExp(r'^\d{6}$').hasMatch(val) == false) {
                          return 'Please enter a valid pincode';
                        }
                        return null;
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
