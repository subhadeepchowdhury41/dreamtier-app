import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  const CustomDatePicker({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: _selectedDate ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null && picked != _selectedDate) {
              setState(() {
                _selectedDate = picked;
              });
              widget.controller.text = DateFormat('dd-MM-yyyy').format(picked);
            }
          },
          validator: (value) =>
              _selectedDate == null ? 'Choose your Date of Birth' : null,
          decoration: InputDecoration(
            hintText: widget.label,
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 17, 1, 66),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 9, 2, 30),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


// InputDecorator(
//               decoration: const InputDecoration(
//                 border: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color.fromARGB(255, 9, 2, 30),
//                   ),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 4.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       _selectedDate != null
//                           ? DateFormat('dd-MM-yyyy').format(_selectedDate!)
//                           : widget.label,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color:
//                             _selectedDate != null ? Colors.black : Colors.black,
//                       ),
//                     ),
//                     const Icon(Icons.calendar_today),
//                   ],
//                 ),
//               ),
//             ),