// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NoteStore on _NoteStoreBase, Store {
  final _$titleAtom = Atom(name: '_NoteStoreBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$colorAtom = Atom(name: '_NoteStoreBase.color');

  @override
  int get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(int value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  final _$dateHourAtom = Atom(name: '_NoteStoreBase.dateHour');

  @override
  String get dateHour {
    _$dateHourAtom.reportRead();
    return super.dateHour;
  }

  @override
  set dateHour(String value) {
    _$dateHourAtom.reportWrite(value, super.dateHour, () {
      super.dateHour = value;
    });
  }

  final _$textContentAtom = Atom(name: '_NoteStoreBase.textContent');

  @override
  String get textContent {
    _$textContentAtom.reportRead();
    return super.textContent;
  }

  @override
  set textContent(String value) {
    _$textContentAtom.reportWrite(value, super.textContent, () {
      super.textContent = value;
    });
  }

  final _$typeAtom = Atom(name: '_NoteStoreBase.type');

  @override
  int get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(int value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$_NoteStoreBaseActionController =
      ActionController(name: '_NoteStoreBase');

  @override
  void setColor(int color) {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
        name: '_NoteStoreBase.setColor');
    try {
      return super.setColor(color);
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(dynamic text) {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
        name: '_NoteStoreBase.setTitle');
    try {
      return super.setTitle(text);
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTextContent(dynamic text) {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
        name: '_NoteStoreBase.setTextContent');
    try {
      return super.setTextContent(text);
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
color: ${color},
dateHour: ${dateHour},
textContent: ${textContent},
type: ${type}
    ''';
  }
}
