import 'package:cookbook/widget/categories_chip.dart';
import 'package:cookbook/widget/display_tile.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // This will trigger a rebuild of the DisplayTile widget
        // which will fetch fresh data
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Today\'s Top Pick',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
                height: MediaQuery.of(context).size.width - 40,
                child: const DisplayTile()),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Cuisines',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 10),
            const CategoriesChip(),
            // Add some bottom padding to ensure pull-to-refresh works properly
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
