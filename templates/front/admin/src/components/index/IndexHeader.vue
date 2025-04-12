<template>
	<div class="navbar">
		<div class="title">
			<span class="title-name">{{this.$project.projectName}}</span>
		</div>
		<div class="dropdown-box">
			<div class="el-dropdown-link">
				<el-image v-if="user" :src="avatar?this.$base.url + avatar : require('@/assets/img/avator.png')"
					fit="cover"></el-image>
				<span class="label">欢迎您，</span>
				<span class="nickname">{{this.$storage.get('adminName')}}</span>
			</div>
			<div class="top-el-dropdown-menu-2">
				<div class="item1" @click="handleCommand('')">首页</div>
				<div class="item2" @click="handleCommand('center')">个人中心</div>
				<div class="item4" @click="handleCommand('logout')">退出登录</div>
			</div>
		</div>
		<el-dialog :title="remindForm.title" :append-to-body="true" :visible.sync="remindVisibie" width="60%">
			<div class="ql-snow ql-editor" v-html="remindForm.content"></div>
		</el-dialog>
	</div>
</template>

<script>
	import {
		Loading
	} from 'element-ui';
	import axios from 'axios';
	export default {
		data() {
			return {
				dialogVisible: false,
				ruleForm: {},
				user: null,
				remindVisibie: false,
				remindForm: {},
				timesAll: null,
				timesOnce: null,
			};
		},
		async created() {
			if (this.$storage.get('sessionTable') != 'users') {
				this.getRecommendAll()
				this.getRecommendOnce()
			}
			if (this.$storage.get('sessionTable') == 'users') {
				await this.$http.get('baoxiuxinxi/page', {
					params: {
						limit: 1000,
						sfsh: '待审核'
					}
				}).then(rs => {
					if(rs.data.data.list.length) {
						this.$alert('您有新的报修信息等待审核，请及时处理', '提示', {
							confirmButtonText: '确定',
							callback: async action => {
								
							}
						});
					}
				})
				await this.$http.get('baoxiuxinxi/page', {
					params: {
						limit: 1000,
						sfsh: '是',
						baoxiuzhuangtai: '待分配'
					}
				}).then(rs2 => {
					if(rs2.data.data.list.length) {
						this.$alert('您有新的报修信息等待分配，请及时处理', '提示', {
							confirmButtonText: '确定',
							callback: action => {
								
							}
						});
					}
				})
			}
			if (this.$storage.get('sessionTable') == "weixiurenyuan") {
				await this.$http.get('fenpeiweixiu/page', {
					params: {
						limit: 1000,
						sfsh: '待审核'
					}
				}).then(rs => {
					if(rs.data.data.list.length) {
						this.$alert('您有新的维修订单等待审核，请及时处理', '提示', {
							confirmButtonText: '确定',
							callback: async action => {
								
							}
						});
					}
				})
				await this.$http.get('fenpeiweixiu/page', {
					params: {
						limit: 1000,
						sfsh: '是',
						zhuangtai: '待处理'
					}
				}).then(rs2 => {
					if(rs2.data.data.list.length) {
						this.$alert('您有新的维修订单等待完成，请及时处理', '提示', {
							confirmButtonText: '确定',
							callback: action => {
								
							}
						});
					}
				})
			}
		},
		computed: {
			avatar() {
				return this.$storage.get('headportrait') ? this.$storage.get('headportrait') : ''
			},
		},
		destroyed() {
			if (this.$storage.get('sessionTable') != 'users') {
				clearTimeout(this.timesAll)
				clearTimeout(this.timesOnce)
			}
		},
		mounted() {
			let sessionTable = this.$storage.get("sessionTable")
			this.$http({
				url: sessionTable + '/session',
				method: "get"
			}).then(({
				data
			}) => {
				if (data && data.code === 0) {
					if (sessionTable == 'yonghu') {
						this.$storage.set('headportrait', data.data.touxiang)
					}
					if (sessionTable == 'weixiurenyuan') {
						this.$storage.set('headportrait', data.data.touxiang)
					}
					if (sessionTable == 'users') {
						this.$storage.set('headportrait', data.data.image)
					}
					this.$storage.set('userForm', JSON.stringify(data.data))
					this.user = data.data;
					this.$storage.set('userid', data.data.id);
				} else {
					let message = this.$message
					message.error(data.msg);
				}
			});
		},
		methods: {
			compareDate(s1, s2) {
				return ((new Date(s1.replace(/-/g, "\/"))) > (new Date(s2.replace(/-/g, "\/"))));
			},
			async getRecommendAll() {
				let that = this
				this.$http({
					url: 'popupremind/list',
					method: 'get',
					params: {
						type: '全局'
					}
				}).then(async res => {
					if (res.data && res.data.code == 0) {
						for (let x in res.data.data.list) {
							if (this.compareDate(this.getCurDateTime(), res.data.data.list[x]
									.remindtime)) {
								await this.$http({
									url: 'storeup/page',
									method: 'get',
									params: {
										refid: res.data.data.list[x].id,
										tablename: 'popupremind',
										type: '61',
									}
								}).then(obj => {
									if (obj.data && obj.data.code == 0) {
										if (!obj.data.data.list.length) {
											res.data.data.list[x].content = res.data.data.list[x]
												.content.replace(/img src/gi,
													"img style=\"width:100%;\" src");
											this.$notify({
												title: res.data.data.list[x].title,
												dangerouslyUseHTMLString: true,
												message: res.data.data.list[x].brief,
												duration: 0,
												position: 'bottom-right',
												onClick() {
													that.remindForm = res.data.data.list[x]
													that.remindVisibie = true
												}
											})
											this.$http({
												url: 'storeup/add',
												method: 'post',
												data: {
													userid: this.$storage.get('userid'),
													refid: res.data.data.list[x].id,
													tablename: 'popupremind',
													name: res.data.data.list[x].title,
													type: '61',
												}
											})
										}
									}
								})
							}
						}
						this.timesAll = setTimeout(() => {
							this.getRecommendAll()
						}, 10000)
					}
				})
			},
			async getRecommendOnce() {
				let that = this
				this.$http({
					url: 'popupremind/page',
					method: 'get',
					params: {
						type: '个人'
					}
				}).then(async res => {
					if (res.data && res.data.code == 0) {
						for (let x in res.data.data.list) {
							if (this.compareDate(this.getCurDateTime(), res.data.data.list[x]
									.remindtime)) {
								await this.$http({
									url: 'storeup/page',
									method: 'get',
									params: {
										refid: res.data.data.list[x].id,
										tablename: 'popupremind',
										type: '61',
									}
								}).then(obj => {
									if (obj.data && obj.data.code == 0) {
										if (!obj.data.data.list.length) {
											res.data.data.list[x].content = res.data.data.list[x]
												.content.replace(/img src/gi,
													"img style=\"width:100%;\" src");
											this.$notify({
												title: res.data.data.list[x].title,
												dangerouslyUseHTMLString: true,
												message: res.data.data.list[x].brief,
												duration: 0,
												position: 'top-right',
												onClick() {
													that.remindForm = res.data.data.list[x]
													that.remindVisibie = true
												}
											})
											this.$http({
												url: 'storeup/add',
												method: 'post',
												data: {
													userid: this.$storage.get('userid'),
													refid: res.data.data.list[x].id,
													tablename: 'popupremind',
													name: res.data.data.list[x].title,
													type: '61',
												}
											})
										}
									}
								})
							}
						}
						this.timesOnce = setTimeout(() => {
							this.getRecommendOnce()
						}, 10000)
					}
				})
			},
			handleCommand(name) {
				if (name == 'logout') {
					this.onLogout()
				} else {
					let router = this.$router
					name = '/' + name
					router.push(name)
				}
			},
			onLogout() {
				let storage = this.$storage
				let router = this.$router
				storage.clear()
				this.$store.dispatch('tagsView/delAllViews')
				router.replace({
					name: "login"
				});
			},
			onIndexTap() {
				localStorage.setItem("frontToken", localStorage.getItem("Token"));
				localStorage.setItem("frontRole", localStorage.getItem("role"));
				localStorage.setItem("frontSessionTable", localStorage.getItem("sessionTable"));
				localStorage.setItem("frontHeadportrait", localStorage.getItem("headportrait"));
				localStorage.setItem("UserTableName", localStorage.getItem("sessionTable"));
				localStorage.setItem("frontUserid", localStorage.getItem("userid"));
				localStorage.setItem("username", localStorage.getItem("adminName"));
				window.location.href = `${this.$base.indexUrl}`
			},
		}
	};
</script>


<style lang="scss" scoped>
	.navbar {
		.title {
			top: 10px;
			left: 40px;
			display: block;
			position: absolute;

			.title-name {
				padding: 0;
				color: #fff;
				font-weight: 600;
				font-size: 26px;
				line-height: 50px;
				float: left;
			}
		}

		.dropdown-box {
			color: inherit;
			display: flex;
			font-size: inherit;
			right: 20px;

			.el-dropdown-link {
				display: flex;
				align-items: center;

				.el-image {
					border-radius: 100%;
					margin: 0 5px;
					object-fit: cover;
					display: none;
					width: 42px;
					height: 42px;
				}

				.label {
					color: inherit;
					display: none;
					font-size: inherit;
					line-height: 32px;
				}

				.nickname {
					padding: 0 5px;
					color: inherit;
					display: none;
					font-size: inherit;
					line-height: 32px;
				}
			}

			.top-el-dropdown-menu-2 {
				display: flex;
				justify-content: center;
				align-items: center;

				div.item1 {
					cursor: pointer;
					padding: 0 5px;
					color: #fff;
					font-size: 14px;
					line-height: 32px;
				}

				div.item1:hover {
					color: #ffffff80;
				}

				div.item2 {
					padding: 0 5px;
					color: #fff;
					font-size: 14px;
					line-height: 32px;
				}

				div.item2:hover {
					color: #ffffff80;
				}

				div.item4 {
					padding: 0 5px;
					color: #fff;
					font-size: 14px;
					line-height: 32px;
				}

				div.item4:hover {
					color: #ffffff80;
				}
			}
		}
	}
</style>