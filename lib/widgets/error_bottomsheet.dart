import 'package:flutter/material.dart';

class ErrorBottomSheet extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final Color color;

  const ErrorBottomSheet({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.error,
    this.color = Colors.red,
  });

  static void show(BuildContext context, int code) {
    String title = "Error";
    String message = "Something went wrong.";
    IconData icon = Icons.error;
    Color color = Colors.red;

    switch (code) {
      case 400:
        title = "Bad Request";
        message = "The request was invalid.";
        break;
      case 401:
        title = "Unauthorized";
        message = "Invalid email or password.";
        break;
      case 403:
        title = "Forbidden";
        message = "You don’t have permission to access this.";
        break;
      case 500:
        title = "Server Error";
        message = "Please try again later.";
        break;
      default:
        title = "Oops!";
        message = "An unexpected error occurred.";
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => ErrorBottomSheet(
        title: title,
        message: message,
        icon: icon,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48, color: color),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
