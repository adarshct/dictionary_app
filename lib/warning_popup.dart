import "package:flutter/material.dart";

void warningPopUp({required BuildContext context, required String language}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 20,
        backgroundColor: Colors.white,
        content: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Non-$language characters are not allowed",
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
