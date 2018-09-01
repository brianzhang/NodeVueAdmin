let moment = require('moment');
let formatData = (rows)=> {
	return rows.map(row => {
		let date = moment(row.create_time).format('YYYY-MM-DD');
		return Object.assign({}, row, {
			create_time: date
		});
	});
}

module.exports = {
  formatData
}