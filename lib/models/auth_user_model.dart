// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dreamtier/models/project_model.dart';
import 'package:flutter/material.dart';

@immutable
class AuthUser {
  final String? id;
  final String? name;
  final String? email;
  final String? bio;
  final String? phone;
  final String? address;
  final String? city;
  final String? state;
  final String? country;
  final String? zip;
  final String? image;
  final List<Project>? projects;
  final List<String>? links;
  final List<String?> interests;

  AuthUser(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.bio,
      this.address,
      this.city,
      this.state,
      this.country,
      this.zip,
      this.links = const [],
      this.projects = const [],
      this.interests = const [],
      this.image});

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
        zip: json['zip'],
        projects: json['projects'] != null
            ? (json['projects'] as List)
                .map((i) => Project.fromJson(i))
                .toList()
            : [],
        links: json['links'] != null ? List<String>.from(json['links']) : [],
        interests: json['interests'] != null
            ? List<String>.from(json['interests'])
            : [],
        image: json['pfp']);
  }

  AuthUser copyWith({
    String? id,
    String? bio,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? city,
    String? state,
    String? country,
    String? zip,
    List<String>? links,
    List<Project>? projects,
    List<String>? interests,
    String? image,
  }) {
    return AuthUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      bio: bio ?? this.bio,
      links: links ?? this.links,
      projects: projects ?? this.projects,
      interests: interests ?? this.interests,
      country: country ?? this.country,
      zip: zip ?? this.zip,
      image: image ?? this.image,
    );
  }
}
