# acessobio_plugin

A new AcessoBio Flutter plugin.

## Getting Started

## IOS


1 - Caso ainda não possua as permissões para o uso de câmera em seu projeto


<key>NSCameraUsageDescription</key>
<string>Camera usage description</string>


2 - Adicionar Versão 9 ou superior

3 - Adicione:  pod ‘AcessoBio’, :git => ‘https://github.com/acesso-io/acessobio-ios’, :tag => ‘1.2.1.1’ no podfile do projeto IOS execute comando pod install

4 - Adicionar #import <AcessoBioManager.h> no arquivo Runner-Bridging-Header.h

5 - No arquivo acessobio_plugin-umbrella.h adicione @import AcessoBio; (path: YOUR_PROJECT/example/ios/Pods/Target Support Files/acessobio_plugin/acessobio_plugin-umbrella.h

6 - no target menbership definir centerModelCrop como publico 


## Android 
1 - Adicionar minSdkVersion : 21