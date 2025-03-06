// الخصائص المعروضة عند اختيار الفئة
enum Season {
  // الفصول الاربعة
  Winter,
  Spring,
  Summer,
  Autumn,
}
// enum لتخزين مجموعة من البيانات داخل متغير
enum TripType {
  // انواع الرحلات
  Exploration,
  Recovery,
  Activities,
  Therapy,
}

class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> activities;
  final List<String> program; // الخطط
  final int duration; // عدد الايام
  final Season season;
  final TripType tripType;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;

  const Trip({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.activities,
    required this.program,
    required this.duration,
    required this.season,
    required this.tripType,
    required this.isInSummer,
    required this.isInWinter,
    required this.isForFamilies,
  });
}
