# Fastlane 🚀

Fastlane es la forma más fácil de automatizar implementaciones y lanzamientos beta para sus aplicaciones iOS.

## Instalación

Fastlane se puede instalar de múltiples maneras las cuales son por Bundler, Homebrew y Ruby. Pero debemos tener en cuenta la versión de ruby, que tenemos instalada en nuestra maquina debido a que Fastlane exige como mínimo (ruby2.7.2p137).

```bash
$ ruby --version
ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin19]
```

## Instalación por Bundler

Se recomienda que utilice Bundler y Gemfile que defina su dependencia en fastlane . Esto definirá claramente la versión de fastlane que se utilizará y sus dependencias, y también acelerará la ejecución de fastlane. 

* Instalar Bundler ejecutando: gem install bundler
* Crea un ./Gemfile en el directorio raíz de tu proyecto con el contenido

```bash
source "https://rubygems.org"

gem "fastlane"
```
* Ejecute bundle update y agregue tanto el ./Gemfile como el ./Gemfile.lock al control de versiones
* Cada vez que ejecute fastlane, utilice bundle exec fastlane [lane]
* Para actualizar fastlane , simplemente ejecute bundle update fastlane

## Instalación por Homebrew

De esta manera, no tienes que instalar Ruby por separado, sino que homebrew instala la versión de Ruby adecuada para fastlane.

```python
brew install fastlane
```
## Instalación por Ruby
Instalación en el entorno del sistema Ruby.

```python
sudo gem install fastlane
```
## Como usar Fastlane 

En el terminal nos ubicaremos donde tenemos nuestro proyecto y ejecutaremos el siguiente comando.

```python
fastlane lanes
```
Esto nos mostrara donde podemos realizar nuestros lanzamientos betas como se puede evidenciar en el siguiente ejemplo:

```python
--------- ios---------
----- fastlane ios send_version_to_testflight
Push a new beta build to TestFlight

----- fastlane ios send_version_to_app_center
send version to app center
```
De esta manera seleccionaremos el lane de acuerdo a la distribución donde queramos realizar nuestro lanzamiento beta ejemplo (AppCenter o TestFlight), comenzara a realizar la generación del Ipa de forma automática pero debemos tener en cuenta que nuestro Xcode debe estar cerrado.

Posteriormente se enviará un mensaje a Discord notificando que el ipa fue enviado.

## Fastfile 
Fastfile es un archivo que tiene la configuración de nuestro Fastlane, el cuando podemos encontrar en la carpeta fastlane depues de haber instalado Fastlane en nuestro proyecto.

## Configuracion de Fastlane para TestFlight.
Esta configuración la puede encontrar en el archivo de Fastfile de la siguiente manera:
```python
  desc "Push a new beta build to TestFlight"
  lane :send_version_to_testflight do
    build_app(workspace: "Test.xcworkspace", scheme: "Test")
    upload_to_testflight
    send_message_to_discord(from:"To TestFlight")
    git_push
  end
```

## Configuracion de Fastlane para AppCenter.
Esta configuración la puede encontrar en el archivo de Fastfile de la siguiente manera:
```python
 desc "send version to app center"
  lane :send_version_to_app_center do
    build_app(workspace: "Test.xcworkspace", scheme: "Test")
    appcenter_upload(
      api_token: "",
      owner_name: "",
      owner_type: "",
      app_name: "")
      send_message_to_discord(from:"TO APP CENTER")
      git_push
  end
```
## Configuracion de Fastlane para el Build Number
Esta configuración nos permite realizar de forma automática el Build Number de acuerdo a la secuencia que ya esta en AppCenter o TestFlight, la puede encontrar en el archivo de Fastfile de la siguiente manera: 
```python
before_all do |lane|
  cocoapods
  increment_build_number(xcodeproj: "Test.xcodeproj")
end
```
## Fundamental para usar Fastlane en nuestra App Test.
Antes de realizar cualquier lane debemos generar de forma manual un ipa en TestFlight lo que nos permite para la firma de los Provisioning Profile generados en Apple Developer, de esta manera después de haber subido el ipa a TestFlight podemos realizar cualquier lane sin ningún problema.


## Documentación Fastlane
[Fastlane Doc](https://docs.fastlane.tools/)
