class CurrentFiscalYearTransactionDetails {
  int _transaction_process;
  int _transaction_type;
  String _thaili_aanka;
  String _thaili_aanka_ownership;
  int _transaction_type_ownership;
  DateTime _transaction_date;
  String _extre_expenses;

  CurrentFiscalYearTransactionDetails();

  int get transaction_process => _transaction_process;

  set transaction_process(int value) {
    if (value >= 1 && value <= 20) {
      this._transaction_process = value;
    }
  }

  int get transaction_type => _transaction_type;

  set transaction_type(int value) {
    if (value >= 1 && value <= 20) {
      _transaction_type = value;
    }
  }

  String get thaili_aanka => _thaili_aanka;


  String get extre_expenses => _extre_expenses;

  set extre_expenses(String value) {
    _extre_expenses = value;
  }

  DateTime get transaction_date => _transaction_date;

  set transaction_date(DateTime value) {
    _transaction_date = value;
  }

  int get transaction_type_ownership => _transaction_type_ownership;

  set transaction_type_ownership(int value) {
    if (value >= 1 && value <= 20) {
      _transaction_type_ownership = value;
    }
  }

  String get thaili_aanka_ownership => _thaili_aanka_ownership;

  set thaili_aanka_ownership(String value) {
    _thaili_aanka_ownership = value;
  }

  set thaili_aanka(String value) {
    _thaili_aanka = value;
  }
}
