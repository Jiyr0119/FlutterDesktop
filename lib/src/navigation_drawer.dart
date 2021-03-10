import 'package:flutter/material.dart';

class LayoutDrawer extends StatefulWidget {
  final String title;

  LayoutDrawer({Key key, this.title}) : super(key: key);

  @override
  _LayoutDrawer createState() => _LayoutDrawer();
}

class _LayoutDrawer extends State<LayoutDrawer> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Row(
      children: [
        Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Header',
                  style: textTheme.headline6,
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Item 1'),
                selected: _selectedDestination == 0,
                onTap: () => selectDestination(0),
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Item 2'),
                selected: _selectedDestination == 1,
                onTap: () => selectDestination(1),
              ),
              ListTile(
                leading: Icon(Icons.label),
                title: Text('Item 3'),
                selected: _selectedDestination == 2,
                onTap: () => selectDestination(2),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Label',
                ),
              ),
              ListTile(
                leading: Icon(Icons.bookmark),
                title: Text('Item A'),
                selected: _selectedDestination == 3,
                onTap: () => selectDestination(3),
              ),
            ],
          ),
        ),
        VerticalDivider(
          width: 1,
          thickness: 1,
        ),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: EdgeInsets.all(20),
              childAspectRatio: 3 / 2,
              children: [
                Container(color: Colors.green, child: Text(widget.title)),
                Container(
                    color: Colors.blue,
                    child: Row(
                      // <Widget> is the type of items in the list.
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.menu),
                          tooltip: 'Navigation menu',
                          onPressed: null, // null disables the button
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          tooltip: 'Search',
                          onPressed: null,
                        ),
                      ],
                    )),
                Container(color: Colors.pinkAccent),
                Container(color: Colors.purpleAccent),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
