import 'package:flutter/material.dart';

Widget bioSection(BuildContext context, String? bio, String? userId) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Bio',
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
              bio ?? 'No bio found',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              width: 10,
            ),
            bio == null
                ? InkWell(
                    borderRadius: BorderRadius.circular(13),
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 2),
                        child: const Text(
                          'Add bio',
                          style: TextStyle(color: Colors.blue),
                        )))
                : InkWell(
                    borderRadius: BorderRadius.circular(13),
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 2),
                        child: const Text(
                          'Edit bio',
                          style: TextStyle(color: Colors.blue),
                        )))
          ],
        ),
      ),
    ],
  );
}