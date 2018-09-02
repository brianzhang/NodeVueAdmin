# node-admin #
- 用到的技术栈
- 数据库：mysql + NavicatPremium
- 后端：node + express + mysqljs(node数据库模块)
- 前端: [ front-end ]: vue+ elment-ui + axios + webpack
- 前端: [ front-end(iview2) ] :vue2  + iview2 + axio + webpack2 +echarts
- 小程序 [ small-program ] ： 微信小程序api + ES6-Promise（即将开源）

## 前言 ##
- 后端负责提供接口，操作数据库提供前端所需的数据和状态。
- 前端负责调用接口，添加合作伙伴，用户管理，管理员管理，游戏管理。
- 小程序 负责C端的产品游戏列表展示，用户点击授权数据手机
- APP  （功能同小程序版本）
- 数据库 (MYSQL)


## 功能 ##
- [x] Element UI
- [x] 登录/注销
- [x] 用户管理
- [x] 会员管理(微信用户列表)
- [x] 游戏管理
- [x] 合作方管理
- [x] 跨域
- [x] 数据管理 
- [x] 微信用户信息获取
- [x] 小程序API对接


## front-end(iview2)截图 
  登录界面</br>
![](https://raw.githubusercontent.com/cinoliu/node-admin-/master/front-end(iview2)/Screenshot/login.jpg) 


## 项目运行 ##

```bash
# front-end
npm install
npm run dev
npm run build (需要改 webpage.config.js  下 publicPath: '/' 为   publicPath: './')

localhost:90001

# back-end
npm install
node  app.js
localhost:9000/api/


