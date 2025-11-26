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

/// {@template firestore_collection_gen}
/// Annotation used to generate constants and Firestore helpers
/// for a top-level Firestore collection.
///
/// This should be applied to a model class that represents
/// a root Firestore collection.
///
/// Example:
/// ```dart
/// @FirestoreCollectionGen(collection: "__fbs__users")
/// class User { ... }
/// ```
/// {@endtemplate}
class FirestoreCollectionGen {
  /// {@macro firestore_collection_gen}
  const FirestoreCollectionGen({required this.collection});

  /// The name of the Firestore collection.
  final String collection;
}

/// {@template firestore_sub_collection_gen}
/// Annotation used to generate constants and helpers for a subcollection
/// inside a Firestore document.
///
/// This is useful for relationships such as:
/// `users/{userId}/notifications` or `chats/{chatId}/messages`.
///
/// Example:
/// ```dart
/// @FirestoreSubCollectionGen(
///   parent: "__fbs__chats",
///   collection: "__fbs__messages",
/// )
/// class Message { ... }
/// ```
/// {@endtemplate}
class FirestoreSubCollectionGen {
  /// {@macro firestore_sub_collection_gen}
  const FirestoreSubCollectionGen({required this.parent, this.collection});

  /// The parent Firestore collection this subcollection belongs to.
  final String parent;

  /// The name of the subcollection. If `null`, it defaults to the class name.
  final String? collection;
}
