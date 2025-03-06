// عرض كل الرحلات الخاصة بالتصنيفات 
import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/category-trips';
  final List<Trip> avaliableTrips;

  const CategoryTripsScreen(this.avaliableTrips);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  String? categoryTitle;
  List<Trip> displayTrips = [];
  bool _isInit = false; // متغير لضمان تشغيل الكود مرة واحدة

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      // استرجاع البيانات من الـ arguments
      final routeArgument =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

      if (routeArgument != null) {
        final categoryId = routeArgument['id'] ?? '';
        categoryTitle = routeArgument['title'] ?? '';

        displayTrips = widget.avaliableTrips.where((trip) {
          return trip.categories.contains(categoryId);
        }).toList();
      }
      _isInit = true; // منع إعادة تشغيل الكود عند إعادة البناء
    }
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? 'رحلات'),
      ),
      body: ListView.builder(
        itemCount: displayTrips.length,
        itemBuilder: (ctx, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            //removeItem: _removeTrip,
          );
        },
      ),
    );
  }
}
