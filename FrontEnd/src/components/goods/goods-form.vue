<template>
  <el-form ref="form" :model="form" label-width="80px" class="form-contain">
		<el-form-item label="游戏名称">
				<el-input v-model="form.goods_name"></el-input>
		</el-form-item>
		<el-form-item label="小程序ID">
			<el-input placeholder="请输入内容" v-model="form.app_id" @blur="blurCheck">
				<template slot="append">APPID</template>
			</el-input>
		</el-form-item>
		<el-form-item label="统计地址">
				<el-input v-model="form.open_url"></el-input>
		</el-form-item>
		<el-form-item label="合作商">	  
			<el-select v-model="form.parter_name" placeholder="请选择游戏合作商">
				<el-option
					v-for="item in parterList"
					:key="item.parter_name"
					:label="item.parter_name"
					:value="item.parter_name">
				</el-option>
			</el-select>    
		</el-form-item>
		<el-form-item label="分成价">
			<el-input placeholder="请输入内容" v-model="form.goods_price" type='number'>
				<template slot="append">元</template>
			</el-input>
		</el-form-item>

		<el-form-item label="访问量">
			<el-input-number v-model="form.inventory" :min="0"></el-input-number>
		</el-form-item>

		<el-form-item label="游戏类型">	  
			<el-select v-model="form.goods_typename" multiple collapse-tags placeholder="请选择游戏类型">
				<el-option
					v-for="item in goodsTpyeList"
					:key="item.goods_typename"
					:label="item.goods_typename"
					:value="item.goods_typename">
				</el-option>
			</el-select>    
		</el-form-item>
		<el-form-item label="上架状态">
			<el-radio-group v-model="form.onsale">
				<el-radio :label="0">下架</el-radio>
				<el-radio :label="1">上架</el-radio>
			</el-radio-group>
		</el-form-item>
		<el-form-item label="是否推荐">
			<el-radio-group v-model="form.recommend">
				<el-radio :label="0">否</el-radio>
				<el-radio :label="1">是</el-radio>
			</el-radio-group>
		</el-form-item>
		<el-form-item label="详情">
			<el-input type="textarea" :rows="3" placeholder="请输入内容" v-model="form.goods_details"></el-input>
		</el-form-item>
		<el-form-item label="色阶">
			<div class="el-col el-col-6 el-col-xs-12" style="padding-left: 6px; padding-right: 6px;">
				<div class="demo-color-box" ref="bgColor" :style="{backgroundImage: '-webkit-linear-gradient(90deg, '+form.color2+', '+form.color1+')'}">
					<span>{{form.color1}}-{{form.color2}}</span>
				</div>
			</div>
			<el-color-picker v-model="form.color1"></el-color-picker>
			<el-color-picker v-model="form.color2"></el-color-picker>
		</el-form-item>
		<el-form-item label="上传ICON">
			<el-upload
				action="https://netmad.me/upload"
				list-type="picture-card"
				name="smfile"
				:data="{ssl: true, format: 'json'}"
				:on-preview="handlePictureCardPreview"
				:on-success="uploadSuccess"
				:on-remove="handleRemove">
				<i class="el-icon-plus"></i>
			</el-upload>
			<el-dialog v-model="dialogVisible" size="tiny">
				<img width="100%" :src="dialogImageUrl" alt="">
			</el-dialog>
		</el-form-item>

		<el-form-item label="上传小程序二维码">
			<el-upload
				action="https://netmad.me/upload"
				list-type="picture-card"
				name="smfile"
				:data="{ssl: true, format: 'json'}"
				:on-preview="handlePictureCardQRPreview"
				:on-success="uploadQRSuccess"
				:on-remove="handleQRRemove">
				<i class="el-icon-plus"></i>
			</el-upload>
			<el-dialog v-model="dialogVisible" size="tiny">
				<img width="100%" :src="qrImageUrl" alt="">
			</el-dialog>
		</el-form-item>

		<el-form-item>
			<el-button type="primary" @click="onSubmit">{{isNew ? '添加' : '修改'}}</el-button>
			<el-button @click="onCancel">取消</el-button>
		</el-form-item>

	</el-form>
</template>

<script>
export default {
  name: "form",

  data() {
    return {
			isNew: 1, // 是否是添加
      form: {
        goods_id: undefined,
        goods_name: "",
				goods_price: 0,
				app_id: '',
				parter_name: '',
        onsale: "",
        inventory: 0,
        imgs: "",
        goods_type: "",
				goods_typename: [],
				color1: '#000',
				color2: '#FFF',
				open_url: '',
				recommend: 0,
				qr_url: ''
			},
			parterList: "",
      goodsTpyeList: "",
			dialogImageUrl: "",
			qrImageUrl: '',
			dialogVisible: false,
			isSubmit: true
    };
  },

  methods: {
		blurCheck () {
			this.func.ajaxPost(this.api.goodsAppIdCheck, {app_id: this.form.app_id}, res => {
        if (!res.data.check_status) {
					this.$message.error("APP_ID已存在！");
					this.isSubmit = false
        }
      });
		},
    onSubmit() {
      if (!this.form.goods_name) {
        this.$message.warning("请填写完整信息");
        return;
      }
			this.form.goods_typename = this.form.goods_typename.join(' ')
      this.func.ajaxPost(this.api.goodsAdd, this.form, res => {
        if (res.data.code === 200) {
          this.$message.success("操作成功");
          this.$router.push("/admin/goods-list");
        }
      });
    },
		uploadSuccess (response, file, fileList) {
			console.log(response);
			if (response.code === 'success') {
				this.form.imgs = response.data.url
			}
		},
		uploadQRSuccess (response, file, fileList) {
			if (response.code === 'success') {
				this.form.qr_url = response.data.url
			}
		},
    goodsType() {
      this.func.ajaxPost(this.api.goodsType, this.form, res => {
        if (res.data.code === 200) {
          this.goodsTpyeList = res.data.resultList;
        }
      });
    },

		queryParterList () {
			this.func.ajaxPost(this.api.parterList, {cur_page: 1, is_all: true}, res => {
				if (res.data.code === 200) {
					this.parterList = res.data.resultList
				}
			})
		},

    onCancel() {
      this.$router.push("/admin/goods-list");
    },

    handleRemove(file, fileList) {
      console.log(file, fileList);
		},
		handleQRRemove(file, fileList) {
      console.log(file, fileList);
    },
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url;
      this.form.imgs = file.url;
		},
		handlePictureCardQRPreview(file) {
      this.qrImageUrl = file.url;
      this.form.qr_url = file.url;
    }
  },

  created() {
    let goods_id = this.$route.query.goods_id;

    if (goods_id) {
      this.isNew = 0;

      this.func.ajaxPost(
        this.api.goodsDetail,
        {
          goods_id
        },
        res => {
					this.form = res.data.resultList;
					this.form.goods_typename = this.form.goods_typename.split(' ')
					this.form.goods_id = res.data.resultList.goods_id;
					
					this.dialogImageUrl = this.from.imgs
					this.qrImageUrl = this.from.qr_url
        }
      );
    }

		this.goodsType();
		this.queryParterList();
	}
};
</script>
<style>
	.demo-color-box {
		border-radius: 4px;
    padding: 5px 10px;
    margin: 5px 0;
    height: 74px;
    box-sizing: border-box;
    color: #fff;
    font-size: 14px;
	}
</style>
