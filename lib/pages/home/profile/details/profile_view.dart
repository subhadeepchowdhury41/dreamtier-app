import 'package:dreamtier/components/profile/bio_widgets.dart';
import 'package:dreamtier/components/profile/interests_widget.dart';
import 'package:dreamtier/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileViewScreen extends ConsumerStatefulWidget {
  const ProfileViewScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileViewScreenState();
}

class _ProfileViewScreenState extends ConsumerState<ProfileViewScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        user!.image ?? 'https://picsum.photos/200'),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 7,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(user.name ?? 'User',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            user.email ?? 'No email address found',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis),
                          ),
                        )
                      ]),
                ),
                Expanded(
                    flex: 2,
                    child: IconButton(
                        iconSize: 27,
                        onPressed: () {},
                        icon: const Icon(Icons.edit)))
              ])),
          const SizedBox(height: 20),
          bioSection(context, user.bio, user.id),
          const SizedBox(height: 10),
          const Divider(thickness: 0.5),
          const SizedBox(height: 10),
          interestsSection(context, user.interests),
          const SizedBox(height: 10),
          const Divider(thickness: 0.5),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
