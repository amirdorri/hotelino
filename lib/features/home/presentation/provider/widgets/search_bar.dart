import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.tune, color: theme.colorScheme.outline),
            ),
            SizedBox(
              height: 24,
              child: VerticalDivider(
                color: theme.colorScheme.outline,
                thickness: 1,
                width: 20,
              ),
            ),
            const Expanded(
              child: TextField(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  filled: false,
                  hintTextDirection: TextDirection.rtl,
                  hintText: "جستجو در بین هتل ها",
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: theme.colorScheme.outline),
            ),
          ],
        ),
      ),
    );
  }
}
