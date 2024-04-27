import 'package:exam/provider/provider_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => UserProvider(),
        child: const UserImageScreen(),
      ),
    );
  }
}

class UserImageScreen extends StatelessWidget {
  const UserImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final users = userProvider.users;
    
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),

         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [users.isEmpty
              ? const CircularProgressIndicator()
              : Flexible(child: users.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.imageUrl),
                    ),
                    title: Row(children: [Text(user.firstName),const SizedBox(width: 3), Text(user.lastName),const SizedBox(width: 3),Text(user.gender)],),
                    subtitle: Text(user.email),
                    
                  );
                },
              ),
      ),
                
                
           ElevatedButton(onPressed: () {
            userProvider.fetchUsers();
          }, child: const Text("GENERATE NEW USER"),),]),)  
  
      
      
    );
  }
}
