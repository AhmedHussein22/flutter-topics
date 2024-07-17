enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

//* Name of the flavor
  static String get name => appFlavor?.name ?? '';

  //* base url for the api
  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://dev.example.com';
      case Flavor.prod:
        return 'https://prod.example.com';
      default:
        return 'https://example.com';
    }
  }

  //* payment key for the api
  static String get paymentKey {
    switch (appFlavor) {
      case Flavor.dev:
        return 'dev_payment_key';
      case Flavor.prod:
        return 'prod_payment_key';
      default:
        return 'payment_key';
    }
  }

  //* title of the app
  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'AppName Dev';
      case Flavor.prod:
        return 'AppName';
      default:
        return 'title';
    }
  }
}
