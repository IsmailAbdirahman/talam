import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talam/features/profile/presentation/widgets/delete_account_dialog.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Align(
        alignment: Alignment.centerLeft,
        child: OutlinedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => const DeleteAccountDialog(),
            );
          },
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(0, 40),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            side: BorderSide(
              color: Colors.red.withValues(alpha: 0.35),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
          child: Text(
            'Delete Account',
            style: GoogleFonts.poppins(
              fontSize: 13.5,
              fontWeight: FontWeight.w500,
              color: Colors.red.withValues(alpha: 0.8),
            ),
          ),
        ),
      ),
    );
  }
}
