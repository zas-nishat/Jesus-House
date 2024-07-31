import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHomeCard extends StatelessWidget {
  final IconData? icon;
  final String? image;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const CustomHomeCard({
    this.icon,
    this.image,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.grey.shade900,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    color: Colors.orange,
                    size: 35,
                  ),
                if (image != null)
                  SvgPicture.asset(
                    "Assets/$image",
                    width: 35,
                    height: 35,
                    color: Colors.orange,
                  ),
                const SizedBox(height: 10),
                Text(
                  title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
