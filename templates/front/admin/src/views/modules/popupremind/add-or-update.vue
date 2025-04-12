<template>
	<div class="addEdit-block">
		<el-form
			class="add-update-preview"
			ref="ruleForm"
			:model="ruleForm"
			:rules="rules"
			label-width="180px"
		>
			<template >
				<el-form-item class="input" v-if="type!='info'"  label="标题" prop="title" >
					<el-input v-model="ruleForm.title" placeholder="标题" clearable  :readonly="ro.title"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="标题" prop="title" >
					<el-input v-model="ruleForm.title" placeholder="标题" readonly></el-input>
				</el-form-item>
				<el-form-item class="select" v-if="type!='info'"  label="类型" prop="type" >
					<el-select :disabled="ro.type" v-model="ruleForm.type" placeholder="请选择类型" >
						<el-option
							v-for="(item,index) in typeOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item v-else class="input" label="类型" prop="type" >
					<el-input v-model="ruleForm.type"
						placeholder="类型" readonly></el-input>
				</el-form-item>
				<el-form-item class="date" v-if="type!='info'" label="提醒时间" prop="remindtime" >
					<el-date-picker
						value-format="yyyy-MM-dd HH:mm:ss"
						v-model="ruleForm.remindtime" 
						type="datetime"
						:readonly="ro.remindtime"
						placeholder="提醒时间"
					></el-date-picker>
				</el-form-item>
				<el-form-item class="input" v-else-if="ruleForm.remindtime" label="提醒时间" prop="remindtime" >
					<el-input v-model="ruleForm.remindtime" placeholder="提醒时间" readonly></el-input>
				</el-form-item>
			</template>
			<el-form-item class="textarea" v-if="type!='info'" label="简介" prop="brief" >
				<el-input
					style="min-width: 200px; max-width: 600px;"
					type="textarea"
					:rows="8"
					placeholder="简介"
					v-model="ruleForm.brief" >
				</el-input>
			</el-form-item>
			<el-form-item v-else-if="ruleForm.brief" label="简介" prop="brief" >
				<span class="text">{{ruleForm.brief}}</span>
			</el-form-item>
			<el-form-item v-if="type!='info'"  label="内容" prop="content" >
				<editor 
					style="min-width: 200px; max-width: 600px;"
					v-model="ruleForm.content" 
					class="editor"
					myQuillEditor="content"
					action="file/upload">
				</editor>
			</el-form-item>
			<el-form-item v-else-if="ruleForm.content" label="内容" prop="content" >
				<span class="text ql-snow ql-editor" v-html="ruleForm.content"></span>
			</el-form-item>
			<el-form-item class="btn">
				<el-button class="btn3"  v-if="type!='info'" type="success" @click="onSubmit">
					<span class="icon iconfont icon-xihuan"></span>
					提交
				</el-button>
				<el-button class="btn4" v-if="type!='info'" type="success" @click="back()">
					<span class="icon iconfont icon-xihuan"></span>
					取消
				</el-button>
				<el-button class="btn5" v-if="type=='info'" type="success" @click="back()">
					<span class="icon iconfont icon-xihuan"></span>
					返回
				</el-button>
			</el-form-item>
		</el-form>
    

	</div>
</template>
<script>
	export default {
		data() {
			return {
				id: '',
				type: '',
			
			
				ro:{
					userid : false,
					title : false,
					type : true,
					brief : false,
					content : false,
					remindtime : false,
				},
			
				ruleForm: {
					userid: '',
					title: '',
					brief: '',
					content: '',
					remindtime: '',
				},
				typeOptions: [],

				rules: {
					userid: [
						{ required: true, message: '发布人id不能为空', trigger: 'blur' },
					],
					title: [
						{ required: true, message: '标题不能为空', trigger: 'blur' },
					],
					type: [
					],
					brief: [
					],
					content: [
						{ required: true, message: '内容不能为空', trigger: 'blur' },
					],
					remindtime: [
					],
				},
			};
		},
		props: ["parent"],
		computed: {



		},
		components: {
		},
		created() {
		},
		methods: {
			// 下载
			download(file){
				window.open(`${file}`)
			},
			// 初始化
			init(id,type) {
				if (id) {
					this.id = id;
					this.type = type;
				}
				if(this.type=='info'||this.type=='else'||this.type=='msg'){
					this.info(id);
				}else if(this.type=='logistics'){
					for(let x in this.ro) {
						this.ro[x] = true
					}
					this.logistics=false;
					this.info(id);
				}else if(this.type=='cross'){
					var obj = this.$storage.getObj('crossObj');
					for (var o in obj){
						if(o=='userid'){
							this.ruleForm.userid = obj[o];
							this.ro.userid = true;
							continue;
						}
						if(o=='title'){
							this.ruleForm.title = obj[o];
							this.ro.title = true;
							continue;
						}
						if(o=='type'){
							this.ruleForm.type = obj[o];
							this.ro.type = true;
							continue;
						}
						if(o=='brief'){
							this.ruleForm.brief = obj[o];
							this.ro.brief = true;
							continue;
						}
						if(o=='content'){
							this.ruleForm.content = obj[o];
							this.ro.content = true;
							continue;
						}
						if(o=='remindtime'){
							this.ruleForm.remindtime = obj[o];
							this.ro.remindtime = true;
							continue;
						}
					}
				}
				if(this.$storage.get('sessionTable') == 'users'){
					this.ruleForm.type = '全局'
				}else{
					this.ruleForm.type = '个人'
				}
				this.typeOptions = "个人,全局".split(',')
			
			},
			// 多级联动参数

			info(id) {
				this.$http({
					url: `popupremind/info/${id}`,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.ruleForm = data.data;
						//解决前台上传图片后台不显示的问题
						let reg=new RegExp('../../../upload','g')//g代表全部
						this.ruleForm.content = this.ruleForm.content.replace(reg,'../../../wxglxt/upload');
					} else {
						this.$message.error(data.msg);
					}
				});
			},

			// 提交
			async onSubmit() {
					var objcross = this.$storage.getObj('crossObj');
					if(!this.ruleForm.id) {
						delete this.ruleForm.userid
					}
					await this.$refs["ruleForm"].validate(async valid => {
						if (valid) {
							if(this.type=='cross'){
								var statusColumnName = this.$storage.get('statusColumnName');
								var statusColumnValue = this.$storage.get('statusColumnValue');
								if(statusColumnName!='') {
									var obj = this.$storage.getObj('crossObj');
									if(statusColumnName && !statusColumnName.startsWith("[")) {
										for (var o in obj){
											if(o==statusColumnName){
												obj[o] = statusColumnValue;
											}
										}
										var table = this.$storage.get('crossTable');
										await this.$http({
											url: `${table}/update`,
											method: "post",
											data: obj
										}).then(({ data }) => {});
									}
								}
							}
							
							await this.$http({
								url: `popupremind/${!this.ruleForm.id ? "save" : "update"}`,
								method: "post",
								data: this.ruleForm
							}).then(async ({ data }) => {
								if (data && data.code === 0) {
									this.$message({
										message: "操作成功",
										type: "success",
										duration: 1500,
										onClose: () => {
											this.parent.showFlag = true;
											this.parent.addOrUpdateFlag = false;
											this.parent.popupremindCrossAddOrUpdateFlag = false;
											this.parent.search();
											this.parent.contentStyleChange();
										}
									});
								} else {
									this.$message.error(data.msg);
								}
							});
						}
					});
			},
			// 获取uuid
			getUUID () {
				return new Date().getTime();
			},
			// 返回
			back() {
				this.parent.showFlag = true;
				this.parent.addOrUpdateFlag = false;
				this.parent.popupremindCrossAddOrUpdateFlag = false;
				this.parent.contentStyleChange();
			},
		}
	};
</script>
<style lang="scss" scoped>
	.addEdit-block {
		padding: 30px;
	}
	.add-update-preview {
		border-radius: 10px;
		padding: 40px 20px 20px;
		background: #fff;
		width: 100%;
		border-color: #eee;
		border-width: 0px 0 0;
		border-style: solid;
	}
	.amap-wrapper {
		width: 100%;
		height: 500px;
	}
	
	.search-box {
		position: absolute;
	}
	
	.el-date-editor.el-input {
		width: auto;
	}
	.add-update-preview /deep/ .el-form-item {
		border: 0px solid #eee;
		padding: 0;
		margin: 0 0 26px 0;
		display: inline-block;
		width: 49%;
	}
	.add-update-preview .el-form-item /deep/ .el-form-item__label {
		padding: 0 10px 0 0;
		color: #9E9E9E;
		font-weight: 600;
		width: 180px;
		font-size: 16px;
		line-height: 40px;
		text-align: right;
	}
	
	.add-update-preview .el-form-item /deep/ .el-form-item__content {
		margin-left: 180px;
	}
	.add-update-preview .el-form-item span.text {
		padding: 0 10px;
		color: #333;
		background: none;
		font-weight: 500;
		display: inline-block;
		font-size: 16px;
		line-height: 40px;
		min-width: 50%;
	}
	
	.add-update-preview .el-input {
		width: 100%;
	}
	.add-update-preview .el-input /deep/ .el-input__inner {
		border: 1px solid #E8E8E8;
		border-radius: 5px;
		padding: 0 12px;
		color: #000;
		width: 100%;
		font-size: 16px;
		min-width: 50%;
		height: 40px;
	}
	.add-update-preview .el-input /deep/ .el-input__inner[readonly="readonly"] {
		border: 1px solid #E8E8E8;
		cursor: not-allowed;
		border-radius: 5px;
		padding: 0 12px;
		color: #666;
		background: #ddd;
		width: 100%;
		font-size: 16px;
		height: 40px;
	}
	.add-update-preview .el-input-number {
		text-align: left;
		width: 100%;
	}
	.add-update-preview .el-input-number /deep/ .el-input__inner {
		text-align: left;
		border: 1px solid #E8E8E8;
		border-radius: 5px;
		padding: 0 12px;
		color: #000;
		width: 100%;
		font-size: 16px;
		min-width: 50%;
		height: 40px;
	}
	.add-update-preview .el-input-number /deep/ .is-disabled .el-input__inner {
		text-align: left;
		border: 1px solid #E8E8E8;
		cursor: not-allowed;
		border-radius: 5px;
		padding: 0 12px;
		color: #666;
		background: #ddd;
		width: 100%;
		font-size: 16px;
		height: 40px;
	}
	.add-update-preview .el-input-number /deep/ .el-input-number__decrease {
		display: none;
	}
	.add-update-preview .el-input-number /deep/ .el-input-number__increase {
		display: none;
	}
	.add-update-preview .el-select {
		width: 100%;
	}
	.add-update-preview .el-select /deep/ .el-input__inner {
		border: 1px solid #E8E8E8;
		border-radius: 5px;
		padding: 0 10px;
		color: #000;
		width: 100%;
		font-size: 16px;
		height: 40px;
	}
	.add-update-preview .el-select /deep/ .is-disabled .el-input__inner {
		border: 1px solid #E8E8E8;
		cursor: not-allowed;
		border-radius: 5px;
		padding: 0 10px;
		color: #666;
		background: #ddd;
		width: 100%;
		font-size: 16px;
		height: 40px;
	}
	.add-update-preview .el-date-editor {
		width: 100%;
	}
	.add-update-preview .el-date-editor /deep/ .el-input__inner {
		border: 1px solid #E8E8E8;
		border-radius: 5px;
		padding: 0 10px 0 30px;
		color: #000;
		background: #fff;
		width: 100%;
		font-size: 16px;
		height: 40px;
	}
	.add-update-preview .el-date-editor /deep/ .el-input__inner[readonly="readonly"] {
		border: 1px solid #E8E8E8;
		cursor: not-allowed;
		border-radius: 5px;
		padding: 0 10px 0 30px;
		color: #666;
		background: #ddd;
		width: 100%;
		font-size: 16px;
		height: 40px;
	}
	.add-update-preview .viewBtn {
		border: 1px solid #507AFC;
		cursor: pointer;
		border-radius: 5px;
		padding: 0 15px;
		box-shadow: 4px 4px 0 #507AFC;
		margin: 0 10px 10px 0;
		transform: skew(-15deg, 0deg);
		color: #507AFC;
		background: #fff;
		width: auto;
		font-size: 14px;
		height: 36px;
		.iconfont {
			margin: 0 2px;
			color: #666;
			display: none;
			font-size: 16px;
			height: 34px;
		}
	}
	.add-update-preview .viewBtn:hover {
		box-shadow: 4px 4px 0 #aaa;
		color: #aaa;
		border-color: #aaa;
		opacity: 1;
	}
	.add-update-preview .downBtn {
		border: 1px solid #FAC858;
		cursor: pointer;
		border-radius: 5px;
		padding: 0 15px;
		box-shadow: 4px 4px 0 #FAC858;
		margin: 0 10px 10px 0;
		transform: skew(-15deg, 0deg);
		color: #FAC858;
		background: #fff;
		width: auto;
		font-size: 14px;
		height: 36px;
		.iconfont {
			margin: 0 2px;
			color: inherit;
			display: none;
			font-size: inherit;
			height: 34px;
		}
	}
	.add-update-preview .downBtn:hover {
		box-shadow: 4px 4px 0 #aaa;
		color: #aaa;
		border-color: #aaa;
		opacity: 1;
	}
	.add-update-preview .unBtn {
		border: 1px solid #5AFFEF;
		cursor: not-allowed;
		border-radius: 5px;
		padding: 0 15px;
		box-shadow: 4px 4px 0 #5AFFEF;
		margin: 0 10px 10px 0;
		transform: skew(-15deg, 0deg);
		color: #5AFFEF;
		background: #fff;
		width: auto;
		font-size: 14px;
		height: 36px;
		.iconfont {
			margin: 0 2px;
			color: #fff;
			display: none;
			font-size: 14px;
			height: 34px;
		}
	}
	.add-update-preview .unBtn:hover {
		opacity: 1;
	}
	.add-update-preview /deep/ .el-upload--picture-card {
		background: transparent;
		border: 0;
		border-radius: 0;
		width: auto;
		height: auto;
		line-height: initial;
		vertical-align: middle;
	}
	
	.add-update-preview /deep/ .upload .upload-img {
		border: 1px solid #E8E8E8;
		cursor: pointer;
		border-radius: 5px;
		color: #666;
		background: #fff;
		width: 90px;
		font-size: 24px;
		line-height: 60px;
		text-align: center;
		height: 60px;
	}
	
	.add-update-preview /deep/ .el-upload-list .el-upload-list__item {
		border: 1px solid #E8E8E8;
		cursor: pointer;
		border-radius: 5px;
		color: #666;
		background: #fff;
		width: 90px;
		font-size: 24px;
		line-height: 60px;
		text-align: center;
		height: 60px;
	}
	
	.add-update-preview /deep/ .el-upload .el-icon-plus {
		border: 1px solid #E8E8E8;
		cursor: pointer;
		border-radius: 5px;
		color: #666;
		background: #fff;
		width: 90px;
		font-size: 24px;
		line-height: 60px;
		text-align: center;
		height: 60px;
	}
	.add-update-preview /deep/ .el-upload__tip {
		color: #666;
		font-size: 15px;
	}
	
	.add-update-preview .el-textarea /deep/ .el-textarea__inner {
		border: 1px solid #E8E8E8;
		border-radius: 5px;
		padding: 12px;
		color: #000;
		background: #fff;
		width: 100%;
		font-size: 14px;
		height: 120px;
	}
	.add-update-preview .el-textarea /deep/ .el-textarea__inner[readonly="readonly"] {
				border: 1px solid #E8E8E8;
				cursor: not-allowed;
				border-radius: 5px;
				padding: 12px;
				color: #666;
				background: #ddd;
				width: 100%;
				font-size: 14px;
				height: 120px;
			}
	.add-update-preview .el-form-item.btn {
		padding: 0;
		margin: 20px 0 0;
		.btn1 {
			border: 0px solid #ccc;
			cursor: pointer;
			border-radius: 5px;
			padding: 0 10px;
			margin: 0 10px 0 0;
			color: #fff;
			background: #179BD7;
			width: auto;
			font-size: 16px;
			min-width: 110px;
			height: 40px;
			.iconfont {
				margin: 0 2px;
				color: #fff;
				display: none;
				font-size: 14px;
				height: 40px;
			}
		}
		.btn1:hover {
			transform: skew(-15deg, 0deg);
			opacity: 1;
		}
		.btn2 {
			border: 0px solid #ccc;
			cursor: pointer;
			border-radius: 5px;
			padding: 0 10px;
			margin: 0 10px 0 0;
			color: #fff;
			background: #FFBA59;
			width: auto;
			font-size: 16px;
			min-width: 110px;
			height: 40px;
			.iconfont {
				margin: 0 2px;
				color: #fff;
				display: none;
				font-size: 14px;
				height: 34px;
			}
		}
		.btn2:hover {
			transform: skew(-15deg, 0deg);
			opacity: 1;
		}
		.btn3 {
			border: 0px solid #ccc;
			cursor: pointer;
			border-radius: 4px;
			padding: 0 10px;
			margin: 0 10px 0 0;
			color: #fff;
			background: #507AFC;
			width: auto;
			font-size: 16px;
			min-width: 110px;
			height: 40px;
			.iconfont {
				margin: 0 2px;
				color: #fff;
				display: none;
				font-size: 14px;
				height: 40px;
			}
		}
		.btn3:hover {
			transform: skew(-15deg, 0deg);
			opacity: 1;
		}
		.btn4 {
			border: 0px solid #ccc;
			cursor: pointer;
			border-radius: 4px;
			padding: 0 10px;
			margin: 0 10px 0 0;
			color: #fff;
			background: #8D8D8D;
			width: auto;
			font-size: 16px;
			min-width: 110px;
			height: 40px;
			.iconfont {
				margin: 0 2px;
				color: #fff;
				display: none;
				font-size: 14px;
				height: 40px;
			}
		}
		.btn4:hover {
			transform: skew(-15deg, 0deg);
			opacity: 1;
		}
		.btn5 {
			border: 0px solid #ccc;
			cursor: pointer;
			border-radius: 4px;
			padding: 0 10px;
			margin: 0 10px 0 0;
			color: #fff;
			background: #43B27F;
			width: auto;
			font-size: 16px;
			min-width: 110px;
			height: 40px;
			.iconfont {
				margin: 0 2px;
				color: #fff;
				display: none;
				font-size: 14px;
				height: 40px;
			}
		}
		.btn5:hover {
			transform: skew(-15deg, 0deg);
			opacity: 1;
		}
	}
</style>
