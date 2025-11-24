// import 'package:flutter/material.dart';


// class FavouritesScreen extends StatelessWidget {
// const FavouritesScreen({super.key});


// @override
// Widget build(BuildContext context) {
// return Scaffold(
// appBar: AppBar(title: const Text('Favourites')),
// body: ListView.builder(
// padding: const EdgeInsets.all(12),
// itemCount: 6,
// itemBuilder: (context, i) => Card(
// child: ListTile(
// leading: Image.asset('assets/mix.png'),
// title: Text('Favourite ${i+1}'),
// subtitle: const Text('Restaurant • 25–30 min'),
// trailing: const Icon(Icons.arrow_forward_ios, size: 16),
// onTap: () => Navigator.pushNamed(context, '/restaurant'),
// ),
// ),
// ),
// );
// }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favourites')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 6,
        itemBuilder: (context, i) => Card(
          child: ListTile(
            leading: Image.asset('assets/mix.png'),
            title: Text('Favourite ${i + 1}'),
            subtitle: const Text('Restaurant • 25–30 min'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => context.push('/restaurant'),
          ),
        ),
      ),
    );
  }
}
