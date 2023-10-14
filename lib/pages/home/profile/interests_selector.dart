import 'package:flutter/material.dart';

class InterestsSelector extends StatefulWidget {
  const InterestsSelector({Key? key}) : super(key: key);
  @override
  State<InterestsSelector> createState() => _InterestsSelectorState();
}

class _InterestsSelectorState extends State<InterestsSelector> {
  final List<String> _fields = [
    'Technology',
    'Sports',
    'Music',
    'Art',
    'Food',
    'Travel',
    'Fashion',
    'Fitness',
    'Books',
    'Movies',
  ];

  final List<String> _selectedFields = [];

  void _toggleField(String field) {
    setState(() {
      if (_selectedFields.contains(field)) {
        _selectedFields.remove(field);
      } else if (_selectedFields.length < 5) {
        _selectedFields.add(field);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            padding: const EdgeInsets.all(23.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select up to 5 fields of interest:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: _fields.map((field) {
                    final isSelected = _selectedFields.contains(field);
                    return FilterChip(
                      label: Text(field),
                      selected: isSelected,
                      onSelected: (_) => _toggleField(field),
                      selectedColor: Theme.of(context).primaryColor,
                      checkmarkColor: Colors.white,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : null,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Selected fields:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: _selectedFields.map((field) {
                    return Chip(
                      label: Text(field),
                      onDeleted: () => _toggleField(field),
                    );
                  }).toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
