/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Todo type in your schema. */
@immutable
class Todo extends Model {
  static const classType = const _TodoModelType();
  final String id;
  final String? _departure;
  final String? _arrival;
  final String? _description;
  final String? _meetWhere;
  final String? _meetWhen;
  final List<String>? _users;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get departure {
    try {
      return _departure!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get arrival {
    try {
      return _arrival!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get description {
    try {
      return _description!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get meetWhere {
    try {
      return _meetWhere!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get meetWhen {
    try {
      return _meetWhen!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  List<String> get users {
    try {
      return _users!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const Todo._internal({required this.id, required departure, required arrival, required description, required meetWhere, required meetWhen, required users}): _departure = departure, _arrival = arrival, _description = description, _meetWhere = meetWhere, _meetWhen = meetWhen, _users = users;
  
  factory Todo({String? id, required String departure, required String arrival, required String description, required String meetWhere, required String meetWhen, required List<String> users}) {
    return Todo._internal(
      id: id == null ? UUID.getUUID() : id,
      departure: departure,
      arrival: arrival,
      description: description,
      meetWhere: meetWhere,
      meetWhen: meetWhen,
      users: users != null ? List<String>.unmodifiable(users) : users);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Todo &&
      id == other.id &&
      _departure == other._departure &&
      _arrival == other._arrival &&
      _description == other._description &&
      _meetWhere == other._meetWhere &&
      _meetWhen == other._meetWhen &&
      DeepCollectionEquality().equals(_users, other._users);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Todo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("departure=" + "$_departure" + ", ");
    buffer.write("arrival=" + "$_arrival" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("meetWhere=" + "$_meetWhere" + ", ");
    buffer.write("meetWhen=" + "$_meetWhen" + ", ");
    buffer.write("users=" + (_users != null ? _users!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Todo copyWith({String? id, String? departure, String? arrival, String? description, String? meetWhere, String? meetWhen, List<String>? users}) {
    return Todo(
      id: id ?? this.id,
      departure: departure ?? this.departure,
      arrival: arrival ?? this.arrival,
      description: description ?? this.description,
      meetWhere: meetWhere ?? this.meetWhere,
      meetWhen: meetWhen ?? this.meetWhen,
      users: users ?? this.users);
  }
  
  Todo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _departure = json['departure'],
      _arrival = json['arrival'],
      _description = json['description'],
      _meetWhere = json['meetWhere'],
      _meetWhen = json['meetWhen'],
      _users = json['users']?.cast<String>();
  
  Map<String, dynamic> toJson() => {
    'id': id, 'departure': _departure, 'arrival': _arrival, 'description': _description, 'meetWhere': _meetWhere, 'meetWhen': _meetWhen, 'users': _users
  };

  static final QueryField ID = QueryField(fieldName: "todo.id");
  static final QueryField DEPARTURE = QueryField(fieldName: "departure");
  static final QueryField ARRIVAL = QueryField(fieldName: "arrival");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField MEETWHERE = QueryField(fieldName: "meetWhere");
  static final QueryField MEETWHEN = QueryField(fieldName: "meetWhen");
  static final QueryField USERS = QueryField(fieldName: "users");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Todo";
    modelSchemaDefinition.pluralName = "Todos";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.DEPARTURE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.ARRIVAL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.DESCRIPTION,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.MEETWHERE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.MEETWHEN,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.USERS,
      isRequired: true,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
  });
}

class _TodoModelType extends ModelType<Todo> {
  const _TodoModelType();
  
  @override
  Todo fromJson(Map<String, dynamic> jsonData) {
    return Todo.fromJson(jsonData);
  }
}