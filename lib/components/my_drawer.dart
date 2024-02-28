import 'package:flutter/material.dart';
import 'package:musically/pages/settings_page.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(children: [

        DrawerHeader(child: Center(child: Icon(
          Icons.music_note,
          size: 30,
          color: Theme.of(context).colorScheme.inversePrimary,
      ),
     )
    ),
          //Home_page_button_sidebar
        Padding(
        padding: const EdgeInsets.only(left: 25, top: 25),
        child: ListTile(
          title: Text("H O M E"),
          leading: Icon(Icons.home),
          onTap: () => Navigator.pop(context),
        ),
        ),
          //Settings_page_button_sidebar
        Padding(
        padding: const EdgeInsets.only(left: 25, top: 25),
        child: ListTile(
          title: Text("S E T T I N G S"),
          leading: Icon(Icons.settings),
          onTap: () {
            Navigator.pop(context);

            Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsPage(),
            ),
            );

          },
        ),
        ),
        
      
      ],),
    );
  }
}