# Boxotop

iOS application to search movies and add personal review

## Quickstart

[CocoaPods](https://cocoapods.org/) is required to install dependences
Install dependencies : 
```
pod install
```
and execute `Boxotop.xcworkspace`

## API

Application use [omdbapi]( ​http://www.omdbapi.com/​) service to load datas.
You must set your `OMDB_API_KEY` in environment variables (Edit Scheme > Arguments) with your own API Token

## Dependances
- [Alamofire](https://github.com/Alamofire/Alamofire) : To manage HTTP calls
- [AlertToast](https://github.com/elai950/AlertToast) : To show elegant alert and toast