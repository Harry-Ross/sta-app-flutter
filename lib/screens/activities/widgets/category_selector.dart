import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
    @override
    _CategorySelectorState createState() => new _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
    int _selected = 1;

    Widget build (BuildContext context) {
        return Container( 
            height: 50,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                    Row(
                        children: <Widget>[
                            _choice(0, "All"),
                            _choice(1, "Pit stops"),
                            _choice(2, "Challenges"),
                            _choice(3, "Train station"),
                            _choice(4, "Races"),
                            _choice(5, "Scavenger hunts"),
                        ],
                    ),
                ]
            ),
        );
    }

    Widget _choice(int number, String label) {
        return new Container(
            padding: EdgeInsets.all(5),
            child: ChoiceChip(
                label: Text(label),
                selected: number == _selected,
                onSelected: (bool selected) {
                    setState(() {
                        _selected = number;
                    });
                },
            ),
        );
    }
}