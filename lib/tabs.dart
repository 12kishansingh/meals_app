import 'package:flutter/material.dart';
import 'package:meals_app/categories.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/meals.dart';


class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState(){
    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen>{
  int _selectedPageIndex=0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    Widget activePage=const CategoriesScreen();
var activePageTitle='Categories';
    if(_selectedPageIndex==1){
      activePage=const MealsScreen(meals: []);
      activePageTitle='Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body:activePage ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label:'Categories'),// category 
          BottomNavigationBarItem(icon:Icon(Icons.star) ,label:'Favourites'),// favourite screen
        ],
      ),
    );
    
  }
}