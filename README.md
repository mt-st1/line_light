# LineLight
Rails5から導入されたActionCable(Web socketとRails周りを統合したリアルタイムな双方向通信を実現できるフレームワーク)を用いたLineのようなチャットアプリ

![line_light_demo](https://user-images.githubusercontent.com/26339462/81492802-d7892480-92d5-11ea-9f8f-f2265886ae97.gif)

HerokuにデプロイしたアプリケーションのURL: https://line-light-demo.herokuapp.com

## ローカルサーバー起動方法
```console
bundle install
bundle exec rails db:migrate
bundle exec rails s
```
