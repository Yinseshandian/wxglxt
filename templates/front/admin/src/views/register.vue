<template>
	<div>
		<div class="register-container">
			<el-form v-if="pageFlag=='security1'" class="rgs-form animate__animated animate__lightSpeedInRight" :model="forgetForm">
				<div class="rgs-form2">
					<div class="title">基于Django的高校后勤报修信息管理系统的设计与实现找回密码</div>
					<el-form-item class="list-item">
						<div class="lable">账号</div>
						<el-input v-model="forgetForm.username" autocomplete="off" placeholder="请您输入账号" />
					</el-form-item>
					<el-form-item class="list-item">
						<div class="lable">角色</div>
						<el-select v-model="tableName" placeholder="请您选择角色">
							<el-option label="用户" value="yonghu"></el-option>
							<el-option label="维修人员" value="weixiurenyuan"></el-option>
						</el-select>
					</el-form-item>
					<div class="register-btn">
						<div class="register-btn1">
							<button type="button" class="r-btn" @click="getSecurity()">下一步</button>
						</div>
						<div class="register-btn2">
							<div class="r-login" @click="close()">已有账号，直接登录</div>
						</div>
					</div>
				</div>
            </el-form>
			<el-form v-if="pageFlag=='security2'" class="rgs-form animate__animated animate__lightSpeedInRight" :model="ruleForm">
				<div class="rgs-form2">
					<div class="title">基于Django的高校后勤报修信息管理系统的设计与实现密码重置</div>
					<el-form-item class="list-item">
						<div class="lable">密保问题</div>
						<el-input v-model="ruleForm.pquestion" readOnly autocomplete="off" placeholder="密保问题" />
					</el-form-item>
					<el-form-item class="list-item">
						<div class="lable">密保答案</div>
						<el-input v-model="ruleForm.myanswer" autocomplete="off" placeholder="请您输入密保答案" />
					</el-form-item>
					<div class="register-btn">
						<div class="register-btn1">
							<button type="button" class="r-btn" @click="validateSecurity()">下一步</button>
						</div>
						<div class="register-btn2">
							<div class="r-login" @click="close()">已有账号，直接登录</div>
						</div>
					</div>
				</div>
            </el-form>
			<el-form v-if="pageFlag=='security3'" class="rgs-form animate__animated animate__lightSpeedInRight" :model="ruleForm">
				<div class="rgs-form2">
					<div class="title">基于Django的高校后勤报修信息管理系统的设计与实现密码重置</div>
					<el-form-item class="list-item">
						<div class="lable">新密码</div>
						<el-input v-model="ruleForm.newpassword" autocomplete="off" type="password" placeholder="请您输入新密码" />
					</el-form-item>
					<el-form-item class="list-item">
						<div class="lable">确认密码</div>
						<el-input v-model="ruleForm.repassword" autocomplete="off" type="password" placeholder="请您确认新密码" />
					</el-form-item>
					<div class="register-btn">
						<div class="register-btn1">
							<button type="button" class="r-btn" @click="updatePassword()">修改密码</button>
						</div>
						<div class="register-btn2">
							<div class="r-login" @click="close()">已有账号，直接登录</div>
						</div>
					</div>
				</div>
			</el-form>
			<el-form v-if="pageFlag=='register'" ref="ruleForm" class="rgs-form animate__animated animate__lightSpeedInRight" :model="ruleForm" :rules="rules">
				<div class="rgs-form2">
					<div class="title">基于Django的高校后勤报修信息管理系统的设计与实现</div>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('yonghuzhanghao')?'required':''">用户账号：</div>
						<el-input  v-model="ruleForm.yonghuzhanghao"  autocomplete="off" placeholder="用户账号"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('mima')?'required':''">密码：</div>
						<el-input  v-model="ruleForm.mima"  autocomplete="off" placeholder="密码"  type="password"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('mima')?'required':''">确认密码：</div>
						<el-input  v-model="ruleForm.mima2" autocomplete="off" placeholder="确认密码" type="password" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('yonghuxingming')?'required':''">用户姓名：</div>
						<el-input  v-model="ruleForm.yonghuxingming"  autocomplete="off" placeholder="用户姓名"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('xingbie')?'required':''">性别：</div>
						<el-select v-model="ruleForm.xingbie" placeholder="请选择性别" >
							<el-option
								v-for="(item,index) in yonghuxingbieOptions"
								v-bind:key="index"
								:label="item"
								:value="item">
							</el-option>
						</el-select>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('nianling')?'required':''">年龄：</div>
						<el-input  v-model="ruleForm.nianling"  autocomplete="off" placeholder="年龄"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('touxiang')?'required':''">头像：</div>
						<file-upload
							tip="点击上传头像"
							action="file/upload"
							:limit="3"
							:multiple="true"
							:fileUrls="ruleForm.touxiang?ruleForm.touxiang:''"
							@change="yonghutouxiangUploadChange"
						></file-upload>
					</el-form-item>
					<el-form-item class="list-item email" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('mobile')?'required':''">手机号码：</div>
						<div style="display: flex;flex: 1;">
							<input v-model="ruleForm.mobile" autocomplete="off" placeholder="手机号"/>
							<button v-if="isEndFlag" type="success" class="register-code" @click="sendsmscode()">发送验证码</button>
							<button v-if="!isEndFlag" type="success" class="register-code" disabled="disabled">{{SecondToDate}}</button>
						</div>
					</el-form-item>
					<el-form-item class="list-item email-code" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('mobile')?'required':''">验证码：</div>
						<el-input  v-model="smscode" autocomplete="off" placeholder="验证码" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('pquestion')?'required':''">密保问题：</div>
						<el-input  v-model="ruleForm.pquestion"  autocomplete="off" placeholder="密保问题"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('panswer')?'required':''">密保答案：</div>
						<el-input  v-model="ruleForm.panswer"  autocomplete="off" placeholder="密保答案"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='weixiurenyuan'">
						<div class="lable" :class="changeRules('weixiuzhanghao')?'required':''">维修账号：</div>
						<el-input  v-model="ruleForm.weixiuzhanghao"  autocomplete="off" placeholder="维修账号"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='weixiurenyuan'">
						<div class="lable" :class="changeRules('mima')?'required':''">密码：</div>
						<el-input  v-model="ruleForm.mima"  autocomplete="off" placeholder="密码"  type="password"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='weixiurenyuan'">
						<div class="lable" :class="changeRules('mima')?'required':''">确认密码：</div>
						<el-input  v-model="ruleForm.mima2" autocomplete="off" placeholder="确认密码" type="password" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='weixiurenyuan'">
						<div class="lable" :class="changeRules('weixiuxingming')?'required':''">维修姓名：</div>
						<el-input  v-model="ruleForm.weixiuxingming"  autocomplete="off" placeholder="维修姓名"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='weixiurenyuan'">
						<div class="lable" :class="changeRules('xingbie')?'required':''">性别：</div>
						<el-select v-model="ruleForm.xingbie" placeholder="请选择性别" >
							<el-option
								v-for="(item,index) in weixiurenyuanxingbieOptions"
								v-bind:key="index"
								:label="item"
								:value="item">
							</el-option>
						</el-select>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='weixiurenyuan'">
						<div class="lable" :class="changeRules('nianling')?'required':''">年龄：</div>
						<el-input  v-model="ruleForm.nianling"  autocomplete="off" placeholder="年龄"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='weixiurenyuan'">
						<div class="lable" :class="changeRules('shoujihao')?'required':''">手机号：</div>
						<el-input  v-model="ruleForm.shoujihao"  autocomplete="off" placeholder="手机号"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='weixiurenyuan'">
						<div class="lable" :class="changeRules('weixiujineng')?'required':''">维修技能：</div>
						<el-input  v-model="ruleForm.weixiujineng"  autocomplete="off" placeholder="维修技能"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='weixiurenyuan'">
						<div class="lable" :class="changeRules('weixiushenfen')?'required':''">维修身份：</div>
						<el-select v-model="ruleForm.weixiushenfen" placeholder="请选择维修身份" >
							<el-option
								v-for="(item,index) in weixiurenyuanweixiushenfenOptions"
								v-bind:key="index"
								:label="item"
								:value="item">
							</el-option>
						</el-select>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='weixiurenyuan'">
						<div class="lable" :class="changeRules('touxiang')?'required':''">头像：</div>
						<file-upload
							tip="点击上传头像"
							action="file/upload"
							:limit="3"
							:multiple="true"
							:fileUrls="ruleForm.touxiang?ruleForm.touxiang:''"
							@change="weixiurenyuantouxiangUploadChange"
						></file-upload>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='weixiurenyuan'">
						<div class="lable" :class="changeRules('pquestion')?'required':''">密保问题：</div>
						<el-input  v-model="ruleForm.pquestion"  autocomplete="off" placeholder="密保问题"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='weixiurenyuan'">
						<div class="lable" :class="changeRules('panswer')?'required':''">密保答案：</div>
						<el-input  v-model="ruleForm.panswer"  autocomplete="off" placeholder="密保答案"  type="text"  />
					</el-form-item>
					<div class="register-btn">
						<div class="register-btn1">
							<button type="button" class="r-btn" @click="login()">注册</button>
						</div>
						<div class="register-btn2">
							<div class="r-login" @click="close()">已有账号，直接登录</div>
						</div>
					</div>
				</div>
			</el-form>
		</div>
	</div>
</template>

<script>
	import 'animate.css'
export default {
	data() {
		return {
			ruleForm: {
			},
			forgetForm: {},
            pageFlag : '',
			tableName:"",
			rules: {},
            smscode:'',
			// 倒计时时间
			count: 60,
			// 倒计时定时器
			inter: null,
			// 倒计时是否结束
			isEndFlag: true,
            yonghuxingbieOptions: [],
            weixiurenyuanxingbieOptions: [],
            weixiurenyuanweixiushenfenOptions: [],
		};
	},
	computed: {
		SecondToDate: function() {
			var time = this.count;
			if (null != time && "" != time) {
				time = parseInt(time) + "秒后重发";
			}
			return time;
		}
	},
	mounted(){
		this.pageFlag = this.$route.query.pageFlag
		if(this.$route.query.pageFlag=='register'){
			
			let table = this.$storage.get("loginTable");
			this.tableName = table;
			if(this.tableName=='yonghu'){
				this.ruleForm = {
					yonghuzhanghao: '',
					mima: '',
					yonghuxingming: '',
					xingbie: '',
					nianling: '',
					touxiang: '',
					mobile: '',
					pquestion: '',
					panswer: '',
				}
			}
			if(this.tableName=='weixiurenyuan'){
				this.ruleForm = {
					weixiuzhanghao: '',
					mima: '',
					weixiuxingming: '',
					xingbie: '',
					nianling: '',
					shoujihao: '',
					weixiujineng: '',
					weixiushenfen: '',
					touxiang: '',
					pquestion: '',
					panswer: '',
				}
			}
			if ('yonghu' == this.tableName) {
				this.rules.yonghuzhanghao = [{ required: true, message: '请输入用户账号', trigger: 'blur' }]
			}
			if ('yonghu' == this.tableName) {
				this.rules.mima = [{ required: true, message: '请输入密码', trigger: 'blur' }]
			}
			if ('yonghu' == this.tableName) {
				this.rules.yonghuxingming = [{ required: true, message: '请输入用户姓名', trigger: 'blur' }]
			}
			if ('weixiurenyuan' == this.tableName) {
				this.rules.weixiuzhanghao = [{ required: true, message: '请输入维修账号', trigger: 'blur' }]
			}
			if ('weixiurenyuan' == this.tableName) {
				this.rules.mima = [{ required: true, message: '请输入密码', trigger: 'blur' }]
			}
			if ('weixiurenyuan' == this.tableName) {
				this.rules.weixiuxingming = [{ required: true, message: '请输入维修姓名', trigger: 'blur' }]
			}
			this.yonghuxingbieOptions = "男,女".split(',')
			this.weixiurenyuanxingbieOptions = "男,女".split(',')
			this.weixiurenyuanweixiushenfenOptions = "宿舍设施维修员,教室设施维修员,网络运维人员,基础设施维修员".split(',')
		}
	},
	created() {
	},
	destroyed() {
		  	},
	methods: {
		changeRules(name){
			if(this.rules[name]){
				return true
			}
			if(name == 'pquestion'||name=='panswer') {
				return true
			}
			return false
		},
		// 获取uuid
		getUUID () {
			return new Date().getTime();
		},
		close(){
			this.$router.push({ path: "/login" });
		},
        yonghutouxiangUploadChange(fileUrls) {
            this.ruleForm.touxiang = fileUrls;
        },
        weixiurenyuantouxiangUploadChange(fileUrls) {
            this.ruleForm.touxiang = fileUrls;
        },

        // 多级联动参数

		sendsmscode() {
			if(!this.ruleForm.mobile){
				this.$message.error(`手机号码不能为空`);
				return
			}
			if(this.ruleForm.mobile&&(!this.$validate.isMobile(this.ruleForm.mobile))){
				this.$message.error(`请输入正确的手机格式`);
				return
			}
			this.isEndFlag = false;
			var _this = this;
			this.inter = window.setInterval(function() {
				_this.count = _this.count - 1;
				if (_this.count <= 0) {
					window.clearInterval(_this.inter);
					_this.isEndFlag = true;
					_this.count=60;
				}
			}, 1000);
			this.$http({
				url: `${this.tableName}/sendsms?mobile=`+this.ruleForm.mobile,
				method: "get",
				params: {}
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.$message.success(`发送成功`);
				} else {
					this.$message.error(`服务器异常，请稍后重试`)
				}
			});
		},

        //获取密保问题
        getSecurity(){
            if(!this.tableName) {
                this.$message.error("请选择角色");
                return false
            }
            if(!this.forgetForm.username){
                this.$message.error("请输入账号");
                return false
            }
            this.$http({
                url: this.tableName+`/security?username=` + this.forgetForm.username,
                method: "get",
            }).then(({
                data
            }) => {
                if (data.data && data.code === 0) {
                    this.ruleForm = data.data;
                    this.pageFlag="security2"
                } else {
                    if(!data.data) {
                        this.$message.error("用户不存在");
                    } else {
                        this.$message.error(data.msg);
                    }
                }
            });
        },
        //验证密保问题
        validateSecurity(){
            let that = this
            if(this.ruleForm.panswer!=this.ruleForm.myanswer){
                this.$message.error("答案输入不正确");
                return false
            }
            this.$message.success("答案正确");
            setTimeout(()=>{
                this.pageFlag="security3";
            },1000)
        },
        // 修改密码
        updatePassword() {
            if (this.ruleForm.newpassword != this.ruleForm.repassword) {
                this.$message.error("两次密码输入不一致");
                return;
            }
            this.ruleForm.mima = this.ruleForm.newpassword;
            this.ruleForm.password = this.ruleForm.newpassword;
            this.$http({
                url: this.tableName+`/update`,
                method: "post",
                data: this.ruleForm
            }).then(({
                data
            }) => {
                if (data && data.code === 0) {
                    this.$message({
                        message: "修改密码成功",
                        type: "success",
                        duration: 1500,
                        onClose: () => {}
                    });
                    this.close()
                } else {
                    this.$message.error(data.msg);
                }
            });
        },
		// 注册
		login() {
			var url=this.tableName+"/register";
			if((!this.ruleForm.yonghuzhanghao) && `yonghu` == this.tableName){
				this.$message.error(`用户账号不能为空`);
				return
			}
			if((!this.ruleForm.mima) && `yonghu` == this.tableName){
				this.$message.error(`密码不能为空`);
				return
			}
			if((this.ruleForm.mima!=this.ruleForm.mima2) && `yonghu` == this.tableName){
				this.$message.error(`两次密码输入不一致`);
				return
			}
			if((!this.ruleForm.yonghuxingming) && `yonghu` == this.tableName){
				this.$message.error(`用户姓名不能为空`);
				return
			}
            if(this.ruleForm.touxiang!=null) {
                this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
            }
			if(`yonghu` == this.tableName && this.ruleForm.mobile &&(!this.$validate.isMobile(this.ruleForm.mobile))){
				this.$message.error(`手机号应输入手机格式`);
				return
			}
			if(`yonghu` == this.tableName ){
				url=this.tableName+"/register?smscode="+this.smscode;
				if(this.ruleForm.mobile&&(!this.$validate.isMobile(this.ruleForm.mobile))){
					this.$message.error(`请输入正确的手机格式`);
					return
				}
			}
			if((!this.smscode) && `yonghu` == this.tableName){
				this.$message.error(`验证码不能为空`);
				return
			}
			if(`yonghu` == this.tableName && this.ruleForm.pquestion==''){
				this.$message.error(`密保问题不能为空`);
				return
			}
			if(`yonghu` == this.tableName && this.ruleForm.panswer==''){
				this.$message.error(`密保答案不能为空`);
				return
			}
			if((!this.ruleForm.weixiuzhanghao) && `weixiurenyuan` == this.tableName){
				this.$message.error(`维修账号不能为空`);
				return
			}
			if((!this.ruleForm.mima) && `weixiurenyuan` == this.tableName){
				this.$message.error(`密码不能为空`);
				return
			}
			if((this.ruleForm.mima!=this.ruleForm.mima2) && `weixiurenyuan` == this.tableName){
				this.$message.error(`两次密码输入不一致`);
				return
			}
			if((!this.ruleForm.weixiuxingming) && `weixiurenyuan` == this.tableName){
				this.$message.error(`维修姓名不能为空`);
				return
			}
			if(`weixiurenyuan` == this.tableName && this.ruleForm.shoujihao &&(!this.$validate.isMobile(this.ruleForm.shoujihao))){
				this.$message.error(`手机号应输入手机格式`);
				return
			}
            if(this.ruleForm.touxiang!=null) {
                this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
            }
			if(`weixiurenyuan` == this.tableName && this.ruleForm.pquestion==''){
				this.$message.error(`密保问题不能为空`);
				return
			}
			if(`weixiurenyuan` == this.tableName && this.ruleForm.panswer==''){
				this.$message.error(`密保答案不能为空`);
				return
			}
			this.$http({
				url: url,
				method: "post",
				data:this.ruleForm
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.$message({
						message: "注册成功",
						type: "success",
						duration: 1500,
						onClose: () => {
							this.$router.replace({ path: "/login" });
						}
					});
				} else {
					this.$message.error(data.msg);
				}
			});
		}
	}
};
</script>

<style lang="scss" scoped>
.register-container {
	position: relative;
	background-repeat: no-repeat;
	background-size: cover;
	display: flex;
	width: 100%;
	min-height: 100vh;
	justify-content: center;
	align-items: center;
	background-image: url(http://codegen.caihongy.cn/20241007/a117f94481434e26b8be6126a878acd0.png);
	background-position: center center;
	.rgs-form {
		.rgs-form2 {
		width: 100%;
		}
		padding: 40px 200px 40px 33%;
		margin: 0;
		z-index: 1000;
		display: flex;
		min-height: 68vh;
		flex-wrap: wrap;
		border-radius: 0;
		box-shadow: inset 0px 0px 0px 0px #000;
		flex-direction: column;
		background: url(http://codegen.caihongy.cn/20241008/9bd1ab72c14c40599e43b5a685b796ef.png) left center/35% 100% no-repeat #fff;
		width: 70%;
		align-items: flex-start;
		position: statics;
		height: auto;
		.title {
			padding: 0 ;
			margin: 0 0 20px  -120px;
			color: #253B80;
			background: none;
			font-weight: 600;
			width: calc(100% + 240px);
			font-size: 22px;
			line-height: 40px;
			text-align: center;
		}
		.list-item {
			padding: 0 0 0 0px;
			margin: 0 0 10px;
			width: 100%;
			position: relative;
			height: auto;
			/deep/ .el-form-item__content {
				display: flex;
				align-items: flex-start;
			}
			.lable {
				padding: 0;
				color: #000;
				width: 90px;
				font-size: 14px;
				line-height: 34px;
				text-align: left;
			}
			.el-input {
				width: calc(100% - 90px);
			}
			.el-input /deep/ .el-input__inner {
				border: 1px solid #efeff7;
				border-radius: 4px;
				padding: 0 10px;
				color: #666;
				width: 100%;
				font-size: 14px;
				height: 38px;
			}
			.el-input /deep/ .el-input__inner:focus {
				border: 1px solid #efeff7;
				border-radius: 4px;
				padding: 0 10px;
				color: #666;
				width: 100%;
				font-size: 14px;
				height: 38px;
			}
			.el-input-number {
				width: calc(100% - 90px);
			}
			.el-input-number /deep/ .el-input__inner {
				text-align: center;
				border: 1px solid #efeff7;
				border-radius: 4px;
				padding: 0 10px;
				color: #666;
				width: 100%;
				font-size: 14px;
				height: 38px;
			}
			.el-input-number /deep/ .el-input__inner:focus {
				border: 1px solid #efeff7;
				border-radius: 4px;
				padding: 0 10px;
				color: #666;
				width: 100%;
				font-size: 14px;
				height: 38px;
			}
			.el-input-number /deep/ .el-input-number__decrease {
				display: none;
			}
			.el-input-number /deep/ .el-input-number__increase {
				display: none;
			}
			.el-select {
				width: calc(100% - 90px);
			}
			.el-select /deep/ .el-input__inner {
				border: 1px solid #efeff7;
				border-radius: 4px;
				padding: 0 10px;
				color: #666;
				width: 100%;
				font-size: 16px;
				height: 38px;
			}
			.el-select /deep/ .el-input__inner:focus {
				border: 1px solid #efeff7;
				border-radius: 4px;
				padding: 0 10px;
				color: #666;
				width: 100%;
				font-size: 16px;
				height: 38px;
			}
			.el-date-editor {
				width: calc(100% - 90px);
			}
			.el-date-editor /deep/ .el-input__inner {
				border: 1px solid #efeff7;
				border-radius: 4px;
				padding: 0 10px 0 30px;
				color: #666;
				width: 100%;
				font-size: 16px;
				height: 38px;
			}
			.el-date-editor /deep/ .el-input__inner:focus {
				border: 1px solid #efeff7;
				border-radius: 4px;
				padding: 0 10px 0 30px;
				color: #666;
				width: 100%;
				font-size: 16px;
				height: 38px;
			}
			.el-date-editor.el-input {
				width: 100%;
			}
			/deep/ .el-upload--picture-card {
				background: transparent;
				border: 0;
				border-radius: 0;
				width: auto;
				height: auto;
				line-height: initial;
				vertical-align: middle;
			}
			/deep/ .upload .upload-img {
				border: 1px solid #efeff7;
				cursor: pointer;
				border-radius: 0px;
				color: #999;
				background: #fff;
				width: 90px;
				font-size: 24px;
				line-height: 60px;
				text-align: center;
				height: 60px;
			}
			/deep/ .el-upload-list .el-upload-list__item {
				border: 1px solid #efeff7;
				cursor: pointer;
				border-radius: 0px;
				color: #999;
				background: #fff;
				width: 90px;
				font-size: 24px;
				line-height: 60px;
				text-align: center;
				height: 60px;
			}
			/deep/ .el-upload .el-icon-plus {
				border: 1px solid #efeff7;
				cursor: pointer;
				border-radius: 0px;
				color: #999;
				background: #fff;
				width: 90px;
				font-size: 24px;
				line-height: 60px;
				text-align: center;
				height: 60px;
			}
			/deep/ .el-upload__tip {
				color: #666;
				display: none;
				font-size: 15px;
			}
			/deep/ .el-input__inner::placeholder {
				color: #999;
				font-size: 16px;
			}
			.required {
				position: relative;
			}
			.required::after{
				color: red;
				left: 0;
				position: inherit;
				content: "*";
				order: -1;
			}
			.editor {
				background: #fff;
				width: calc(100% - 90px);
				height: auto;
			}
			.editor>.avatar-uploader {
				line-height: 0;
				height: 0;
			}
		}
		.list-item.email {
			input {
				border: 1px solid #efeff7;
				border-radius: 4px 0 0 4px;
				padding: 0 10px;
				margin: 0;
				color: #666;
				background: #fff;
				flex: 1;
				width: 100%;
				font-size: 14px;
				height: 38px;
			}
			input:focus {
				border: 1px solid #efeff7;
				border-radius: 4px 0 0 4px;
				padding: 0 10px;
				color: #666;
				width: 100%;
				font-size: 14px;
				height: 38px;
			}
			input::placeholder {
				color: #999;
				font-size: 16px;
			}
			button {
				border: 0px solid #efeff7;
				cursor: pointer;
				border-radius: 0 4px 4px 0;
				padding: 0;
				margin: 1px 0 0;
				color: #000;
				background: #38A9DC30;
				width: 150px;
				font-size: 15px;
				height: 38px;
			}
			button:hover {
				opacity: 0.8;
			}
		}
		.register-btn {
			width: 100%;
		}
		.register-btn1 {
			width: 100%;
		}
		.register-btn2 {
			top: 45%;
			left: 0;
			width: 35%;
			position: absolute;
		}
		.r-btn {
			border: 0px solid rgba(0, 0, 0, 1);
			cursor: pointer;
			border-radius: 60px;
			padding: 0 10px;
			margin: 5px 0 10px;
			color: #fff;
			background: #38A9DC;
			font-weight: 600;
			width: 100%;
			font-size: 26px;
			min-width: 68px;
			height: 60px;
		}
		.r-btn:hover {
			border: 0px solid rgba(0, 0, 0, 1);
			opacity: 0.8;
		}
		.r-login {
			cursor: pointer;
			padding: 0;
			margin: 0 auto;
			color: #253B80;
			font-weight: bold;
			display: block;
			text-decoration: none;
			font-size: 20px;
			line-height: 60px;
			border-radius: 30px;
			background: #FFFFFF80;
			width: 60%;
			text-align: center;
		}
		.r-login:hover {
			opacity: 0.5;
		}
	}
}
	
	::-webkit-scrollbar {
	  display: none;
	}
</style>
