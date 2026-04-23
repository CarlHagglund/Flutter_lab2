import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lab2/ui_controller.dart';
import'package:lab2/model/recipe_database/recipe.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Column(
      children: [
        IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          uiController.deselectRecipe();
      },
    ),
    SizedBox(
      width: 400,
      height: 400,
      child: recipe.image,
    ),
    Text(recipe.name)]);
}
}