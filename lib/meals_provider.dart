import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/dummy_data.dart';

final mealsProvier=Provider((ref){// basic way to make provider to work on static data
  return dummyMeals;
});

