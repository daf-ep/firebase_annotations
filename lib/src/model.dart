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

/// {@template model_gen}
/// Annotation used to mark a Dart class as a **data model**
/// eligible for automatic code generation.
///
/// The `@ModelGen()` annotation indicates to the build system
/// that the annotated class should have additional boilerplate generated,
/// such as:
/// - Serialization methods (`toMap`, `fromMap`)
/// - Copying and mutation helpers (`copyWith`)
/// - Equality and hashCode overrides (if not already handled by [Equatable])
///
/// ### Example
/// ```dart
/// @ModelGen()
/// class User {
///   final String id;
///   final String name;
///   final int age;
///
///   const User({
///     required this.id,
///     required this.name,
///     required this.age,
///   });
/// }
/// ```
///
/// The generator might then produce:
/// ```dart
/// extension UserGenerated on User {
///   Map<String, dynamic> toMap() => {...};
///   static User fromMap(Map<String, dynamic> map) => ...;
///   User copyWith({String? name, int? age}) => ...;
/// }
/// ```
///
/// ### Notes
/// - This annotation serves as a **generic entry point** for model code generation.
/// - It can be combined with other annotations like `@FirestoreGen` or `@DatabaseGen`
///   to extend generated functionality for specific backends.
/// - The generator should detect all annotated classes automatically during build.
/// {@endtemplate}
class ModelGen {
  const ModelGen();
}
