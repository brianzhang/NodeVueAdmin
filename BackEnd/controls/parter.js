let sql = require('../sql/sql');
let moment = require('moment');
let bcrypt = require('bcryptjs');
let func = require('../sql/func');
let mysql = require('mysql');
let utils = require('../utils/utils');
let formatData = utils.formatData;

module.exports = {
  fetchAll (req, res) {
    let cur_page =req.body.cur_page;
    let parter_name =req.body.parter_name;
    let is_all = req.body.is_all
    let sql, arr ,endLimit ,startLimit;

    endLimit = cur_page * 20;
    startLimit =  endLimit - 20;
    
    if(parter_name){
      sql ='select * from parters where parter_name =? ';
      arr = [parter_name];  
    }else{
      if (is_all) {
        sql ='select * from parters';
      } else {
        sql ='select * from parters limit ?, ?';
        arr = [startLimit, endLimit];
      }
    }
    func.connPool(sql, arr, (err, rows) => {
			rows = formatData(rows);
			res.json({
				code: 200,
				msg: 'ok',
				resultList: rows
			});
		});
  },
  fetchById (req, res) {
    let parter_id = req.body.parter_id;
		let sql = 'select * from parters WHERE parter_id = ?';
    let arr = [parter_id];
    func.connPool(sql, arr, (err, rows) => {
			rows = formatData(rows);
			res.json({
				code: 200,
				msg: 'ok',
				resultList: rows[0]
			});
		});
  },
  addOne (req, res) {
    let parter_id = req.body.parter_id;
    let parter_name = req.body.parter_name;
    let parter_contacts = req.body.contacts;
    let mobile = req.body.mobile;
    let wechat = req.body.wechat;
    let web_site = req.body.web_site;
    let sql, arr;
    arr = [parter_name, parter_contacts, mobile, wechat, web_site];
    if (parter_id) {
      sql = 'UPDATE parters SET parter_name=?, contacts=?, mobile=?, wechat=?, web_site=?, update_time=?';
      arr.push((new Date()));
    } else {
      sql = 'INSERT INTO parters(parter_name, contacts, mobile, wechat, web_site) VALUES(?,?,?,?,?)';
    }
    func.connPool(sql, arr, (err, rows) => {
			res.json({
				code: 200,
				msg: 'done'
			});
		});
  },
  deleteOne (req, res) {
    let parter_id = req.body.parter_id;
		let sql = 'DELETE  from parters WHERE parter_id =?';
	
		let arr = [parter_id];

		func.connPool(sql, arr, (err, rows) => {
			res.json({
				code: 200,
				msg: 'done'
			});
		});
  },
  deleteMulti (req, res) {
    let parter_id = req.body.parter_id;
		let sql = 'DELETE  from parters WHERE parter_id in ?';
	
		let arr = [[parter_id]];

		func.connPool(sql, arr, (err, rows) => {
			res.json({
				code: 200,
				msg: 'done'
			});
		});
  }
}