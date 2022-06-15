library abstarct_fabric;

abstract class Button {
  final String title;

  Button(this.title);
  void paint();
}

abstract class CheckBox {
  final bool select;

  CheckBox(this.select);
  void create();
}

abstract class AbstractFactory {

  AbstractFactory();
  Button button(String title);
  CheckBox checkBox(bool select);
}

class TextButton extends Button {
  TextButton(String title) : super(title);

  @override
  void paint() {
    print('Create text button with title $title');
  }
}

class TextCheckBox extends CheckBox {
  TextCheckBox(bool select) : super(select);

  @override
  void create() {
    print('Create text checkbox with selected $select');
  }
}

class GraphButton extends Button {
  GraphButton(String title) : super(title);

  @override
  void paint() {
    print('Create graph button with title $title');
  }
}

class GraphCheckBox extends CheckBox {
  GraphCheckBox(bool select) : super(select);

  @override
  void create() {
    print('Create graph check box with selected $select');
  }
}

class TextFactory extends AbstractFactory {
  @override
  Button button(String title) {
    return TextButton(title);
  }

  @override
  CheckBox checkBox(bool select) {
    return TextCheckBox(select);
  }
}

class GraphFactory extends AbstractFactory {
  @override
  Button button(String title) {
    return GraphButton(title);
  }

  @override
  CheckBox checkBox(bool select) {
    return GraphCheckBox(select);
  }

}