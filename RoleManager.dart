import 'dart:js';

import 'package:flutter/material.dart';
class RoleManager {
  static const String adminRole = 'admin';
  static const String vendorRole = 'vendor';
  static const String userRole = 'user';

  final Map<String, List<String>> _rolePermissions = {
    adminRole: ['vendor_management', 'product_management', 'order_management'],
    vendorRole: ['product_management', 'order_management'],
    userRole: ['order_management'],
  };

  bool hasPermission(String role, String permission) {
    return _rolePermissions[role]?.contains(permission) ?? false;
  }
}


