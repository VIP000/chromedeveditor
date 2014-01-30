// Copyright (c) 2014, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library git.config;

import 'dart:convert';

class GitConfig {

  String url;
  String shallow;
  Map<String, String> remoteHeads = {};
  DateTime time;

  GitConfig([String configStr]) {
    if (configStr != null) {
      fromJson(configStr);
    }
  }

  void fromMap(Map m) {
    url = m['url'];
    shallow = m['shallow'];
    remoteHeads = m['remoteHeads'];
    time = m['time'];
  }

  Map toMap() {
    return {
      'url': url,
      'shallow': shallow,
      'remoteHeads' : remoteHeads,
      'time' : time,
    };
  }

  void fromJson(String configStr) {
    JsonDecoder decoder = new JsonDecoder(null);
    fromMap(decoder.convert(configStr));
  }

  String toJson() {
    JsonEncoder encoder = new JsonEncoder();
    return encoder.convert(toMap());
  }
}