import 'package:body_fat/modules/calculation/calculation_methods.dart';
import 'package:body_fat/shared/style/colors/colors.dart';
import 'package:body_fat/shared/style/text_style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:photo_view/photo_view.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultsScreen extends StatelessWidget {
  final String appBarName;
  final String name;
  final String unit;
  final String unitAr;
  final String svgImage;
  final int index;
  ResultsScreen(this.appBarName, this.name, this.svgImage, this.unit,
      this.unitAr, this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appBarName,
          style: arabicStyle.copyWith(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amber),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: darkColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: arabicStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SvgPicture.asset(
                    svgImage,
                    height: 140,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.pinkAccent,
                          darkColor,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          results[index].toStringAsFixed(1),
                          style: arabicStyle.copyWith(
                              color: Colors.blueGrey[100],
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          unitAr,
                          style: arabicStyle.copyWith(
                              color: Colors.blueGrey[100], fontSize: 22),
                        ),
                        Text(
                          unit,
                          style: arabicStyle.copyWith(
                              color: Colors.blueGrey[100], fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            if (index == 0)
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: darkColor, borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      showLastLabel: true,
                      startAngle: 180,
                      endAngle: 0,
                      interval: 100,
                      canScaleToFit: true,
                      showLabels: false,
                      showAxisLine: false,
                      showTicks: true,
                      minimum: 0,
                      maximum: 40,
                      ranges: <GaugeRange>[
                        GaugeRange(
                          startValue: 0,
                          endValue: 18.5,
                          color: Colors.blue[700],
                          label: '<16.0 - 18.4',
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.35,
                          endWidth: 0.35,
                          labelStyle: GaugeTextStyle(fontSize: 10),
                        ),
                        GaugeRange(
                          startValue: 18.51,
                          endValue: 25,
                          color: Colors.green[700],
                          label: '18.5 - 24.9',
                          startWidth: 0.35,
                          endWidth: 0.35,
                          labelStyle: GaugeTextStyle(fontSize: 10),
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                        GaugeRange(
                          startValue: 25.1,
                          endValue: 40,
                          color: Colors.red[700],
                          label: '25.0 - 40 <',
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.35,
                          endWidth: 0.35,
                          labelStyle: GaugeTextStyle(fontSize: 10),
                        ),
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: results[index],
                          needleColor: Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            if (index == 1)
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SfLinearGauge(
                      useRangeColorForAxis: false,
                      labelOffset: 10,
                      tickOffset: 5,
                      interval: 5,
                      maximum: 30,
                      ranges: [
                        LinearGaugeRange(

                          startValue: 0,
                          endValue: results[index],
                          color: Colors.blueGrey,
                        ),
                      ],
                      markerPointers: [
                        LinearShapePointer(
                          offset: 5,
                          shapeType: LinearShapePointerType.invertedTriangle,
                          color: Colors.black,
                          value: results[index],
                          elevation: 5,
                          animationDuration: 4000,
                        ),
                      ],
                      barPointers: [
                        LinearBarPointer(
                          value: 30,
                          offset: 2,
                          color: Colors.redAccent,
                        ),
                        LinearBarPointer(
                          value: 24,
                          offset: 2,
                          color: Colors.yellow,
                        ),
                        LinearBarPointer(
                          value: 13,
                          offset: 2,
                          color: Colors.green,
                        ),


                        LinearBarPointer(
                          value: 5,
                          offset: 2,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    width: double.infinity,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Male',
                          style: arabicStyle.copyWith(
                              color: darkColor, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: PhotoView(
                            backgroundDecoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            imageProvider: AssetImage(
                              'assets/images/menbodyfat.png',
                            ),
                          ),
                        ),
                        Text(
                          'Female',
                          style: arabicStyle.copyWith(
                              color: darkColor, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: PhotoView(
                            backgroundDecoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            imageProvider: AssetImage(
                              'assets/images/womenbodyfat.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}
