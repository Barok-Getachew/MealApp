import 'package:flutter/material.dart';
import '../models/Meal.dart';
import '../widgets/main_Drawer.dart';
import './catagories_screen.dart';
import './favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;
  TabsScreen(this._favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': CatagoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(widget._favoriteMeals),
        'title': 'Favourites',
      }
    ];
    super.initState();
  }

  // final List<Widget> _pages = [CatagoriesScreen(), FavoriteScreen()];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        // ignore: deprecated_member_use
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
