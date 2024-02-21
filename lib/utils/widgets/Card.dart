import 'package:flutter/material.dart';

import '../const.dart';

class card extends StatelessWidget {
  final String? name;
  final String? Lastname;
  final Widget? Icon;
  final Image? image;
  const card({
    super.key,
    this.name,
    this.Lastname,
    this.Icon,
    this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondary,
      elevation: 5, // Add elevation for a shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Add border radius
        side: const BorderSide(
            color: Color.fromARGB(0, 158, 158, 158)), // Add border color
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          0,
          20,
          0,
          20,
        ),
        child: ListTile(
            leading: SizedBox(
              width: 55,
              height: 55,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: image,
              ),
            ),
            title: Align(
              alignment: Alignment.center,
              child: Text(
                '$Lastname  $name ',
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600, color: btncolor),
              ),
            ),
            trailing: Icon
            //const Icon(Icons.arrow_forward_ios, size: 22.0, color: btncolor),
            ),
      ),
    );
  }
}
