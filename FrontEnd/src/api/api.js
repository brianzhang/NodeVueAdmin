// let baseUrl = 'https://netmad.me/api';
let baseUrl ='http://127.0.0.1:9000/api';

module.exports = {
   

    // user
    userList: baseUrl + '/user/list',
    userDelete: baseUrl + '/user/delete',
    userAdd: baseUrl + '/user/add',
    userDeleteMulti: baseUrl + '/user/delete-multi',
    userLogin: baseUrl + '/user/login',
    userLogout: baseUrl + '/user/logout',
    userAutoLogin: baseUrl + '/user/auto-login',
    userChangeRole: baseUrl + '/user/change-role',
	
	
	
 // member
    memberList: baseUrl + '/member/list',
    memberDetail: baseUrl + '/member/detail',
    memberDelete: baseUrl + '/member/delete',
    memberAdd: baseUrl + '/member/add',
    memberDeleteMulti: baseUrl + '/member/delete-multi',
    memberChangeRole: baseUrl + '/member/change-role',
	
	
	// goodstype
    goodstypeList: baseUrl + '/goodstype/list',
    goodstypeDetail: baseUrl + '/goodstype/detail',
    goodstypeDelete: baseUrl + '/goodstype/delete',
    goodstypeAdd: baseUrl + '/goodstype/add',
   

	
	 // goods
    goodsList: baseUrl + '/goods/list',	
	goodsType:baseUrl + '/goods/fetchType',	
    goodsDetail: baseUrl + '/goods/detail',
    goodsDelete: baseUrl + '/goods/delete',
    goodsAdd: baseUrl + '/goods/add',
    goodsDeleteMulti: baseUrl + '/goods/delete-multi',
    goodsUploadImg: baseUrl + '/goods/upload-img',
	
	
		
	 // order
    orderList: baseUrl + '/order/list',	
    orderDetail: baseUrl + '/order/detail',
    orderDelete: baseUrl + '/order/delete',
    orderAdd: baseUrl + '/order/add',

    
    // parter
    parterList: baseUrl + '/parter/list', //
    parterAdd: baseUrl + '/parter/add',
    parterDetail: baseUrl + '/parter/detail',
    parterDelete: baseUrl + '/parter/delete',
    parterDeleteMulti: baseUrl + '/parter/delete-multi',
    
    // log
    memberLog: baseUrl + '/member/logs', // 用户登陆日志
    setStartLog: baseUrl + '/goods/logs/add' // 开始游戏记录
};
