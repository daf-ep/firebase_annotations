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

/// {@template storage_gen}
/// Annotation used to mark a class as a **Firebase Storage structure**
/// for automatic code generation.
///
/// The [StorageGen] annotation allows you to declaratively define
/// the root hierarchy of your storage buckets and folders.
/// The code generator will then produce strongly-typed storage
/// accessors and helper classes for building consistent paths.
///
/// ### Example
/// ```dart
/// @StorageGen(
///   root: [
///     StorageNode(
///       name: "users",
///       children: [
///         StorageNode(
///           name: "avatars",
///         ),
///         StorageNode(
///           name: "documents",
///           children: [
///             StorageNode(name: "contracts"),
///             StorageNode(name: "invoices"),
///           ],
///         ),
///       ],
///     ),
///     StorageNode(name: "projects"),
///   ],
/// )
/// class Storage {}
/// ```
///
/// The generator might produce:
/// ```dart
/// Storage.users(userId).avatars.path; // => "users/{userId}/avatars"
/// Storage.projects(projectId).path;   // => "projects/{projectId}"
/// ```
///
/// ### Notes
/// - [root] defines the **top-level folders** of your Firebase Storage bucket.
/// - Each [StorageNode] can have nested [children] to represent subfolders.
/// - [nodeId] can be used to define dynamic segments (e.g. user or project IDs).
/// - The generated API will ensure type-safe, IDE-completable access
///   to storage paths throughout the application.
///
/// {@endtemplate}
class StorageGen {
  /// The list of **root storage nodes** representing
  /// the entry points of the Firebase Storage hierarchy.
  final List<StorageNode> root;

  /// Creates a new annotation to describe a Firebase Storage schema.
  const StorageGen({required this.root});
}

/// {@template storage_node}
/// Represents a single node (folder or segment) within the
/// Firebase Storage hierarchy defined by [StorageGen].
///
/// Each node can have:
/// - A **name** (e.g. `"users"`, `"projects"`)
/// - An optional **nodeId** for dynamic path placeholders (e.g. `{userId}`)
/// - A list of nested **children** representing subdirectories.
///
/// This structure is recursively traversed by the code generator
/// to create a complete, type-safe storage API.
///
/// ### Example
/// ```dart
/// const StorageNode(
///   name: "users",
///   nodeId: "userId",
///   children: [
///     StorageNode(name: "avatars"),
///     StorageNode(name: "documents"),
///   ],
/// );
/// ```
///
/// Generates:
/// ```dart
/// Storage.users(userId).avatars.path; // => "users/{userId}/avatars"
/// ```
///
/// {@endtemplate}
class StorageNode {
  /// The **folder name** or path segment represented by this node.
  final String name;

  /// An optional **identifier placeholder** used in dynamic paths.
  ///
  /// Example:
  /// For `nodeId: "userId"`, the generator will produce:
  /// ```dart
  /// Storage.users(userId).path; // "users/{userId}"
  /// ```
  final String? nodeId;

  /// A list of **child nodes** nested under this node.
  ///
  /// Each child represents a subfolder in Firebase Storage.
  final List<StorageNode>? children;

  /// Creates a new [StorageNode] for use inside a [StorageGen] definition.
  const StorageNode({required this.name, this.nodeId, this.children});
}
