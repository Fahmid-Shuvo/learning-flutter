import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/cateogry_meals_screen.dart';
import './screens/single_meal_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealNow',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.orange,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        SingleMealDetail.routeName: (ctx) => SingleMealDetail()
      },
      // onGenerateRoute: (settings){
      //   if(settings.name == '/'){
      //     return CategoriesScreen()
      //   } else {
      //     return CategoryMealsScreen()
      //   }
      // },
    );
  }
}
