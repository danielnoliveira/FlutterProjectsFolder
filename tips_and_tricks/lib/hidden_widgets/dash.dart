class Dash {
  bool isVisible;
  final String url;

  Dash({required this.url}) : isVisible = true;

  static Dash withToastInHand() => Dash(url: 'https://bit.ly/3gHlTCU');
  static Dash hipsterDash() => Dash(url: 'https://bit.ly/3wOLO1c');
  static Dash withRedAttire() => Dash(url: 'https://bit.ly/3cXWD9j');
  static Dash wizard() => Dash(url: 'https://bit.ly/3gT5Qk2');

  static List<Dash> get all => [
        Dash.withToastInHand(),
        Dash.hipsterDash(),
        Dash.withRedAttire(),
        Dash.wizard(),
      ];
}
