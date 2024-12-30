import 'package:bank_mobile_app/controllers/responsive_font_size_controller.dart';
import 'package:bank_mobile_app/theme/color_resources.dart';
import 'package:bank_mobile_app/views/custom/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChangeFontSizeScreen extends StatelessWidget {
  final ResponsiveFontSizeController responsiveFontSizeController = Get.put(ResponsiveFontSizeController());

  ChangeFontSizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        double currentScale = responsiveFontSizeController.scaleText.value.clamp(0.8, 1.4);
        return CustomScrollView(
          slivers: [
            CustomAppbarWidget.buildSliverAppBar(context, isBack: true, title: "Font Size"),
          ],
        );
      }),
      bottomNavigationBar: BottomAppBar(
        height: 150,
        color: ColorResources.getWhiteColor(context),
        elevation: 0,
        child: Obx(() {
          double currentScale = responsiveFontSizeController.scaleText.value.clamp(0.8, 1.4);
          return StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Column(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: ColorResources.getPrimaryColor(context),
                      inactiveTrackColor: ColorResources.getLightGrey(context),
                      thumbColor: ColorResources.getPrimaryColor(context), // Set thumb color
                      thumbShape: RectangularSliderThumbShape(),
                      trackHeight: 4, // Adjust track height
                    ),
                    child: Slider(
                      value: currentScale,
                      min: 0.8,
                      max: 1.4,
                      divisions: 6, // Adjust number of divisions for better granularity
                      label: currentScale.toString(),
                      onChanged: (newScale) {
                        HapticFeedback.lightImpact();
                        responsiveFontSizeController.updateTextScale(newScale);
                      },
                    ),
                  ),
                ],
              );
            }
          );
        }),
      ),
      backgroundColor: ColorResources.getBackgroundColor(context),
    );
  }
}

class RectangularSliderThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(12, 24); // Width and height for the rectangular thumb
  }

  @override
  void paint(
      PaintingContext context, // Updated type
      Offset offset, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required Size sizeWithOverflow,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double textScaleFactor,
        required double value,
      }) {
    final Paint paint = Paint()..color = sliderTheme.thumbColor!;
    final Rect rect = Rect.fromCenter(center: offset, width: 6, height: 24);
    context.canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(2)), paint); // Rounded corners for a softer rectangular look
  }
}