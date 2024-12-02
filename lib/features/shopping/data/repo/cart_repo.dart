abstract class CartRepo {
  Future<void> removeItemFromCart(itemToremove);
  Future<void> removeAllItems();
}
