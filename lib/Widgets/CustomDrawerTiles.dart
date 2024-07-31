import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Customdrawertiles extends StatelessWidget {
  final IconData? icon;
  final String? image;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const Customdrawertiles({super.key,
    this.icon,
    this.image,
    required this.title,
    required this.subtitle,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListTile(
          leading: icon != null
              ? Icon(
            icon,
            size: 30,
            color: Colors.orange,
          )
              : image != null
              ? SvgPicture.asset(
            "Assets/$image",
            width: 30,
            height: 30,
            color: Colors.orange,
          )
              : null,
          title: Text("${title}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          subtitle: Text("${subtitle}",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
