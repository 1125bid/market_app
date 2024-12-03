import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/home_indexed_stack.dart';
import 'package:flutter_market_app/ui/pages/home/widgets/home_bottom_navigation_bar.dart';
import 'package:flutter_market_app/ui/pages/join/widgets/home_floating_action_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeIndexedStack(),
      bottomNavigationBar: HomeBottomNavigationBar(),
      floatingActionButton: HomeFloatingActionButton(),
    );
  }
}
