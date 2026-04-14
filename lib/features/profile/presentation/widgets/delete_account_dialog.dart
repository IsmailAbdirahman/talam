import 'package:flutter/material.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete Account'),
      content: Text(
        'This will permanently delete your account, saved posts, and all your data. This action cannot be undone.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // delete account logic
          },
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          child: Text('Delete Forever'),
        ),
      ],
    );
  }
}
