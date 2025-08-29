import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  final String userEmail;
  final VoidCallback logoutCallback;

  const ProfileTab({super.key, required this.userEmail, required this.logoutCallback});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 48,
              child: Icon(Icons.person, size: 64),
            ),
            const SizedBox(height: 16),
            Text(
              userEmail,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: logoutCallback,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                iconColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
