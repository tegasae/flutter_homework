import 'dart:math';

import 'package:abstract_factory/abstract_factory/lib/factory.dart';

class PixelButton extends Button {
  PixelButton(String title) : super(title);

  @override
  void paint() {
    print('Create pixel button with title $title');
  }
}

class PixelCheckBox extends CheckBox {
  PixelCheckBox(bool select) : super(select);

  @override
  void create() {
    print('Create pixel checkbox with selected $select');
  }
}

class PixelFactory extends AbstractFactory {
  @override
  Button button(String title) {
    return PixelButton(title);
  }

  @override
  CheckBox checkBox(bool select) {
    return PixelCheckBox(select);
  }

}


main() {
  AbstractFactory abstractFactory;
  Button button;
  CheckBox checkBox;

  int intValue = Random().nextInt(100);
  print('abstract factory');

  if (intValue>50) {
    abstractFactory=TextFactory();
  } else {
    if (intValue>70) {
      abstractFactory = GraphFactory();
    } else {
      abstractFactory=PixelFactory();
    }
  }

  button=abstractFactory.button('Tttle');
  checkBox=abstractFactory.checkBox(true);
  button.paint();
  checkBox.create();

}