<template>
    <div class="admin-list">		
			<div style="margin-bottom:30px">	
				<el-breadcrumb separator="/">
				<el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
				<el-breadcrumb-item>游戏管理</el-breadcrumb-item>
				<el-breadcrumb-item>游戏列表</el-breadcrumb-item>			
			</el-breadcrumb>				
			</div>		
		
		
<el-form :inline="true"  class="demo-form-inline">
  <el-form-item >
    <el-input v-model="goods_name" placeholder="筛选游戏名称"></el-input>
  </el-form-item>
	  <el-form-item >
    <el-button type="primary" @click="search">查询</el-button>
  </el-form-item>
		
		
		<router-link to="/admin/goods-form">
		<el-button type="success">新增游戏</el-button>
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
            <el-table-column
                type="selection">
            </el-table-column>
					<el-table-column label="图标" width="75" >
						<template scope="scope">
								<img :src="scope.row.imgs" style="width: 38px; height: 38px;"/>
						</template>
					</el-table-column>
          <el-table-column prop="goods_name" width="120" label="商品名"></el-table-column>
					<el-table-column prop="app_id" width="180" label="APPID"></el-table-column>
                                <el-table-column label="分成">
				<template scope="scope">
				  {{ scope.row.goods_price }}
				</template>
				</el-table-column>
				<el-table-column prop="goods_typename" label="类型"></el-table-column>
				<el-table-column prop="parter_name" label="合作商" width="120"></el-table-column>
				<el-table-column prop="run_count" label="启动次数" width="100"></el-table-column>


<el-table-column width="160" label="添加日期">
	<template scope="scope">
                    <el-icon name="time"></el-icon>
                    <span style="margin-left: 10px">{{ scope.row.create_time }}</span>
                </template>
</el-table-column>




<el-table-column label="操作" width="160">
	<template scope="scope">
                    <el-button
                        size="small"
                        @click="editGoods(scope.row)">修改
                    </el-button>
                    <el-button
                        size="small"
                        type="danger"
                        @click="handleDelete(scope.row)">删除
                    </el-button>
                </template>
</el-table-column>

</el-table>

<div class="pagination">

	<el-pagination @current-change="handleCurrentChange" layout="prev, pager, next" :total="10">
	</el-pagination>
</div>

</div>
</template>

<script>
export default {
  name: "list",
  data() {
    return {
      tableData: [],
      cur_page: 1,
      goods_name: "",

      multipleSelection: [],

      load: false // loading
    };
  },

  methods: {
    fetchList() {
      this.load = true;
      var reqParams = {
        goods_name: this.goods_name,
        cur_page: this.cur_page
      };

      this.func.ajaxPost(this.api.goodsList, reqParams, res => {
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
    // 删除
    handleDelete(row) {
      this.func.ajaxPost(
        this.api.goodsDelete,
        {
          goods_id: row.goods_id
        },
        res => {
          if (res.data.code === 200) {
            let index = this.tableData.indexOf(row);
            this.tableData.splice(index, 1);
            this.$message.success("删除成功");
          }
        }
      );
    },

    // 修改
    editGoods(row) {
      this.$router.push({
        path: "/admin/goods-form",
        query: {
          goods_id: row.goods_id
        }
      });
    },

    handleSelectionChange(val) {
      this.multipleSelection = val;
    }
  },

  created() {
    this.fetchList();
  }
};
</script>
