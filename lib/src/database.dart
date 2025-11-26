// Copyright (C) 2025 Fiber
//
// All rights reserved. This script, including its code and logic, is the
// exclusive property of Fiber. Redistribution, reproduction,
// or modification of any part of this script is strictly prohibited
// without prior written permission from Fiber.
//
// Conditions of use:
// - The code may not be copied, duplicated, or used, in whole or in part,
//   for any purpose without explicit authorization.
// - Redistribution of this code, with or without modification, is not
//   permitted unless expressly agreed upon by Fiber.
// - The name "Fiber" and any associated branding, logos, or
//   trademarks may not be used to endorse or promote derived products
//   or services without prior written approval.
//
// Disclaimer:
// THIS SCRIPT AND ITS CODE ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL
// FIBER BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING BUT NOT LIMITED TO LOSS OF USE,
// DATA, PROFITS, OR BUSINESS INTERRUPTION) ARISING OUT OF OR RELATED TO THE USE
// OR INABILITY TO USE THIS SCRIPT, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// Unauthorized copying or reproduction of this script, in whole or in part,
// is a violation of applicable intellectual property laws and will result
// in legal action.

/// {@template database_gen}
/// Annotation used to mark a class as a **Firebase Realtime Database schema**
/// for automatic code generation.
///
/// Applying this annotation allows the build system to:
/// - Generate strongly-typed database accessors and models.
/// - Automatically map JSON structures to Dart types.
/// - Centralize database configuration (URL and naming) in a declarative way.
///
/// ### Example
/// ```dart
/// @DatabaseGen(
///   databaseURL: "https://myapp-users.firebaseio.com",
///   name: "usersDB",
/// )
/// class UserDatabaseModel {
///   final String id;
///   final String name;
///   final int age;
///
///   const UserDatabaseModel({
///     required this.id,
///     required this.name,
///     required this.age,
///   });
/// }
/// ```
///
/// The generator will then produce:
/// - A Dart database interface bound to the specified Firebase instance.
/// - Helper methods for reading, writing, and listening to data updates.
/// - Boilerplate-free mapping for serialization and deserialization.
///
/// ### Notes
/// - [databaseURL] must correspond to your Firebase Realtime Database endpoint.
/// - [name] defines the local alias or identifier for this database
///   (used in generated accessors such as `FirebaseDatabases.usersDB()`).
/// - The annotated class should contain only serializable fields.
///
/// {@endtemplate}
class DatabaseGen {
  /// The full **Firebase Realtime Database endpoint**.
  ///
  /// Example: `"https://myapp.firebaseio.com"`
  final String databaseURL;

  /// The **logical name** used to identify this database in generated code.
  ///
  /// Example: `"usersDB"` or `"presenceDB"`.
  final String name;

  /// Creates a new database annotation for code generation.
  const DatabaseGen({required this.databaseURL, required this.name});
}
