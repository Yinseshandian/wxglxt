import Vue from 'vue';
//配置路由
import VueRouter from 'vue-router'
Vue.use(VueRouter);
//1.创建组件
import Index from '@/views/index'
import Home from '@/views/home'
import Login from '@/views/login'
import NotFound from '@/views/404'
import UpdatePassword from '@/views/update-password'
import pay from '@/views/pay'
import register from '@/views/register'
import center from '@/views/center'
	import weixiurenyuan from '@/views/modules/weixiurenyuan/list'
	import baoxiuxinxi from '@/views/modules/baoxiuxinxi/list'
	import yonghu from '@/views/modules/yonghu/list'
	import fenpeiweixiu from '@/views/modules/fenpeiweixiu/list'
	import weixiuzhishiku from '@/views/modules/weixiuzhishiku/list'
	import weixiujilu from '@/views/modules/weixiujilu/list'
	import weixiujieguo from '@/views/modules/weixiujieguo/list'
	import weixiuleixing from '@/views/modules/weixiuleixing/list'
	import menu from '@/views/modules/menu/list'
	import weixiupingjia from '@/views/modules/weixiupingjia/list'


//2.配置路由   注意：名字
export const routes = [{
	path: '/',
	name: '系统首页',
	component: Index,
	children: [{
		// 这里不设置值，是把main作为默认页面
		path: '/',
		name: '系统首页',
		component: Home,
		meta: {icon:'', title:'center', affix: true}
	}, {
		path: '/updatePassword',
		name: '修改密码',
		component: UpdatePassword,
		meta: {icon:'', title:'updatePassword'}
	}, {
		path: '/pay',
		name: '支付',
		component: pay,
		meta: {icon:'', title:'pay'}
	}, {
		path: '/center',
		name: '个人信息',
		component: center,
		meta: {icon:'', title:'center'}
	}
	,{
		path: '/weixiurenyuan',
		name: '维修人员',
		component: weixiurenyuan
	}
	,{
		path: '/baoxiuxinxi',
		name: '报修信息',
		component: baoxiuxinxi
	}
	,{
		path: '/yonghu',
		name: '用户',
		component: yonghu
	}
	,{
		path: '/fenpeiweixiu',
		name: '分配维修',
		component: fenpeiweixiu
	}
	,{
		path: '/weixiuzhishiku',
		name: '维修知识库',
		component: weixiuzhishiku
	}
	,{
		path: '/weixiujilu',
		name: '维修记录',
		component: weixiujilu
	}
	,{
		path: '/weixiujieguo',
		name: '维修结果',
		component: weixiujieguo
	}
	,{
		path: '/weixiuleixing',
		name: '维修类型',
		component: weixiuleixing
	}
	,{
		path: '/menu',
		name: '菜单列表',
		component: menu
	}
	,{
		path: '/weixiupingjia',
		name: '维修评价',
		component: weixiupingjia
	}
	]
	},
	{
		path: '/login',
		name: 'login',
		component: Login,
		meta: {icon:'', title:'login'}
	},
	{
		path: '/register',
		name: 'register',
		component: register,
		meta: {icon:'', title:'register'}
	},
	{
		path: '*',
		component: NotFound
	}
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
	mode: 'hash',
	/*hash模式改为history*/
	routes // （缩写）相当于 routes: routes
})
const originalPush = VueRouter.prototype.push
//修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
	return originalPush.call(this, location).catch(err => err)
}
export default router;
