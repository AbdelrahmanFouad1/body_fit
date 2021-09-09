abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppOnBoardingState extends AppStates {}

class AppUserTypeState extends AppStates {}

class AppUserDataLoadingState extends AppStates {}

class AppCalculateLoadingState extends AppStates {}

class AppCalculateSuccessState extends AppStates {}

class AppUserDataSuccessState extends AppStates {}

class AppUserDataErrorState extends AppStates {
  String onError;
  AppUserDataErrorState(this.onError);
}

class AppUserDropDownState extends AppStates {}

class AppUserLanguageState extends AppStates {}

class AppAdLoadingState extends AppStates {}

class AppAdSuccessState extends AppStates {}

class AppAdErrorState extends AppStates {
  String onError;
  AppAdErrorState(this.onError);
}

class AppAdBannerSuccessState extends AppStates {}

class AppAdBannerErrorState extends AppStates {}
