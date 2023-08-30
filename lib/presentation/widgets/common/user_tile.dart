import 'package:flutter/material.dart';
import 'package:homelist/models/user/user.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.userData,
    this.displayName = true,
  });

  final UserData userData;
  final bool displayName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: Image.network(
              userData.avatarImage ??
                  'https://png.pngtree.com/png-vector/20220709/ourmid/pngtree-businessman-user-avatar-wearing-suit-with-red-tie-png-image_5809521.png',
            ).image,
          ),
          if (displayName) ...[
            const SizedBox(
              height: 10,
            ),
            Text(userData.firstName)
          ],
        ],
      ),
    );
  }
}
