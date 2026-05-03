import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/logo.dart';
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
    body: Padding(
      padding: EdgeInsets.all(AppTheme.paddingMedium),
      child: Row(
        children: [
          _controlPanel(context),
          SizedBox(width: AppTheme.paddingSmall),
          RecipeArea(),
        ],
      ),
    ),
  );
}

Widget _controlPanel(context, {double width = 320}) {
  return Container(
    width: width,
    color: const Color.fromARGB(255, 202, 237, 4),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Logo(),
          Text(
            "Hitta ett recept som passar genom att ändra\ninställningarna nedanför",
            textAlign: TextAlign.center,
          ),
          IngredientControl(),
          KitchenControl(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("Svårighetsgrad",
                    style: AppTheme.smallHeading),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16 ,horizontal: AppTheme.paddingMedium),
            child: DifficultyControl(),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("Maxpris:",
                    style: AppTheme.smallHeading)),
              
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16 ,horizontal: AppTheme.paddingMedium),
            child: PriceControl(),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("Maxtid:",
                    style: AppTheme.smallHeading),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16 ,horizontal: AppTheme.paddingMedium),
            child: TimeControl(),
          ),
        ],
      ),
    ),
  );
}
}

class RecipeArea extends StatelessWidget {
  const RecipeArea({super.key});

  @override
  Widget build(BuildContext context) {
    var uiController = context.watch<UIController>();
    Widget contents;
    String heading;

    if (uiController.showRecipeList) {
      contents = RecipeList();
      heading = "Receptlista";
    } else {
      contents = RecipeDetail(uiController.selectedRecipe!);
      heading = uiController.selectedRecipe!.name;
    }

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading, style: AppTheme.mediumHeading),
          Expanded(child: contents),
        ],
      ),
    );
  }
}