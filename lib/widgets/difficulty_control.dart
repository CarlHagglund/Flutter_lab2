import 'package:flutter/material.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:provider/provider.dart';

class DifficultyControl extends StatefulWidget {
  const DifficultyControl({super.key});

  @override
  State<DifficultyControl> createState() => _DifficultyControlState();
} 

class _DifficultyControlState extends State<DifficultyControl> {
  String _difficulty = Difficulty.labels[0];

  @override
    Widget build(BuildContext context) {

      var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

      return RadioGroup<String>(
        groupValue: _difficulty,
        onChanged: (value) {
          setState(() {
            _difficulty = value!;
          });
          recipeHandler.setDifficulty(value!);
        },
        child: Column(
  children: [
    for (int i = 0; i < Difficulty.labels.length; i++)
      RadioListTile<String>(
        dense: true,
        value: Difficulty.labels[i],
        title: Difficulty.icons[i] == null
            ? Text(Difficulty.labels[i])
            : Row(
                children: [
                  Difficulty.icons[i]!,
                  SizedBox(width: 12),
                  Text(Difficulty.labels[i]),
                ],
              ),
      ),
  ],
),
      );
    }
}