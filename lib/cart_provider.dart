import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import './laptop.dart';

class CartProvider with ChangeNotifier {
  List<Laptop> _items = [];
  StreamSubscription<QuerySnapshot<Laptop>>? _cartSubscription;
  User? _user;

  CartProvider() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      _user = user;
      _items = [];
      notifyListeners();
      _cartSubscription?.cancel();

      if (user != null) {
        _cartSubscription = _getCartCollection(user.uid)
            .snapshots()
            .listen((snapshot) {
          _items = snapshot.docs.map((doc) => doc.data()).toList();
          notifyListeners();
        });
      }
    });
  }

  // Helper to get typed collection reference
  CollectionReference<Laptop> _getCartCollection(String uid) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('cart')
        .withConverter<Laptop>(
      fromFirestore: (snapshot, _) => Laptop.fromMap(snapshot.data()!),
      toFirestore: (laptop, _) => laptop.toMap(),
    );
  }

  List<Laptop> get items => _items;

  int get itemCount => _items.length;

  double get totalAmount {
    var total = 0.0;
    for (var item in _items) {
      total += item.price;
    }
    return total;
  }

  Future<void> addItem(Laptop laptop) async {
    if (_user != null) {
      // With converter, we can add the object directly
      await _getCartCollection(_user!.uid).add(laptop);
    } else {
      _items.add(laptop);
      notifyListeners();
    }
  }

  Future<void> removeItem(Laptop laptop) async {
    if (_user != null) {
      // Find the document to delete
      // Since we don't store the Doc ID in the Laptop model here (only the product ID),
      // we query by the product ID field.
      final snapshot = await _getCartCollection(_user!.uid)
          .where('id', isEqualTo: laptop.id)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        await snapshot.docs.first.reference.delete();
      }
    } else {
      _items.remove(laptop);
      notifyListeners();
    }
  }

  Future<void> clear() async {
    if (_user != null) {
      final snapshot = await _getCartCollection(_user!.uid).get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
    } else {
      _items.clear();
      notifyListeners();
    }
  }
}
