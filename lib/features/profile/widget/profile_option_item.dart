import 'package:flutter/material.dart';
import 'package:hotelino/core/constants/constants.dart';

class ProfileOptionItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileOptionItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8, left: 8, top: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios_new_rounded, size: 14),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              SizedBox(width: 12),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.darkFocusedBorder
                      : Color(0xFFF4EAE2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : AppColors.darkFocusedBorder,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
