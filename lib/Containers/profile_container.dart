import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  final String text;
  final VoidCallback? ontap;
  final String icon;
  const ProfileContainer({required this.text, this.ontap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.blueGrey.shade200,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Image.asset(icon, scale: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
