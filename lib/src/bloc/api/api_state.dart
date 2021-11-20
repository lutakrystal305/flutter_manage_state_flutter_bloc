//import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_manage_state/src/model/item_cart.dart';

/*
class CartState {
  List<ItemCart> carts;

  CartState(this.carts);
}*/
abstract class CartState extends Equatable {
  const CartState();
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartFetchFail extends CartState {}

// ignore: must_be_immutable
class CartFetchSuccess extends CartState {
  List<ItemCart> carts;
  CartFetchSuccess(this.carts);
  @override
  List<Object> get props => [carts];
}
