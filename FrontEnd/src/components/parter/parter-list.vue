<template>
  <div class="admin-list">
    <div style="margin-bottom:30px">	
      <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>合作管理</el-breadcrumb-item>
        <el-breadcrumb-item>合作列表</el-breadcrumb-item>
      </el-breadcrumb>
	  </div>
    <el-form :inline="true"  class="demo-form-inline">
      <el-form-item >
        <el-input v-model="parter_name" placeholder="合作商名称"></el-input>
        </el-form-item>
          <el-form-item >
        <el-button type="primary" @click="search">查询</el-button>
      </el-form-item>	
      <router-link to="/admin/parter-form">
        <el-button type="success">新增合作</el-button>
      </router-link>
    </el-form>
    <el-table
      v-loading='load'
      ref="multipleTable"
      @selection-change="handleSelectionChange"
      :data="tableData"
      border
      tooltip-effect="dark"
      style="width: 100%">
      <el-table-column type="selection"></el-table-column>
      <el-table-column prop="parter_name" label="合作商名称"></el-table-column>
      <el-table-column prop="contacts" label="联系人"></el-table-column>
      <el-table-column prop="mobile" label="手机号"></el-table-column>
      <el-table-column prop="wechat" label="微信"></el-table-column>
      <el-table-column prop="web_site" label="网址"></el-table-column>
      <el-table-column sortable width="160" label="添加日期">
        <template scope="scope">
          <el-icon name="time"></el-icon>
          <span style="margin-left: 10px">{{ scope.row.create_time }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="300">
        <template scope="scope">
          <el-button size="small" @click="editMember(scope.row)">修改</el-button>
          <el-button size="small" type="danger" @click="handleDelete(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  <div class="pagination">
    <el-pagination @current-change="handleCurrentChange" layout="prev, pager, next" :total="500">
    </el-pagination>
  </div>

  </div>
</template>

<script>
	export default {
		name: 'list',
		data() {
			return {
				tableData: [],
				cur_page: 1,
				parter_name: '',
				multipleSelection: [],
				curRow: null,
				load: false, // loading
			}
		},

		methods: {
			//会员转换
			formatLevel: function(row, column) {
				return row.membership_level == 1 ? '普通会员' : row.membership_level == 10 ? '金牌会员' : row.membership_level == 100 ? 'VIP会员' : '未知';
			},

			//列表数据
				
			fetchList() {
			 this.load = true;
				var reqParams ={
					parter_name: this.parter_name,
					cur_page: this.cur_page,
				};
        this.func.ajaxPost(this.api.parterList,reqParams,res => {
            this.tableData = res.data.resultList;
            this.load = false;
        });
			},	
			//分页
			handleCurrentChange(val) {
				this.cur_page = val;
				this.fetchList();
			},
			//搜索
			search() {
				this.fetchList();
			},
			// 修改
			editMember(row) {
				console.log(row);
				this.$router.push({
					path: '/admin/parter-form',
					query: {
						parter_id: row.parter_id
					}
				});
			},
			// 删除
			handleDelete(row) {
				this.func.ajaxPost(this.api.parterDelete, {
					parter_id: row.parter_id
				}, res => {
					if (res.data.code === 200) {
						let index = this.tableData.indexOf(row);
						this.tableData.splice(index, 1);
						this.$message.success('删除成功');
					}
				});
			},

			// 修改
			changeRole(val) {
				this.func.ajaxPost(this.api.memberChangeRole, {
						change_role: val,
						parter_id: this.curRow.parter_id
					},
					res => {
						if (res.data.code === 200) {
							this.$message.success('成功');
							this.fetchList();
						}
					}
				);
			},
			handleSelectionChange(val) {
				this.multipleSelection = val;
			}
		},

		created() {
			this.fetchList();
		},


	}

</script>
