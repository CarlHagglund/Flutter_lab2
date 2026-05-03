import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:lab2/widgets/recipe_list.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);
    return Card(
      elevation: AppTheme.cardElevation,
      shape: AppTheme.cardShape,
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: EdgeInsets.all(AppTheme.paddingMedium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 240,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecipeImage(recipe, size: 240, flagSize: 60),
                  SizedBox(height: AppTheme.paddingSmall),
                  Text("Ingredienser:", style: AppTheme.smallHeading),
                  ...recipe.ingredients.map((i) => Text(i.toString())),
                ],
              ),
            ),
            SizedBox(width: AppTheme.paddingMedium),
            Expanded(child: _rightColumn(uiController)),
          ],
        ),
      ),
    );
  }

  Widget _rightColumn(UIController uiController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(recipe.name, style: AppTheme.largeHeading)),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => uiController.deselectRecipe(),
            ),
          ],
        ),
            Text(
              recipe.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
        ),

        Row(children: [
          MainIngredient.icon(recipe.mainIngredient, width: 20) ?? SizedBox.shrink(),
          SizedBox(width: 8),
          Difficulty.icon(recipe.difficulty, width: 48) ?? SizedBox.shrink(),
        ]),
        SizedBox(height: AppTheme.paddingSmall),
        Text("Tillagning", style: AppTheme.smallHeading),
        SizedBox(height: AppTheme.paddingSmall),
        Text(recipe.instruction),
      ],
    );
  }
}