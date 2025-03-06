

// صفحة التصنيفات الرئيسية

import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,// الحد الأقصى لعرض العناصر
        childAspectRatio: 7 / 8,//  نسبة العرض الى الارتفاع
        mainAxisSpacing: 10,// المسافة الرأسية
        crossAxisSpacing: 10,//المسافة الافقية
      ),
      children: Categories_data.map((thiis) => CategoryItem(//  CategoryItem خاصة بالتصميم
          thiis.id, thiis.title, thiis.imageUrl)).toList(),// اعرضهن على شكل  قائمة
    );
  }
}
