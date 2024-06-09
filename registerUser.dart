void _registerUser(String username, String password, String role) {
  _prefs.setString('username', username);
  _prefs.setString('password', password);
  _prefs.setString('role', role);
  setState(() {
    _showRegister = false;
  });
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('You are registered! Please login.'),
    ),
  );
}
bool _validateLogin(String username, String password) {
  final savedUsername = _prefs.getString('username');
  final savedPassword = _prefs.getString('password');
  return username == savedUsername && password == savedPassword;
}

String _getUserRole(String username) {
  return _prefs.getString('role') ?? 'user'; // Default to 'user' if role is not found
}
Widget _buildRegisterForm(BuildContext context) {
  String _selectedRole = RoleManager.userRole; // Default role

  return Padding(
    padding: EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            labelText: 'Username',
            prefixIcon: Icon(Icons.person),
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: _passwordController,
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
        ),
        SizedBox(height: 10.0),
        DropdownButtonFormField<String>(
          value: _selectedRole,
          decoration: InputDecoration(
            labelText: 'Role',
            prefixIcon: Icon(Icons.security),
          ),
          items: [
            DropdownMenuItem(value: RoleManager.adminRole, child: Text('Admin')),
            DropdownMenuItem(value: RoleManager.vendorRole, child: Text('Vendor')),
            DropdownMenuItem(value: RoleManager.userRole, child: Text('User')),
          ],
          onChanged: (value) {
            setState(() {
              _selectedRole = value!;
            });
          },
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            String username = _usernameController.text;
            String password = _passwordController.text;
            _registerUser(username, password, _selectedRole);
          },
          child: Text('Register'),
        ),
      ],
    ),
  );
}


