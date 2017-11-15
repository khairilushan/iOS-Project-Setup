# KU-iOS-Project-Setup

This is my new basic setup for iOS project.

## Architecture
VIPER

## Dependencies
- RxSwift 4.0 : For reactive programming
- RxCocoa 4.0 : Cocoa framework extension for Reactive stuff
- Swinject 2.1.0 : Dependency Injection
- Alamofire 4.4 : Networking
- Moya : Provide abstract layer of our networking
- Gloss 2.0.0-beta.2 : JSON parser
- RealmSwift : For database
- IGListKit : To maintain UICollectionView

This is also my learning project. So you could find some mistakes from my code, such as my VIPER implementation,how I use Swinject for dependency injection or even how I create my base network layer. 
Please share with me you thoughts.

## Resources
- VIPER : https://blog.mindorks.com/building-ios-app-with-viper-architecture-8109acc72227
- Modularizing component/ dependencies : https://github.com/Swinject/Swinject/blob/master/Documentation/Assembler.md
- Clean Architecture (Inspired from an Android project): https://github.com/android10/Android-CleanArchitecture-Kotlin
- IGListKit : https://academy.realm.io/posts/tryswift-ryan-nystrom-refactoring-at-scale-lessons-learned-rewriting-instagram-feed/
