
// تصميم العناصر المعروضة
import 'package:flutter/material.dart';
import '../screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const CategoryItem(this.id, this.title, this.imageUrl, {super.key});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryTripsScreen.screenRoute,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell( //يجعل الستاك قابل للنقر
      onTap: () => selectCategory(context),
      splashColor: Colors.teal,
      borderRadius: BorderRadius.circular(15),

      child: Stack(
        children: [
          ClipRRect(//لتقليم الشكل
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.4),
            ),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ],
      ),
    );
  }
}
