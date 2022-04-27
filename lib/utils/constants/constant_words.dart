

import 'app_enums.dart';

class ConstantTabLabels{
  
}

const Map<BottomNavScreen, String> bottomNavigationIconLabels = {
  BottomNavScreen.home: 'Esasy',
  BottomNavScreen.vendors: 'Dükanlar',
  BottomNavScreen.catalog: 'Kategoriýalar',
  BottomNavScreen.profile: 'Profil',
};

const Map<SearchBarWords, String> searchBarWords = {
  SearchBarWords.searchInStore: 'Elterde gözle...',
  SearchBarWords.searchBy: 'Gözleg sözüni ýazyň!',
  SearchBarWords.searchNotFound: 'Bagyşlaň! Siziň gözleýän harydyňyz tapylmady.'
};



class SortingItemNames {
  static const sortBy = 'Tertiple';
  static const defaultOrder = 'Asyl tertipde';
  static const cheapestFirst = 'Arzandan gymmada';
  static const expensiveFirst = 'Gymmatdan arzana';
  static const bestsellers = 'Köp görlenler';
}

const Map<FilterItems, String> filterItemNames = {
  FilterItems.filterBy: 'Filtrle'
};
