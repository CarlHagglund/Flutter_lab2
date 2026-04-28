import 'package:flutter/material.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/recipe_list.dart';
import 'package:lab2/widgets/time_control.dart';
import 'package:lab2/widgets/recipe_detail.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';


class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Row(children: [_controlPanel(context), RecipeArea()]),
    );
}
  Widget _controlPanel(context, {double width = 320}) {
   return Container(
    width: width,
    color: const Color.fromARGB(255, 202, 237, 4),
    child: Column(
      children: [
        Text("Receptsök"),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Hitta ett recept som passar genom att ändra inställningarna nedanför"),
        ),
          IngredientControl(),
          KitchenControl(),
          
        Text("Svårighetsgrad"),
        DifficultyControl(),

        Text("Maxpris:"),
        PriceControl(),
        Text("Maxtid:"),
        TimeControl(),
      ],
    )
   );
}

}

class RecipeArea extends StatelessWidget {
  const RecipeArea({super.key});

  @override
  Widget build(BuildContext context) {
    var uiController = context.watch<UIController>();
    Widget contents;

    if (uiController.showRecipeList) {
      contents = RecipeList();
    } else {
      contents = RecipeDetail(uiController.selectedRecipe!);
    }
    return Expanded(child: contents);
  }
}