import 'package:flutter/material.dart';
import 'package:homelist/generated/assets.gen.dart';
import 'package:homelist/models/list/list_item.dart';

class IconsHelper {
  IconsHelper._();

  static Image getIcon(IconNames? iconName) {
    switch (iconName) {
      case IconNames.vegetables:
        return Assets.icons.vegetables.image(fit: BoxFit.contain);
      case IconNames.fruits:
        return Assets.icons.fruits.image(fit: BoxFit.contain);
      case IconNames.dairy:
        return Assets.icons.dairyProducts.image(fit: BoxFit.contain);
      case IconNames.todo:
        return Assets.icons.todo.image(fit: BoxFit.contain);
      default:
        return Assets.icons.vegetables.image(fit: BoxFit.contain);
    }
  }
}
