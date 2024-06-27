import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/meals_provider.dart';


enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false
        });

void setFilters(Map<Filter,bool>chosenfilters){
  state=chosenfilters;
}
  void setFilter(Filter filter, bool isActive) {
    //state[filter]=isActive;//not allowed her we are mutating
    state = {
      ...state, // spread operator
      filter: isActive,
    };
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier,Map<Filter,bool>>(
  (ref) => FiltersNotifier(),
);

// can add multiple provider in a same file if they are closely related

final filteredMealsProvider= Provider((ref){
  final meals=ref.watch(mealsProvier);
  final activefilters=ref.watch(filtersProvider);
  return meals.where((meal) {
      if (activefilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activefilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activefilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activefilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
}); 