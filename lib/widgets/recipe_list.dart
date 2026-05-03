import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/widgets/recipe_list_item.dart';
import 'package:provider/provider.dart';
import 'package:lab2/ui_controller.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);
    var recipeHandler = context.watch<RecipeHandler>();
    var recipes = recipeHandler.bestMatches;
    
    return ListView(
      children: [
        for (final recipe in recipes)
          RecipeListItem(recipe, onTap: ()
           {
            uiController.selectRecipe(recipe);
           })
      ],
    );
  }
  
}
class RecipeImage extends StatelessWidget {
  const RecipeImage(this.recipe, {this.size = 104, this.flagSize = 24, super.key});

  final Recipe recipe;
  final double size;
  final double flagSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ClipRect(
            child: Container(
              width: size,
              height: size,
              child: FittedBox(fit: BoxFit.cover, child: recipe.image),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Cuisine.flag(recipe.cuisine, width: flagSize)!,
        ),
      ],
    );
  }
}