import 'dart:math';

List<double> results = [];

double bmiCalc(var height, var weight) {
  height = height / 100;
  height *= height;
  return weight / height;
}

late double bfResult;

double bfCalc(var waist, var neck, var height, bool male, var hip) {
  if (male == true) {
    bfResult = 495 /
            (1.0324 -
                0.19077 * (log(waist - neck) / ln10) +
                0.15456 * (log(height) / ln10)) -
        450;
  } else {
    bfResult = 495 /
            (1.29579 -
                0.35004 * (log(waist + hip - neck) / ln10) +
                0.22100 * (log(height) / ln10)) -
        450;
  }

  return bfResult;
}

double bmrCalc(var weight, var bodyFat) {
  return 370 + (21.6 * (weight * (100 - (bodyFat))) / 100);
}

double whrCalc(var height, var waist) {
  return waist / height;
}

double tdeeCalc(var bmrResult, int index) {

  switch (index) {
    case 0:
      {

        return bmrResult * 1.2;

      }

      case 1:
      {

        return
          bmrResult * 1.375;
      }
      case 2:
      {

        return bmrResult * 1.55;
      }case 3:
      {

        return bmrResult * 1.725;
      }
      case 4:
      {

        return bmrResult * 1.9;
      }
  }
  return bmrResult * 1;
}
