class FlemmeConfig {
  static final FlemmeConfig _singleton = FlemmeConfig._internal();

  factory FlemmeConfig() {
    return _singleton;
  }

  FlemmeConfig._internal() {
    _flemmePadding = FlemmePadding();
  }

  late FlemmePadding _flemmePadding;

  FlemmePadding getPaddingConfig() {
    return _flemmePadding;
  }
}

class FlemmePadding {
  static final FlemmePadding _singleton = FlemmePadding._internal();

  factory FlemmePadding() {
    return _singleton;
  }

  FlemmePadding._internal();

  int paddingAllSM = 4;
  int paddingAllS = 8;
  int paddingAllM = 12;
  int paddingAllL = 20;
  int paddingAllXL = 32;
}
