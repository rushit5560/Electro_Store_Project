import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/common/app_images.dart';
import 'package:flutter/material.dart';

class OrderListModule extends StatelessWidget {
  const OrderListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        return orderListTile();
      },
    );
  }

  Widget orderListTile() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _imageAndNameModule(),
              ),

              _orderQtyModule(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageAndNameModule() {
    return Container(
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage('${AppImages.ic_category1_img}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nulla Faucibus, turpis eu lacinia',
                    maxLines: 1,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          '\$200',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.kPinkColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '\$210',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                            '13 Dec 2019'
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderQtyModule() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.kPinkColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          '1',
          textScaleFactor: 1.1,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
