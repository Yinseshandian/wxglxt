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
				<el-form-item class="input" v-if="type!='info'"  label="用户账号" prop="yonghuzhanghao" >
					<el-input v-model="ruleForm.yonghuzhanghao" placeholder="用户账号" clearable  :readonly="ro.yonghuzhanghao"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="用户账号" prop="yonghuzhanghao" >
					<el-input v-model="ruleForm.yonghuzhanghao" placeholder="用户账号" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="用户姓名" prop="yonghuxingming" >
					<el-input v-model="ruleForm.yonghuxingming" placeholder="用户姓名" clearable  :readonly="ro.yonghuxingming"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="用户姓名" prop="yonghuxingming" >
					<el-input v-model="ruleForm.yonghuxingming" placeholder="用户姓名" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="联系方式" prop="lianxifangshi" >
					<el-input v-model="ruleForm.lianxifangshi" placeholder="联系方式" clearable  :readonly="ro.lianxifangshi"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="联系方式" prop="lianxifangshi" >
					<el-input v-model="ruleForm.lianxifangshi" placeholder="联系方式" readonly></el-input>
				</el-form-item>
				<el-form-item class="select" v-if="type!='info'"  label="维修类型" prop="weixiuleixing" >
					<el-select :disabled="ro.weixiuleixing" v-model="ruleForm.weixiuleixing" placeholder="请选择维修类型" @change="(e)=>change1(e,'weixiuleixing')">
						<el-option
							v-for="(item,index) in weixiuleixingOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item v-else class="input" label="维修类型" prop="weixiuleixing" >
					<el-input v-model="ruleForm.weixiuleixing"
						placeholder="维修类型" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="维修物品" prop="weixiuwupin" >
					<el-input v-model="ruleForm.weixiuwupin" placeholder="维修物品" clearable  :readonly="ro.weixiuwupin"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="维修物品" prop="weixiuwupin" >
					<el-input v-model="ruleForm.weixiuwupin" placeholder="维修物品" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="报修时间" prop="baoxiushijian" >
					<el-input v-model="ruleForm.baoxiushijian" placeholder="报修时间" clearable  :readonly="ro.baoxiushijian"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="报修时间" prop="baoxiushijian" >
					<el-input v-model="ruleForm.baoxiushijian" placeholder="报修时间" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="故障描述" prop="guzhangmiaoshu" >
					<el-input v-model="ruleForm.guzhangmiaoshu" placeholder="故障描述" clearable  :readonly="ro.guzhangmiaoshu"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="故障描述" prop="guzhangmiaoshu" >
					<el-input v-model="ruleForm.guzhangmiaoshu" placeholder="故障描述" readonly></el-input>
				</el-form-item>
				<el-form-item class="upload" v-if="type!='info' && !ro.baoxiutupian" label="报修图片" prop="baoxiutupian" >
					<file-upload
						tip="点击上传报修图片"
						action="file/upload"
						:limit="3"
						:multiple="true"
						:fileUrls="ruleForm.baoxiutupian?ruleForm.baoxiutupian:''"
						@change="baoxiutupianUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item class="upload" v-else-if="ruleForm.baoxiutupian" label="报修图片" prop="baoxiutupian" >
					<img v-if="ruleForm.baoxiutupian.substring(0,4)=='http'&&ruleForm.baoxiutupian.split(',w').length>1" class="upload-img" style="margin-right:20px;" v-bind:key="index" :src="ruleForm.baoxiutupian" width="100" height="100">
					<img v-else-if="ruleForm.baoxiutupian.substring(0,4)=='http'" class="upload-img" style="margin-right:20px;" v-bind:key="index" :src="ruleForm.baoxiutupian.split(',')[0]" width="100" height="100">
					<img v-else class="upload-img" style="margin-right:20px;" v-bind:key="index" v-for="(item,index) in ruleForm.baoxiutupian.split(',')" :src="$base.url+item" width="100" height="100">
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="故障地点" prop="guzhangdidian" >
					<el-input v-model="ruleForm.guzhangdidian" placeholder="故障地点" clearable  :readonly="ro.guzhangdidian"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="故障地点" prop="guzhangdidian" >
					<el-input v-model="ruleForm.guzhangdidian" placeholder="故障地点" readonly></el-input>
				</el-form-item>
				<el-form-item class="select" v-if="type!='info'" label="维修账号" prop="weixiuzhanghao" >
					<el-select :disabled="ro.weixiuzhanghao" @change="weixiuzhanghaoChange" v-model="ruleForm.weixiuzhanghao" placeholder="请选择维修账号">
						<el-option
							v-for="(item,index) in weixiuzhanghaoOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item class="input" v-else-if="ruleForm.weixiuzhanghao" label="维修账号" prop="weixiuzhanghao" >
					<el-input v-model="ruleForm.weixiuzhanghao" placeholder="维修账号" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="维修姓名" prop="weixiuxingming" >
					<el-input v-model="ruleForm.weixiuxingming" placeholder="维修姓名" clearable  :readonly="ro.weixiuxingming"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="维修姓名" prop="weixiuxingming" >
					<el-input v-model="ruleForm.weixiuxingming" placeholder="维修姓名" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="维修身份" prop="weixiushenfen" >
					<el-input v-model="ruleForm.weixiushenfen" placeholder="维修身份" clearable  :readonly="ro.weixiushenfen"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="维修身份" prop="weixiushenfen" >
					<el-input v-model="ruleForm.weixiushenfen" placeholder="维修身份" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="手机号" prop="shoujihao" >
					<el-input v-model="ruleForm.shoujihao" placeholder="手机号" clearable  :readonly="ro.shoujihao"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="手机号" prop="shoujihao" >
					<el-input v-model="ruleForm.shoujihao" placeholder="手机号" readonly></el-input>
				</el-form-item>
				<el-form-item class="date" v-if="type!='info'" label="分配时间" prop="fenpeishijian" >
					<el-date-picker
						value-format="yyyy-MM-dd HH:mm:ss"
						v-model="ruleForm.fenpeishijian" 
						type="datetime"
						:readonly="ro.fenpeishijian"
						placeholder="分配时间"
					></el-date-picker>
				</el-form-item>
				<el-form-item class="input" v-else-if="ruleForm.fenpeishijian" label="分配时间" prop="fenpeishijian" >
					<el-input v-model="ruleForm.fenpeishijian" placeholder="分配时间" readonly></el-input>
				</el-form-item>
				<el-form-item class="select" v-if="type!='info'"  label="状态" prop="zhuangtai" >
					<el-select :disabled="ro.zhuangtai" v-model="ruleForm.zhuangtai" placeholder="请选择状态" >
						<el-option
							v-for="(item,index) in zhuangtaiOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item v-else class="input" label="状态" prop="zhuangtai" >
					<el-input v-model="ruleForm.zhuangtai"
						placeholder="状态" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="紧急程度" prop="jinjichengdu" >
					<el-input v-model="ruleForm.jinjichengdu" placeholder="紧急程度" clearable  :readonly="ro.jinjichengdu"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="紧急程度" prop="jinjichengdu" >
					<el-input v-model="ruleForm.jinjichengdu" placeholder="紧急程度" readonly></el-input>
				</el-form-item>
			</template>
			<el-form-item v-if="type!='info'"  label="报修详情" prop="baoxiuxiangqing" >
				<editor 
					style="min-width: 200px; max-width: 600px;"
					v-model="ruleForm.baoxiuxiangqing" 
					class="editor"
					myQuillEditor="baoxiuxiangqing"
					action="file/upload">
				</editor>
			</el-form-item>
			<el-form-item v-else-if="ruleForm.baoxiuxiangqing" label="报修详情" prop="baoxiuxiangqing" >
				<span class="text ql-snow ql-editor" v-html="ruleForm.baoxiuxiangqing"></span>
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
	import { 
		isMobile,
	} from "@/utils/validate";
	export default {
		data() {
			var validateMobile = (rule, value, callback) => {
				if(!value){
					callback();
				} else if (!isMobile(value)) {
					callback(new Error("请输入正确的手机号码"));
				} else {
					callback();
				}
			};
			return {
				id: '',
				type: '',
			
			
				ro:{
					yonghuzhanghao : false,
					yonghuxingming : false,
					lianxifangshi : false,
					weixiuleixing : false,
					weixiuwupin : false,
					baoxiushijian : false,
					guzhangmiaoshu : false,
					baoxiutupian : false,
					guzhangdidian : false,
					weixiuzhanghao : false,
					weixiuxingming : false,
					weixiushenfen : false,
					shoujihao : false,
					fenpeishijian : false,
					zhuangtai : false,
					jinjichengdu : false,
					baoxiuxiangqing : false,
					sfsh : false,
					shhf : false,
				},
			
				ruleForm: {
					yonghuzhanghao: '',
					yonghuxingming: '',
					lianxifangshi: '',
					weixiuleixing: '',
					weixiuwupin: '',
					baoxiushijian: '',
					guzhangmiaoshu: '',
					baoxiutupian: '',
					guzhangdidian: '',
					weixiuzhanghao: '',
					weixiuxingming: '',
					weixiushenfen: '',
					shoujihao: '',
					fenpeishijian: '',
					zhuangtai: '待处理',
					jinjichengdu: '',
					baoxiuxiangqing: '',
					shhf: '',
				},
				weixiuleixingOptions: [],
				weixiuzhanghaoOptions: [],
				zhuangtaiOptions: [],

				rules: {
					yonghuzhanghao: [
					],
					yonghuxingming: [
					],
					lianxifangshi: [
						{ validator: validateMobile, trigger: 'blur' },
					],
					weixiuleixing: [
					],
					weixiuwupin: [
					],
					baoxiushijian: [
					],
					guzhangmiaoshu: [
					],
					baoxiutupian: [
					],
					guzhangdidian: [
					],
					weixiuzhanghao: [
					],
					weixiuxingming: [
					],
					weixiushenfen: [
					],
					shoujihao: [
						{ validator: validateMobile, trigger: 'blur' },
					],
					fenpeishijian: [
					],
					zhuangtai: [
					],
					jinjichengdu: [
					],
					baoxiuxiangqing: [
					],
					sfsh: [
					],
					shhf: [
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
			this.ruleForm.fenpeishijian = this.getCurDateTime()
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
						if(o=='yonghuzhanghao'){
							this.ruleForm.yonghuzhanghao = obj[o];
							this.ro.yonghuzhanghao = true;
							continue;
						}
						if(o=='yonghuxingming'){
							this.ruleForm.yonghuxingming = obj[o];
							this.ro.yonghuxingming = true;
							continue;
						}
						if(o=='lianxifangshi'){
							this.ruleForm.lianxifangshi = obj[o];
							this.ro.lianxifangshi = true;
							continue;
						}
						if(o=='weixiuleixing'){
							this.ruleForm.weixiuleixing = obj[o];
							this.ro.weixiuleixing = true;
							continue;
						}
						if(o=='weixiuwupin'){
							this.ruleForm.weixiuwupin = obj[o];
							this.ro.weixiuwupin = true;
							continue;
						}
						if(o=='baoxiushijian'){
							this.ruleForm.baoxiushijian = obj[o];
							this.ro.baoxiushijian = true;
							continue;
						}
						if(o=='guzhangmiaoshu'){
							this.ruleForm.guzhangmiaoshu = obj[o];
							this.ro.guzhangmiaoshu = true;
							continue;
						}
						if(o=='baoxiutupian'){
							this.ruleForm.baoxiutupian = obj[o];
							this.ro.baoxiutupian = true;
							continue;
						}
						if(o=='guzhangdidian'){
							this.ruleForm.guzhangdidian = obj[o];
							this.ro.guzhangdidian = true;
							continue;
						}
						if(o=='weixiuzhanghao'){
							this.ruleForm.weixiuzhanghao = obj[o];
							this.ro.weixiuzhanghao = true;
							continue;
						}
						if(o=='weixiuxingming'){
							this.ruleForm.weixiuxingming = obj[o];
							this.ro.weixiuxingming = true;
							continue;
						}
						if(o=='weixiushenfen'){
							this.ruleForm.weixiushenfen = obj[o];
							this.ro.weixiushenfen = true;
							continue;
						}
						if(o=='shoujihao'){
							this.ruleForm.shoujihao = obj[o];
							this.ro.shoujihao = true;
							continue;
						}
						if(o=='fenpeishijian'){
							this.ruleForm.fenpeishijian = obj[o];
							this.ro.fenpeishijian = true;
							continue;
						}
						if(o=='zhuangtai'){
							this.ruleForm.zhuangtai = obj[o];
							this.ro.zhuangtai = true;
							continue;
						}
						if(o=='jinjichengdu'){
							this.ruleForm.jinjichengdu = obj[o];
							this.ro.jinjichengdu = true;
							continue;
						}
						if(o=='baoxiuxiangqing'){
							this.ruleForm.baoxiuxiangqing = obj[o];
							this.ro.baoxiuxiangqing = true;
							continue;
						}
					}
					this.ruleForm.zhuangtai = '待处理'; 				}
				// 获取用户信息
				this.$http({
					url: `${this.$storage.get('sessionTable')}/session`,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						var json = data.data;
						if(((json.yonghuzhanghao!=''&&json.yonghuzhanghao) || json.yonghuzhanghao==0) && this.$storage.get("role")!="管理员"){
							this.ruleForm.yonghuzhanghao = json.yonghuzhanghao
							this.ro.yonghuzhanghao = true;
						}
						if(((json.yonghuxingming!=''&&json.yonghuxingming) || json.yonghuxingming==0) && this.$storage.get("role")!="管理员"){
							this.ruleForm.yonghuxingming = json.yonghuxingming
							this.ro.yonghuxingming = true;
						}
						if(this.$storage.get("role")!="管理员") {
							this.ro.zhuangtai = true;
						}
					} else {
						this.$message.error(data.msg);
					}
				});
				this.$http({
					url: `option/weixiuleixing/weixiuleixing`,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.weixiuleixingOptions = data.data;
					} else {
						this.$message.error(data.msg);
					}
				});
				this.$http({
					url: `option/weixiurenyuan/weixiuzhanghao`,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.weixiuzhanghaoOptions = data.data;
					} else {
						this.$message.error(data.msg);
					}
				});
				this.zhuangtaiOptions = "已处理,待处理".split(',')
			
			},
			// 下二随
			weixiuzhanghaoChange () {
				this.$http({
					url: `follow/weixiurenyuan/weixiuzhanghao?columnValue=`+ this.ruleForm.weixiuzhanghao,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						if(data.data.weixiuxingming){
							this.ruleForm.weixiuxingming = data.data.weixiuxingming
						}
						if(data.data.weixiushenfen){
							this.ruleForm.weixiushenfen = data.data.weixiushenfen
						}
						if(data.data.shoujihao){
							this.ruleForm.shoujihao = data.data.shoujihao
						}
					} else {
						this.$message.error(data.msg);
					}
				});
			},
			// 多级联动参数

			info(id) {
				this.$http({
					url: `fenpeiweixiu/info/${id}`,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.ruleForm = data.data;
						//解决前台上传图片后台不显示的问题
						let reg=new RegExp('../../../upload','g')//g代表全部
						this.ruleForm.baoxiuxiangqing = this.ruleForm.baoxiuxiangqing.replace(reg,'../../../wxglxt/upload');
					} else {
						this.$message.error(data.msg);
					}
				});
			},

			// 提交
			async onSubmit() {
					if(this.ruleForm.baoxiutupian!=null) {
						this.ruleForm.baoxiutupian = this.ruleForm.baoxiutupian.replace(new RegExp(this.$base.url,"g"),"");
					}
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
								url: `fenpeiweixiu/${!this.ruleForm.id ? "save" : "update"}`,
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
											this.parent.fenpeiweixiuCrossAddOrUpdateFlag = false;
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
				this.parent.fenpeiweixiuCrossAddOrUpdateFlag = false;
				this.parent.contentStyleChange();
			},
			baoxiutupianUploadChange(fileUrls) {
				this.ruleForm.baoxiutupian = fileUrls;
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
