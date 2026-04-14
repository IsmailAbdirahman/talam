import 'package:flutter/material.dart';
import 'package:talam/features/fav/presentation/screen/fav.dart';
import 'package:talam/features/profile/presentation/widgets/delete_account_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 194, 194, 194),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26, width: 2),
                        shape: BoxShape.circle,
                        color: Colors.white24,
                      ),
                      child: Icon(Icons.person, size: 20, color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Text("Ejuu"),
                    ),
                  ],
                ),
                SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.bookmarks_rounded,
                          color: const Color.fromARGB(221, 35, 34, 34),
                        ),
                        Text("Saved"),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FavScreen()),
                        );
                      },
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: const Color.fromARGB(221, 35, 34, 34),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => DeleteAccountDialog(),
                );
              },
              child: Text(
                "Delete Account",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
