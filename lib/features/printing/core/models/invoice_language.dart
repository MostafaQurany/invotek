enum InvoiceLanguage {
  arabic,
  english,
}

extension InvoiceLanguageExtension on InvoiceLanguage {
  String get name {
    switch (this) {
      case InvoiceLanguage.arabic:
        return 'عربي';
      case InvoiceLanguage.english:
        return 'English';
    }
  }
}


