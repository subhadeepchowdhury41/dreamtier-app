import 'package:dreamtier/pages/home/profile/interests_selector.dart';
import 'package:flutter/material.dart';

Widget interestsSection(BuildContext context, List<String?> interests) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Interests',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600),
        ),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              interests.isNotEmpty
                  ? interests.join(', ')
                  : 'No interests found',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              width: 10,
            ),
            interests.isEmpty
                ? InkWell(
                    borderRadius: BorderRadius.circular(13),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const InterestsSelector()));
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 2),
                        child: const Text(
                          'Add interests',
                          style: TextStyle(color: Colors.blue),
                        )))
                : InkWell(
                    borderRadius: BorderRadius.circular(13),
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 2),
                        child: const Text(
                          'Edit interests',
                          style: TextStyle(color: Colors.blue),
                        )))
          ],
        ),
      ),
    ],
  );
}
