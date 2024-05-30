import 'package:flutter/material.dart';
import 'package:flutter_app/Component/ContentViewer/PostComponent.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Formatting/Colors.dart';
import 'package:flutter_app/Providers/UserProvider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.appBodyColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: CustomTheme.appBarTextColor,
        ),
        title: const Text(
          'Techsolver',
          style: TextStyle(color: CustomTheme.appBarTextColor),
        ),
        backgroundColor: CustomTheme.appBarBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.watch<UserProvider>().username,
                        style: const TextStyle(
                          color: CustomTheme.appBarTextColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'This is the user bio', // Replace with user's bio
                        style: TextStyle(
                          color: CustomTheme.appBarTextColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Edit profile functionality
                  },
                  icon: const Icon(Icons.edit, color: CustomTheme.appBarTextColor),
                ),
              ],
            ),
          ),
          const Divider(),
          TabBar(
            controller: _tabController,
            labelColor: CustomTheme.appBarTextColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: CustomTheme.appBarTextColor,
            tabs: const [
              Tab(text: 'Unresolved Posts'),
              Tab(text: 'Resolved Posts'),
              Tab(text: 'My Solved Problems',)
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                    child: SingleChildScrollView(
                      child: PostComponent(
                        username: 'fwef',
                        avatarUrl: 'https://picsum.photos/600/600',
                        content: '',
                        images: ['https://picsum.photos/600/600', 'https://picsum.photos/700/600'],
                        likes: 1,
                        comments: 1,
                      ),
                    )
                ),
                Center(child: Text('Achievements Page')),
                Center(child: Text('My Solved Problems')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}