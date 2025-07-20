enum BottomBarTab {
  newLoans,
  loans,
  home,
  transactions,
  currency;

  String? get name {
    return switch (this) {
      BottomBarTab.newLoans => 'ახალი სესხი',
      BottomBarTab.loans => 'სესხები',
      BottomBarTab.home => null,
      BottomBarTab.transactions => 'გზავნილები',
      BottomBarTab.currency => 'ვალუტა',
    };
  }
}
