# ☀️ Weather App

Um aplicativo móvel simples e moderno desenvolvido em Flutter para buscar e exibir as condições climáticas atuais com base na localização geográfica do usuário.

## ✨ Funcionalidades

* **Localização Automática:** Usa a geolocalização do dispositivo (Latitude e Longitude) para obter o clima da cidade atual.
* **Dados de Clima em Tempo Real:** Integração com a API **OpenWeather Map** para dados precisos.
* **Design Moderno:** Interface de usuário minimalista com animações Lottie dinâmicas que refletem a condição do clima (sol, chuva, nuvens, etc.).
* **Atualização Rápida:** Botão de *refresh* na AppBar para buscar novos dados de clima a qualquer momento.
* **Temperatura em Celsius:** Exibe a temperatura na unidade métrica (`ºC`).

## 🛠️ Tecnologias Utilizadas

* **Framework:** Flutter
* **Linguagem:** Dart
* **API:** [OpenWeather Map (Current Weather Data 2.5)](https://openweathermap.org/api)
* **Localização:** `geolocator` e `geocoding`
* **Animações:** `lottie`

## 🚀 Como Executar o Projeto

Siga os passos abaixo para clonar e rodar o aplicativo na sua máquina local.

### Pré-requisitos

Certifique-se de ter instalado:
* [Flutter SDK](https://flutter.dev/docs/get-started/install)
* Um IDE (VS Code ou Android Studio)
* Um emulador ou dispositivo físico para rodar o app.

### Configuração da API Key

1.  Obtenha uma chave de API gratuita no [OpenWeather Map](https://openweathermap.org/).
2.  Abra o arquivo `lib/services/weather_service.dart`.
3.  Substitua o placeholder da `apiKey` pela sua chave:

    ```dart
    // lib/services/weather_service.dart
    final _weatherService = WeatherService('SUA_CHAVE_AQUI'); 
    ```

### Instalação

1.  **Clone o Repositório:**
    ```bash
    git clone [https://github.com/SEU_USUARIO/weather_app.git](https://github.com/SEU_USUARIO/weather_app.git)
    cd weather_app
    ```

2.  **Instale as Dependências:**
    ```bash
    flutter pub get
    ```

3.  **Execute o Aplicativo:**
    ```bash
    flutter run
    ```
    *Obs: Certifique-se de que seu dispositivo ou emulador tenha o GPS/Localização ativado.*

### Configuração de Ícone (Se você usou a automação)

Se você usou o pacote `flutter_launcher_icons`, para atualizar o ícone após a clonagem, execute:

```bash
flutter pub run flutter_launcher_icons:main
