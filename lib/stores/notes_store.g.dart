// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotesStore on _NotesStoreBase, Store {
  final _$_searchAtom = Atom(name: '_NotesStoreBase._search');

  @override
  String get _search {
    _$_searchAtom.reportRead();
    return super._search;
  }

  @override
  set _search(String value) {
    _$_searchAtom.reportWrite(value, super._search, () {
      super._search = value;
    });
  }

  final _$_NotesStoreBaseActionController =
      ActionController(name: '_NotesStoreBase');

  @override
  dynamic search(String text) {
    final _$actionInfo = _$_NotesStoreBaseActionController.startAction(
        name: '_NotesStoreBase.search');
    try {
      return super.search(text);
    } finally {
      _$_NotesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
