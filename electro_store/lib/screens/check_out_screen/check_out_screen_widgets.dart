import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/controller/check_out_screen_controller/check_out_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreenModule extends StatelessWidget {
  // const CheckOutScreenModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          PriceModule(),
          const SizedBox(height: 10),
          PaymentMethodModule(),
          const SizedBox(height: 10),
          CardModule(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}


class PriceModule extends StatelessWidget {
  const PriceModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Price',
                // textScaleFactor: 1.1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '\$400.00',
                textScaleFactor: 1.5,
                style: TextStyle(
                    color: AppColors.kPinkColor,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethodModule extends StatelessWidget {
  CheckOutScreenController checkOutScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Material(
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
                children: [

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        checkOutScreenController.isPaymentSelected.value = 0;
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: checkOutScreenController.isPaymentSelected.value == 0
                                ? AppColors.kPinkColor
                                : AppColors.kLightPinkColor
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Credit/Debit',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        checkOutScreenController.isPaymentSelected.value = 1;
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: checkOutScreenController.isPaymentSelected.value == 1
                                ? AppColors.kPinkColor
                                : AppColors.kLightPinkColor
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Paypal',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        checkOutScreenController.isPaymentSelected.value = 2;
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: checkOutScreenController.isPaymentSelected.value == 2
                                ? AppColors.kPinkColor
                                : AppColors.kLightPinkColor
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Paypal',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}


class CardModule extends StatefulWidget {
  const CardModule({Key? key}) : super(key: key);

  @override
  _CardModuleState createState() => _CardModuleState();
}
class _CardModuleState extends State<CardModule> {

  TextEditingController cardNoFieldController = TextEditingController();
  TextEditingController dateFieldController = TextEditingController();
  TextEditingController cvvFieldController = TextEditingController();
  TextEditingController cardHolderFieldController = TextEditingController();
  bool _cardSaveValue = false;


  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              _cardNo(),
              const SizedBox(height: 10),
              _dateAndCvv(),
              const SizedBox(height: 10),
              _cardHolder(),
              const SizedBox(height: 10),
              _saveCardData(),
              const SizedBox(height: 10),
              _checkOutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardNo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card No.',
          textScaleFactor: 1.1,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),

        TextFormField(
          keyboardType: TextInputType.number,
          controller: cardNoFieldController,
          decoration: inputDecoration(),
        ),
      ],
    );
  }
  Widget _dateAndCvv() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Valid Until',
                textScaleFactor: 1.1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),

              TextFormField(
                keyboardType: TextInputType.datetime,
                controller: dateFieldController,
                decoration: inputDecoration(),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CVV',
                textScaleFactor: 1.1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),

              TextFormField(
                keyboardType: TextInputType.number,
                controller: cvvFieldController,
                decoration: inputDecoration(),
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget _cardHolder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card Holder',
          textScaleFactor: 1.1,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),

        TextFormField(
          keyboardType: TextInputType.text,
          controller: cardHolderFieldController,
          decoration: inputDecoration(),
        ),
      ],
    );
  }
  Widget _saveCardData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Save Card Data For Future Payment',
            textScaleFactor: 1.1,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Transform.scale(
          scale: 0.6,
          child: CupertinoSwitch(
            value: _cardSaveValue,
            onChanged: (value) {
              setState(() {
                _cardSaveValue = value;
                print(_cardSaveValue);
              });
            },
            trackColor: AppColors.kLightPinkColor,
            activeColor: AppColors.kPinkColor,
          ),
        ),
      ],
    );
  }
  Widget _checkOutButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: Get.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: AppColors.kPinkColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Proceed To Checkout',
              textScaleFactor: 1.2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

}



InputDecoration inputDecoration() {
  return InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
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


