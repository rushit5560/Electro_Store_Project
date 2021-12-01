import 'package:electro_store/common/api_url.dart';
import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/controller/cart_screen_controller/cart_screen_controller.dart';
import 'package:electro_store/models/cart_screen_model/cart_model.dart';
import 'package:electro_store/screens/check_out_screen/check_out_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreenModules extends StatelessWidget {
  // const CartScreenModules({Key? key}) : super(key: key);
  CartScreenController cartScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => cartScreenController.isLoading.value
          ? CustomCircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                children: [
                  CartItemsList(),
                  const SizedBox(height: 20),
                  CouponCodeModule(),
                  const SizedBox(height: 20),
                  CheckOutModule(),
                ],
              ),
            ),
    );
  }
}

class CartItemsList extends StatelessWidget {
  // const CartItemsList({Key? key}) : super(key: key);
  CartScreenController cartScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartScreenController.userCartProductLists.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        Cartditeil cartSingleItem = cartScreenController.userCartProductLists[index];
        return _cartItemsListTile(cartSingleItem);
      },
    );
  }

  _cartItemsListTile(Cartditeil cartSingleItem) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _imageAndNameModule(cartSingleItem),
                ),
                _incAndDecButtons(cartSingleItem),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageAndNameModule(Cartditeil cartSingleItem) {
    return Container(
      child: Row(
        children: [
          _removeButton(cartSingleItem),
          const SizedBox(width: 10),
          _imageModule(cartSingleItem),
          const SizedBox(width: 10),

          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${cartSingleItem.productname}',
                    maxLines: 1,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '\$${cartSingleItem.productcost}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.kPinkColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '\$${cartSingleItem.productcost}',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _removeButton(Cartditeil cartSingleItem) {
    return GestureDetector(
      onTap: () {
        var cartDetailId = cartSingleItem.cartDetailId;
        cartScreenController.getDeleteProductCart(cartDetailId);
        cartScreenController.getUserDetailsFromPrefs();
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.kPinkColor,
        ),
        child: Icon(Icons.remove_rounded, color: Colors.white),
      ),
    );
  }

  Widget _imageModule(Cartditeil cartSingleItem) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(
             ApiUrl.ApiMainPath + "asset/uploads/product/" + '${cartSingleItem.showimg}'
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _incAndDecButtons(Cartditeil cartSingleItem) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if(cartSingleItem.cquantity > 1) {
                int cartQty = cartSingleItem.cquantity;
                int cartQtyDec = cartQty - 1;
                print('cquantity -- : $cartQtyDec');
                cartScreenController.getAddProductCartQty(cartQtyDec, cartSingleItem.cartDetailId);
                cartScreenController.getUserDetailsFromPrefs();
              }
            },
            child: Icon(Icons.remove_rounded),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text('${cartSingleItem.cquantity}'),
          ),
          GestureDetector(
            onTap: () {
              int cartQty = cartSingleItem.cquantity;
              int cartQtyInc = cartQty + 1;
              print('cquantity ++ : $cartQtyInc');
              cartScreenController.getAddProductCartQty(cartQtyInc, cartSingleItem.cartDetailId);
              cartScreenController.getUserDetailsFromPrefs();
            },
            child: Icon(Icons.add_rounded),
          ),

        ],
      ),
    );
  }
}

class CouponCodeModule extends StatelessWidget {
  const CouponCodeModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: TextFormField(
                        decoration: inputDecoration(),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: AppColors.kPinkColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              'Apply',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.black),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sub Total',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text('\$360.00'),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tax',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text('\$40'),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Discount',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text('-\$100'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}

InputDecoration inputDecoration() {
  return InputDecoration(
    hintText: 'Apply Code',
    isDense: true,
    contentPadding: EdgeInsets.all(12),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: BorderSide(color: Colors.grey),
    ),
  );
}

class CheckOutModule extends StatelessWidget {
  // const CheckOutModule({Key? key}) : super(key: key);
  CartScreenController cartScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${cartScreenController.userCartTotalAmount}',
                textScaleFactor: 1.3,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(()=> CheckOutScreen());
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: AppColors.kPinkColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
