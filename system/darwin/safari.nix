{
  plist.safari = {
    devTools.enable = true;
  };

  my.hm.config = {
    targets.darwin.currentHostDefaults."com.apple.Safari" = {
      AutoFillPasswords = false;
      AutoFillCreditCardData = false;
    };
  };
}
