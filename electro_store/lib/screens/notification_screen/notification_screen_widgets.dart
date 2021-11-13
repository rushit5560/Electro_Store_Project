import 'package:flutter/material.dart';

class NotificationListModule extends StatelessWidget {
  const NotificationListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        return notificationListTile();
      },
    );
  }

  Widget notificationListTile() {
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
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurpleAccent
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'E',
                    textScaleFactor: 1.6,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                        'Black Friday deal in one place',
                        textScaleFactor: 1.3,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '1 Day ago',
                        textScaleFactor: 0.9,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
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
