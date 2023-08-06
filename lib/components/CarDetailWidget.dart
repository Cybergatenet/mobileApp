import 'package:flutter/material.dart';
import 'package:taxibooking/utils/Extensions/StringExtensions.dart';
import '../utils/Colors.dart';

import '../main.dart';
import '../model/EstimatePriceModel.dart';
import '../utils/Constants.dart';
import '../utils/Extensions/AppButtonWidget.dart';
import '../utils/Extensions/app_common.dart';

class CarDetailWidget extends StatefulWidget {
  final ServicesListData service;

  CarDetailWidget({required this.service});

  @override
  CarDetailWidgetState createState() => CarDetailWidgetState();
}

class CarDetailWidgetState extends State<CarDetailWidget> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 16),
              height: 5,
              width: 70,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(defaultRadius)),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(widget.service.serviceImage.validate(),
                    fit: BoxFit.contain, width: 200, height: 100),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(widget.service.name.validate(), style: boldTextStyle()),
          SizedBox(height: 8),
          Text('${language.get} ${widget.service.name} ${language.rides}',
              style: secondaryTextStyle()),
          SizedBox(height: 8),
          Divider(color: Colors.grey),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(language.capacity, style: primaryTextStyle()),
              Text('${widget.service.capacity} ${language.people}',
                  style: primaryTextStyle()),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(language.baseFare, style: primaryTextStyle()),
              Text(
                  appStore.currencyPosition == LEFT
                      ? '${appStore.currencyCode} ${widget.service.baseFare}'
                      : '${widget.service.baseFare} ${appStore.currencyCode}',
                  style: primaryTextStyle()),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(language.minimumFare, style: primaryTextStyle()),
              Text(
                  appStore.currencyPosition == LEFT
                      ? '${appStore.currencyCode} ${widget.service.minimumFare}'
                      : '${widget.service.minimumFare} ${appStore.currencyCode}',
                  style: primaryTextStyle()),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(language.perDistance, style: primaryTextStyle()),
              Text(
                  appStore.currencyPosition == LEFT
                      ? '${appStore.currencyCode} ${widget.service.perDistance}/${language.km}'
                      : '${widget.service.perDistance} ${appStore.currencyCode}/${language.km}',
                  style: primaryTextStyle()),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(language.perMinDrive, style: primaryTextStyle()),
              Text(
                  appStore.currencyPosition == LEFT
                      ? '${appStore.currencyCode} ${widget.service.perMinuteDrive}/${language.min}'
                      : '${widget.service.perMinuteDrive} ${appStore.currencyCode}/${language.min}',
                  style: primaryTextStyle()),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(language.perMinWait, style: primaryTextStyle()),
              Text(
                  appStore.currencyPosition == LEFT
                      ? '${appStore.currencyCode} ${widget.service.perMinuteWait}/${language.min}'
                      : '${widget.service.perMinuteWait} ${appStore.currencyCode}/${language.min}',
                  style: primaryTextStyle()),
            ],
          ),
          SizedBox(height: 16),
          Text(
            widget.service.description.validate(),
            style: secondaryTextStyle(),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 16),
          AppButtonWidget(
            text: language.done,
            width: MediaQuery.of(context).size.width,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
