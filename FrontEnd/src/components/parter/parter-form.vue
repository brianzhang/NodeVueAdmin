<template>
  <el-form ref="form" :model="form" label-width="120px" class="form-contain">
    <el-form-item label="合作商名称">
      <el-input v-model="form.parter_name"></el-input>
    </el-form-item>
    <el-form-item label="联系人">
      <el-input v-model="form.contacts"></el-input>
    </el-form-item>
    <el-form-item label="电话">
      <el-input v-model="form.mobile"></el-input>
    </el-form-item>
    <el-form-item label="微信">
      <el-input v-model="form.wechat"></el-input>
    </el-form-item>
    <el-form-item label="网址">
      <el-input v-model="form.web_site"></el-input>
    </el-form-item>
    <el-form-item>
	    <el-button type="primary" @click="onSubmit">{{isNew ? '添加' : '修改'}}</el-button>
	    <el-button @click="onCancel">取消</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
	export default {
		name: 'form',

		data() {
			return {
				isNew: 1, // 是否是添加
				form: {
          parter_id: undefined,
					parter_name: '',
					contacts: '',
					mobile:'',
          wechat: '',
          web_site: ''
				}
			}
		},
		methods: {
			onSubmit() {
				if (!this.form.parter_name) {
					this.$message.warning('请填写完整信息');
					return;
				}
        if (!this.form.contacts) {
					this.$message.warning('请填写完整信息');
					return;
        }
        if (!this.form.mobile) {
					this.$message.warning('请填写完整信息');
					return;
				}
				this.func.ajaxPost(this.api.parterAdd, this.form, res => {
					if (res.data.code === 200) {
						this.$message.success('操作成功');
						this.$router.push('/admin/parter-list');
					}
				});
			},

			onCancel() {
				this.$router.push('/admin/parter-list');
			},

		},

		created() {
			let parter_id = this.$route.query.parter_id;

			if (parter_id) {
				this.isNew = 0;

				this.func.ajaxPost(this.api.parterDetail, {
					parter_id
				}, res => {
					this.form = res.data.resultList;
					this.form.parter_id = res.data.resultList.parter_id;
				});
			}
		},

	}

</script>
