import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 145,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  "English <-> മലയാളം",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Dictionary",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          drawerTextIconButton(
            text: "Home",
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          drawerTextIconButton(
            text: "Settings",
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
          Divider(),
          drawerTextIconButton(
            text: "Contact Us",
            icon: Icon(Icons.mail_outline),
            onPressed: () {},
          ),
          Divider(),
          drawerTextIconButton(
            text: "About Us",
            icon: Icon(Icons.info_outline),
            onPressed: () {},
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Version 1.0",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 370),
          Container(
            padding: EdgeInsets.only(right: 40),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Developed By",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "ADARSH C",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerTextIconButton(
      {required String text,
      required Icon icon,
      required void Function() onPressed}) {
    return TextButton.icon(
      style: ButtonStyle(
        iconSize: MaterialStateProperty.all(22),
        iconColor: MaterialStatePropertyAll(Colors.white),
      ),
      onPressed: onPressed,
      icon: icon,
      label: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
