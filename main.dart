import 'package:flutter/material.dart';

import 'RoleManager.dart';
void main(){
  runApp( const Dashboard(username: 'ali',role: "manager",));
}
class Dashboard extends StatelessWidget {

  final String username;
  final String role;

  const Dashboard({Key? key, required this.username, required this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoleManager roleManager = RoleManager();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendor Management System'),
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    'Welcome, $username!',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Text('Your vendor management dashboard goes here!'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    RoleManager roleManager = RoleManager();

    return Drawer(
      child: ListView(
        children: [
          AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Vendor Management'),
            automaticallyImplyLeading: false,
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text('Vendor Management'),
            onTap: roleManager.hasPermission(role, 'vendor_management')
                ? () => _navigateToVendorManagement(context)
                : null,
          ),
          ListTile(
            leading: Icon(Icons.production_quantity_limits),
            title: Text('Product Management'),
            onTap: roleManager.hasPermission(role, 'product_management')
                ? () => _navigateToProductManagement(context)
                : null,
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Order Management'),
            onTap: roleManager.hasPermission(role, 'order_management')
                ? () => _navigateToOrderManagement(context)
                : null,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              _confirmLogout(context);
            },
          ),
        ],
      ),
    );
  }

  void _navigateToVendorManagement(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => VendorManagement(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  void _navigateToProductManagement(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ProductManagement(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  void _navigateToOrderManagement(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => OrderManagement(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _logout(context);
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }
}
