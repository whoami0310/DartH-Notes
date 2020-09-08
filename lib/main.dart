import 'package:darthnotes/helper/colors.dart';
import 'package:darthnotes/screens/home/home_screen.dart';
import 'package:darthnotes/stores/notes_store.dart';
import 'package:darthnotes/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserStore(),
          lazy: false,
        ),
        ChangeNotifierProxyProvider<UserStore, NotesStore>(
          create: (_) => NotesStore(),
          //lazy: false,
          update: (_, userStore, notesStore) =>
              notesStore..updateUser(userStore.user),
        ),

/*

ChangeNotifierProxyProvider<UserManager, CartManager>(
          create: (_) => CartManager(),
          lazy: false,
          update: (_, userManager, cartManager) =>
            cartManager..updateUser(userManager),
        ),




*/
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DartH Notes',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryColor: primaryDark,
          scaffoldBackgroundColor: primaryDark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
