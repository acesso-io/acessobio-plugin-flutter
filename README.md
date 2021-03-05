# acessobio_plugin

A new AcessoBio Flutter plugin.

## Getting Started

## IOS


1 - Adicionar Versão 9 ou superior

2 - Adicione:  pod ‘AcessoBio’, :git => ‘https://github.com/acesso-io/acessobio-ios’, :tag => ‘1.2.1.1’ no podfile do projeto IOS execute comando pod install

3 - Adicionar #import <AcessoBioManager.h> no arquivo Runner-Bridging-Header.h

4 - No arquivo acessobio_plugin-umbrella.h adicione @import AcessoBio; (path: YOUR_PROJECT/example/ios/Pods/Target Support Files/acessobio_plugin/acessobio_plugin-umbrella.h

5 - no target menbership definir centerModelCrop como publico 


## Android 
1 - Adicionar minSdkVersion : 21