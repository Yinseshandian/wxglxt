<template>
	<div class="main-content" :style='{"padding":"20px 30px","fontSize":"15px","flexWrap":"wrap","display":"flex"}'>
		<!-- 列表页 -->
		<template v-if="showFlag">
			<el-form class="center-form-pv" :style='{"width":"100%","margin":"0 10px 20px"}' :inline="true" :model="searchForm">
				<el-row :style='{"width":"100%","padding":"10px","alignItems":"center","flexWrap":"wrap","background":"none","display":"flex"}' >
					<div :style='{"alignItems":"center","margin":"0 10px 0 0","display":"flex"}'>
						<label :style='{"margin":"0 5px 0 0","whiteSpace":"nowrap","color":"#fff","display":"inline-block","width":"auto","lineHeight":"40px","fontSize":"15px","fontWeight":"500","height":"40px"}' class="item-label">用户姓名</label>
						<el-input v-model="searchForm.yonghuxingming" placeholder="用户姓名" @keydown.enter.native="search()" clearable></el-input>
					</div>
					<div :style='{"alignItems":"center","margin":"0 10px 0 0","display":"flex"}' class="select" label="维修类型" prop="weixiuleixing">
						<label :style='{"margin":"0 5px 0 0","whiteSpace":"nowrap","color":"#fff","display":"inline-block","width":"auto","lineHeight":"40px","fontSize":"15px","fontWeight":"500","height":"40px"}' class="item-label">维修类型</label>
						<el-select clearable v-model="searchForm.weixiuleixing" placeholder="请选择维修类型" >
							<el-option v-for="(item,index) in weixiuleixingOptions" v-bind:key="index" :label="item" :value="item"></el-option>
						</el-select>
					</div>
					<div :style='{"alignItems":"center","margin":"0 10px 0 0","display":"flex"}' class="select">
						<label :style='{"margin":"0 5px 0 0","whiteSpace":"nowrap","color":"#fff","display":"inline-block","width":"auto","lineHeight":"40px","fontSize":"15px","fontWeight":"500","height":"40px"}' class="item-label">是否通过</label>
						<el-select clearable v-model="searchForm.sfsh" placeholder="是否通过">
							<el-option v-for="(item,index) in sfshOptions" v-bind:key="index" :label="item" :value="item"></el-option>
						</el-select>
					</div>
					<el-button class="search" type="success" @click="search()">
						<span class="icon iconfont icon-fangdajing07" :style='{"margin":"0 2px","fontSize":"16px","color":"#fff","height":"40px"}'></span>
						查询
					</el-button>
				</el-row>

				<el-row class="actions" :style='{"padding":"10px","margin":"20px 0","flexWrap":"wrap","background":"none","flexDirection":"row-reverse","display":"flex","width":"100%","justifyContent":"flex-start"}'>
					<el-button class="add" v-if="isAuth('baoxiuxinxi','新增')" type="success" @click="addOrUpdateHandler()">
						<span class="icon iconfont icon-tianjia14" :style='{"margin":"0 2px","fontSize":"inherit","color":"inherit","height":"38px"}'></span>
						创建
					</el-button>
					<el-button class="del" v-if="isAuth('baoxiuxinxi','删除')" :disabled="dataListSelections.length?false:true" type="danger" @click="deleteHandler()">
						<span class="icon iconfont icon-shanchu9" :style='{"margin":"0 2px","fontSize":"inherit","color":"inherit","height":"38px"}'></span>
						删除
					</el-button>


					<el-button class="btn18" v-if="isAuth('baoxiuxinxi','审核')" :disabled="dataListSelections.length?false:true" type="success" @click="shBatchDialog()">
						<span class="icon iconfont icon-shenhe2" :style='{"margin":"0 2px","fontSize":"inherit","color":"inherit","height":"38px"}'></span>
						审核
					</el-button>
					<el-button class="btn18" v-if="isAuth('baoxiuxinxi','维修类型')" type="success" @click="chartDialog1()">
						<span class="icon iconfont icon-qita20" :style='{"margin":"0 2px","fontSize":"inherit","color":"inherit","height":"38px"}'></span>
						维修类型
					</el-button>
					<el-button class="btn18" v-if="isAuth('baoxiuxinxi','紧急程度')" type="success" @click="chartDialog2()">
						<span class="icon iconfont icon-qita20" :style='{"margin":"0 2px","fontSize":"inherit","color":"inherit","height":"38px"}'></span>
						紧急程度
					</el-button>
				</el-row>
			</el-form>
			<div :style='{"width":"100%","padding":"0 10px","fontSize":"14px","color":"#000"}'>
				<el-table class="tables"
					:stripe='false'
					:style='{"padding":"0","borderColor":"#9E9E9E","borderRadius":"20px 20px 0 0","borderWidth":"1px 0 0 1px","background":"#fff","width":"100%","fontSize":"inherit","borderStyle":"solid"}' 
					:border='true'
					v-if="isAuth('baoxiuxinxi','查看')"
					:data="dataList"
					v-loading="dataListLoading"
				@selection-change="selectionChangeHandler">
					<el-table-column :resizable='false' type="selection" align="center" width="50"></el-table-column>
					<el-table-column :resizable='false' :sortable='false' label="序号" type="index" width="50" />
					<el-table-column :resizable='false' :sortable='false'  
						prop="yonghuzhanghao"
						label="用户账号">
						<template slot-scope="scope">
							{{scope.row.yonghuzhanghao}}
						</template>
					</el-table-column>
					<el-table-column :resizable='false' :sortable='false'  
						prop="yonghuxingming"
						label="用户姓名">
						<template slot-scope="scope">
							{{scope.row.yonghuxingming}}
						</template>
					</el-table-column>
					<el-table-column :resizable='false' :sortable='false'  
						prop="lianxifangshi"
						label="联系方式">
						<template slot-scope="scope">
							{{scope.row.lianxifangshi}}
						</template>
					</el-table-column>
					<el-table-column :resizable='false' :sortable='false'  
						prop="weixiuleixing"
						label="维修类型">
						<template slot-scope="scope">
							{{scope.row.weixiuleixing}}
						</template>
					</el-table-column>
					<el-table-column :resizable='false' :sortable='false'  
						prop="weixiuwupin"
						label="维修物品">
						<template slot-scope="scope">
							{{scope.row.weixiuwupin}}
						</template>
					</el-table-column>
					<el-table-column :resizable='false' :sortable='false'  
						prop="baoxiushijian"
						label="报修时间">
						<template slot-scope="scope">
							{{scope.row.baoxiushijian}}
						</template>
					</el-table-column>
					<el-table-column :resizable='false' :sortable='false'  
						prop="guzhangmiaoshu"
						label="故障描述">
						<template slot-scope="scope">
							{{scope.row.guzhangmiaoshu}}
						</template>
					</el-table-column>
					<el-table-column  :resizable='false' prop="baoxiutupian" width="200" label="报修图片">
						<template slot-scope="scope">
							<div v-if="scope.row.baoxiutupian">
								<img v-if="scope.row.baoxiutupian.substring(0,4)=='http'&&scope.row.baoxiutupian.split(',w').length>1" :src="scope.row.baoxiutupian" width="100" height="100" style="object-fit: cover" @click="imgPreView(scope.row.baoxiutupian)">
								<img v-else-if="scope.row.baoxiutupian.substring(0,4)=='http'" :src="scope.row.baoxiutupian.split(',')[0]" width="100" height="100" style="object-fit: cover" @click="imgPreView(scope.row.baoxiutupian.split(',')[0])">
								<img v-else :src="$base.url+scope.row.baoxiutupian.split(',')[0]" width="100" height="100" style="object-fit: cover" @click="imgPreView($base.url+scope.row.baoxiutupian.split(',')[0])">
							</div>
							<div v-else>无图片</div>
						</template>
					</el-table-column>
					<el-table-column :resizable='false' :sortable='false'  
						prop="guzhangdidian"
						label="故障地点">
						<template slot-scope="scope">
							{{scope.row.guzhangdidian}}
						</template>
					</el-table-column>
					<el-table-column :resizable='false' :sortable='false'  
						prop="baoxiuzhuangtai"
						label="报修状态">
						<template slot-scope="scope">
							{{scope.row.baoxiuzhuangtai}}
						</template>
					</el-table-column>
					<el-table-column :resizable='false' :sortable='false'  
						prop="jinjichengdu"
						label="紧急程度">
						<template slot-scope="scope">
							{{scope.row.jinjichengdu}}
						</template>
					</el-table-column>
					<el-table-column :resizable='false' :sortable='false' prop="shhf" label="审核回复" show-overflow-tooltip>
						<template slot-scope="scope">
							<div style="white-space: nowrap;">{{scope.row.shhf}}</div>
						</template>
					</el-table-column>
					<el-table-column :resizable='false' :sortable='false' prop="sfsh" label="审核状态">
						<template slot-scope="scope">
							<el-tag v-if="scope.row.sfsh=='否'" type="danger">未通过</el-tag>
							<el-tag v-if="scope.row.sfsh=='待审核'" type="warning">待审核</el-tag>
							<el-tag v-if="scope.row.sfsh=='是'" type="success">通过</el-tag>
						</template>
					</el-table-column>
					
					<el-table-column width="300" label="操作">
						<template slot-scope="scope">
							<el-button class="view" v-if=" isAuth('baoxiuxinxi','查看')" type="success" @click="addOrUpdateHandler(scope.row.id,'info')">
								<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#fff","display":"none","height":"40px"}'></span>
								查看
							</el-button>
							<el-button class="btn8" v-if="isAuth('baoxiuxinxi','分配')" @click="fenpeiweixiuCrossAddOrUpdateHandler(scope.row,'cross','是','','baoxiuzhuangtai','已分配','已分配,待分配'.split(',')[0])" type="success">
								<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#fff","display":"none","height":"40px"}'></span>
								分配
							</el-button>
							<el-button class="edit" v-if=" isAuth('baoxiuxinxi','修改')  && scope.row.sfsh=='待审核' " type="success" @click="addOrUpdateHandler(scope.row.id)">
								<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#fff","display":"none","height":"40px"}'></span>
								编辑
							</el-button>




							<el-button class="del" v-if="isAuth('baoxiuxinxi','删除') " type="primary" @click="deleteHandler(scope.row.id )">
								<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#fff","display":"none","height":"40px"}'></span>
								删除
							</el-button>
						</template>
					</el-table-column>
				</el-table>
			</div>
			<el-pagination
				@size-change="sizeChangeHandle"
				@current-change="currentChangeHandle"
				:current-page="pageIndex"
				background
				:page-sizes="[10, 50, 100, 200]"
				:page-size="pageSize"
				:layout="layouts.join()"
				:total="totalPage"
				prev-text="上一页 "
				next-text="下一页 "
				:hide-on-single-page="false"
				:style='{"padding":"0","boxShadow":"0px 2px 5px 0px rgba(0,0,0,0.3)","margin":"20px auto 0","whiteSpace":"nowrap","color":"#333","alignItems":"center","textAlign":"center","display":"flex","justifyContent":"center","overflow":"hidden","borderRadius":"30px","background":"#fff","width":"auto","fontSize":"inherit","fontWeight":"500"}'
			></el-pagination>
		</template>
		
		<!-- 添加/修改页面  将父组件的search方法传递给子组件-->
		<add-or-update v-if="addOrUpdateFlag" :parent="this" ref="addOrUpdate"></add-or-update>

		<fenpeiweixiu-cross-add-or-update v-if="fenpeiweixiuCrossAddOrUpdateFlag" :parent="this" ref="fenpeiweixiuCrossaddOrUpdate"></fenpeiweixiu-cross-add-or-update>

		
		<el-dialog :title="this.batchIds.length>1?'批量审核':'审核'" :visible.sync="sfshBatchVisiable" width="50%">
			<el-form ref="shBatchForm" :model="shBatchForm" :rules="shRules" label-width="80px">
				<el-form-item label="审核状态" prop="sfsh">
					<el-select v-model="shBatchForm.sfsh" placeholder="审核状态">
						<el-option label="通过" value="是"></el-option>
						<el-option label="不通过" value="否"></el-option>
						<el-option label="待审核" value="待审核"></el-option>
					</el-select>
				</el-form-item>
				<el-form-item label="内容" prop="shhf">
					<el-input type="textarea" :rows="8" v-model="shBatchForm.shhf"></el-input>
				</el-form-item>
			</el-form>
			<span slot="footer" class="dialog-footer">
				<el-button @click="sfshBatchVisiable=false">取 消</el-button>
				<el-button type="primary" @click="shBatchHandler">确 定</el-button>
			</span>
		</el-dialog>


		<el-dialog
			:visible.sync="chartVisiable1"
			width="800">
			<div id="weixiuleixingChart1" style="width:100%;height:600px;"></div>
			<span slot="footer" class="dialog-footer">
				<el-button @click="chartDialog1">返回</el-button>
			</span>
		</el-dialog>
		<el-dialog
			:visible.sync="chartVisiable2"
			width="800">
			<div id="jinjichengduChart2" style="width:100%;height:600px;"></div>
			<span slot="footer" class="dialog-footer">
				<el-button @click="chartDialog2">返回</el-button>
			</span>
		</el-dialog>

		<el-dialog title="预览图" :visible.sync="previewVisible" width="50%">
			<img :src="previewImg" alt="" style="width: 100%;">
		</el-dialog>
	</div>
</template>

<script>
	import * as echarts from 'echarts'
	import chinaJson from "@/components/echarts/china.json";
	import axios from 'axios';
	import AddOrUpdate from "./add-or-update";
	import fenpeiweixiuCrossAddOrUpdate from "../fenpeiweixiu/add-or-update";
	import {
		Loading
	} from 'element-ui';
	export default {
		data() {
			return {
				indexQueryCondition: '',
				weixiuleixingOptions: [],
				searchForm: {
					key: ""
				},
				form:{},
				sfshOptions: [],
				dataList: [],
				pageIndex: 1,
				pageSize: 10,
				totalPage: 0,
				dataListLoading: false,
				dataListSelections: [],
				showFlag: true,
				sfshVisiable: false,
				shForm: {},
				sfshBatchVisiable: false,
				shBatchForm: {
					sfsh:'',
					shhf:''
				},
				shRules: {
					sfsh:[{ required: true, message: '审核状态不能为空', trigger: 'blur' },],
					shhf:[{ required: true, message: '审核回复不能为空', trigger: 'blur' },],
				},
				batchIds:[],
				shList: [],
				chartVisiable1: false,
				line: {"backgroundColor":"transparent","yAxis":{"axisLabel":{"borderType":"solid","rotate":0,"padding":0,"shadowOffsetX":0,"margin":15,"backgroundColor":"transparent","borderColor":"#000","shadowOffsetY":0,"color":"#333","shadowBlur":0,"show":true,"inside":false,"ellipsis":"...","overflow":"none","borderRadius":0,"borderWidth":0,"width":"","fontSize":12,"lineHeight":24,"shadowColor":"transparent","fontWeight":"normal","height":""},"axisTick":{"show":true,"length":5,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"inside":false},"splitLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#666","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":true},"axisLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":true},"splitArea":{"show":false,"areaStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"rgba(25,25,25,0.3)","opacity":1,"shadowBlur":10,"shadowColor":"rgba(0,0,0,.5)"}}},"xAxis":{"axisLabel":{"borderType":"solid","rotate":0,"padding":0,"shadowOffsetX":0,"margin":4,"backgroundColor":"transparent","borderColor":"#000","shadowOffsetY":0,"color":"#333","shadowBlur":0,"show":true,"inside":false,"ellipsis":"...","overflow":"none","borderRadius":0,"borderWidth":0,"width":"","fontSize":12,"lineHeight":24,"shadowColor":"transparent","fontWeight":"normal","height":""},"axisTick":{"show":true,"length":5,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"inside":false},"splitLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":false},"axisLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":true},"splitArea":{"show":false,"areaStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"rgba(25,25,25,.3)","opacity":1,"shadowBlur":10,"shadowColor":"rgba(0,0,0,.5)"}}},"color":["#179BD7","#91CC75","#507AFC","#FAC858","#93BEFF","#0E2732","#3E6DFF","#9a60b4","#ea7ccc"],"legend":{"padding":0,"itemGap":10,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#666","shadowOffsetY":0,"orient":"horizontal","shadowBlur":0,"bottom":"auto","itemHeight":14,"show":true,"icon":"roundRect","itemStyle":{"borderType":"solid","shadowOffsetX":0,"borderColor":"inherit","shadowOffsetY":0,"color":"#333","shadowBlur":0,"borderWidth":0,"opacity":1,"shadowColor":"transparent"},"right":"auto","top":"auto","borderRadius":0,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"inherit","shadowBlur":0,"width":"auto","type":"inherit","opacity":1,"shadowColor":"transparent"},"left":"right","borderWidth":0,"width":"80%","itemWidth":20,"textStyle":{"textBorderWidth":0,"color":"#333","textShadowColor":"transparent","ellipsis":"...","overflow":"none","fontSize":12,"lineHeight":24,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":500,"textBorderColor":"transparent","textShadowBlur":0},"shadowColor":"rgba(0,0,0,.3)","height":"auto"},"series":{"showSymbol":true,"symbol":"emptyCircle","symbolSize":10},"tooltip":{"backgroundColor":"#123","textStyle":{"color":"#fff"}},"title":{"borderType":"solid","padding":0,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#666","shadowOffsetY":0,"shadowBlur":0,"bottom":"auto","show":true,"right":"auto","top":"auto","borderRadius":0,"left":"left","borderWidth":0,"textStyle":{"textBorderWidth":0,"color":"#333","textShadowColor":"transparent","fontSize":14,"lineHeight":24,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":600,"textBorderColor":"#666","textShadowBlur":0},"shadowColor":"transparent"}},
				bar: {"backgroundColor":"transparent","yAxis":{"axisLabel":{"borderType":"solid","rotate":0,"padding":0,"shadowOffsetX":0,"margin":12,"backgroundColor":"transparent","borderColor":"#666","shadowOffsetY":0,"color":"#333","shadowBlur":0,"show":true,"inside":false,"ellipsis":"...","overflow":"none","borderRadius":0,"borderWidth":0,"width":"","fontSize":12,"lineHeight":24,"shadowColor":"transparent","fontWeight":"normal","height":""},"axisTick":{"show":false,"length":5,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"inside":false},"splitLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#666","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":false},"axisLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":true},"splitArea":{"show":false,"areaStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"rgba(25,25,25,0.3)","opacity":1,"shadowBlur":10,"shadowColor":"rgba(0,0,0,.5)"}}},"xAxis":{"axisLabel":{"borderType":"solid","rotate":0,"padding":0,"shadowOffsetX":0,"margin":4,"backgroundColor":"transparent","borderColor":"#000","shadowOffsetY":0,"color":"#333","shadowBlur":0,"show":true,"inside":false,"ellipsis":"...","overflow":"none","borderRadius":0,"borderWidth":0,"width":"","fontSize":12,"lineHeight":24,"shadowColor":"transparent","fontWeight":"normal","height":""},"axisTick":{"show":false,"length":5,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"inside":false},"splitLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":false},"axisLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":true},"splitArea":{"show":false,"areaStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"rgba(25,25,25,.3)","opacity":1,"shadowBlur":10,"shadowColor":"rgba(0,0,0,.5)"}}},"color":["#179BD7","#91CC75","#507AFC","#FAC858","#93BEFF","#0E2732","#3E6DFF","#9a60b4","#ea7ccc"],"legend":{"padding":0,"itemGap":10,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#666","shadowOffsetY":0,"orient":"horizontal","shadowBlur":0,"bottom":"auto","itemHeight":14,"show":true,"icon":"roundRect","itemStyle":{"borderType":"solid","shadowOffsetX":0,"borderColor":"inherit","shadowOffsetY":0,"color":"inherit","shadowBlur":0,"borderWidth":0,"opacity":1,"shadowColor":"transparent"},"right":"auto","top":"auto","borderRadius":0,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"inherit","shadowBlur":0,"width":"auto","type":"inherit","opacity":1,"shadowColor":"transparent"},"left":"right","borderWidth":0,"width":"80%","itemWidth":20,"textStyle":{"textBorderWidth":0,"color":"inherit","textShadowColor":"transparent","ellipsis":"...","overflow":"none","fontSize":12,"lineHeight":12,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":500,"textBorderColor":"transparent","textShadowBlur":0},"shadowColor":"rgba(0,0,0,.3)","height":"auto"},"series":{"barWidth":"auto","itemStyle":{"borderType":"solid","shadowOffsetX":0,"borderColor":"#666","shadowOffsetY":0,"color":"","borderRadius":20,"shadowBlur":4,"borderWidth":0,"opacity":1,"shadowColor":"#000"},"colorBy":"data","barCategoryGap":"20%"},"tooltip":{"backgroundColor":"#123","textStyle":{"color":"#fff"}},"title":{"borderType":"solid","padding":0,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#666","shadowOffsetY":0,"shadowBlur":0,"bottom":"auto","show":true,"right":"auto","top":"auto","borderRadius":0,"left":"left","borderWidth":0,"textStyle":{"textBorderWidth":0,"color":"#333","textShadowColor":"transparent","fontSize":14,"lineHeight":24,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":600,"textBorderColor":"#666","textShadowBlur":0},"shadowColor":"transparent"},"base":{"animate":false,"interval":2000}},
				pie: {"tooltip":{"backgroundColor":"#123","textStyle":{"color":"#fff"}},"backgroundColor":"transparent","color":["#179BD7","#91CC75","#507AFC","#FAC858","#93BEFF","#0E2732","#3E6DFF","#9a60b4","#ea7ccc"],"title":{"borderType":"solid","padding":0,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#666","shadowOffsetY":0,"shadowBlur":0,"bottom":"auto","show":true,"right":"auto","top":"auto","borderRadius":0,"left":"left","borderWidth":0,"textStyle":{"textBorderWidth":0,"color":"#333","textShadowColor":"transparent","fontSize":14,"lineHeight":14,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":600,"textBorderColor":"#666","textShadowBlur":0},"shadowColor":"transparent"},"legend":{"padding":0,"itemGap":10,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#666","shadowOffsetY":0,"orient":"horizontal","shadowBlur":0,"bottom":"auto","itemHeight":10,"show":true,"icon":"roundRect","itemStyle":{"borderType":"solid","shadowOffsetX":0,"borderColor":"inherit","shadowOffsetY":0,"color":"inherit","shadowBlur":0,"borderWidth":0,"opacity":1,"shadowColor":"transparent"},"right":0,"top":"auto","borderRadius":0,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"inherit","shadowBlur":0,"width":"auto","type":"inherit","opacity":1,"shadowColor":"transparent"},"left":"right","borderWidth":0,"width":"80%","itemWidth":20,"textStyle":{"textBorderWidth":0,"color":"inherit","textShadowColor":"transparent","ellipsis":"...","overflow":"none","fontSize":12,"lineHeight":12,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":500,"textBorderColor":"transparent","textShadowBlur":0},"shadowColor":"rgba(0,0,0,.3)","height":"auto"},"series":{"itemStyle":{"borderType":"solid","shadowOffsetX":0,"borderColor":"#666","shadowOffsetY":0,"color":"","shadowBlur":4,"borderWidth":0,"opacity":1,"shadowColor":"#000"},"label":{"borderType":"solid","rotate":0,"padding":0,"textBorderWidth":0,"backgroundColor":"transparent","borderColor":"#666","color":"inherit","show":true,"textShadowColor":"transparent","distanceToLabelLine":5,"ellipsis":"...","overflow":"none","borderRadius":0,"borderWidth":0,"fontSize":12,"lineHeight":18,"textShadowOffsetX":0,"position":"outside","textShadowOffsetY":0,"textBorderType":"solid","textBorderColor":"#666","textShadowBlur":0},"labelLine":{"show":false,"length":10,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"#666","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"#000"},"length2":14,"smooth":false}}},
				funnel: {"tooltip":{"backgroundColor":"#123","textStyle":{"color":"#fff"}},"backgroundColor":"transparent","color":["#179BD7","#91CC75","#507AFC","#FAC858","#93BEFF","#0E2732","#3E6DFF","#9a60b4","#ea7ccc"],"title":{"borderType":"solid","padding":2,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#ccc","shadowOffsetY":0,"shadowBlur":0,"bottom":"auto","show":true,"right":"auto","top":"auto","borderRadius":0,"left":"center","borderWidth":0,"textStyle":{"textBorderWidth":0,"color":"#666","textShadowColor":"transparent","fontSize":14,"lineHeight":12,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":500,"textBorderColor":"#ccc","textShadowBlur":0},"shadowColor":"transparent"},"legend":{"padding":5,"itemGap":10,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#ccc","shadowOffsetY":0,"orient":"vertical","shadowBlur":0,"bottom":"auto","itemHeight":10,"show":true,"icon":"roundRect","itemStyle":{"borderType":"solid","shadowOffsetX":0,"borderColor":"inherit","shadowOffsetY":0,"color":"inherit","shadowBlur":0,"borderWidth":0,"opacity":1,"shadowColor":"transparent"},"top":"auto","borderRadius":0,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"inherit","shadowBlur":0,"width":"auto","type":"inherit","opacity":1,"shadowColor":"transparent"},"left":"left","borderWidth":0,"width":"auto","itemWidth":20,"textStyle":{"textBorderWidth":0,"color":"inherit","textShadowColor":"transparent","ellipsis":"...","overflow":"none","fontSize":12,"lineHeight":20,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":500,"textBorderColor":"transparent","textShadowBlur":0},"shadowColor":"rgba(0,0,0,.3)","height":"auto"},"series":{"itemStyle":{"borderType":"solid","shadowOffsetX":0,"borderColor":"#000","shadowOffsetY":0,"color":"","shadowBlur":4,"borderWidth":0,"opacity":1,"shadowColor":"#000"},"label":{"borderType":"solid","rotate":0,"padding":0,"textBorderWidth":0,"backgroundColor":"transparent","borderColor":"#fff","color":"","show":true,"textShadowColor":"transparent","distanceToLabelLine":5,"ellipsis":"...","overflow":"none","borderRadius":0,"borderWidth":0,"fontSize":12,"lineHeight":18,"textShadowOffsetX":0,"position":"outside","textShadowOffsetY":0,"textBorderType":"solid","textBorderColor":"#fff","textShadowBlur":0},"labelLine":{"show":true,"length":10,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"#000"},"length2":14,"smooth":false}}},
				boardBase: {"funnelNum":8,"lineNum":8,"gaugeNum":8,"barNum":8,"pieNum":8},
				gauge: {"tooltip":{"backgroundColor":"#123","textStyle":{"color":"#fff"}},"backgroundColor":"transparent","color":["#179BD7","#91CC75","#507AFC","#FAC858","#93BEFF","#0E2732","#3E6DFF","#9a60b4","#ea7ccc"],"title":{"top":"top","left":"left","textStyle":{"fontSize":14,"lineHeight":24,"color":"#333","fontWeight":600}},"series":{"pointer":{"offsetCenter":[0,"10%"],"icon":"path://M2.9,0.7L2.9,0.7c1.4,0,2.6,1.2,2.6,2.6v115c0,1.4-1.2,2.6-2.6,2.6l0,0c-1.4,0-2.6-1.2-2.6-2.6V3.3C0.3,1.9,1.4,0.7,2.9,0.7z","width":8,"length":"80%"},"axisLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"opacity":0.5,"shadowBlur":1,"shadowColor":"#000"},"roundCap":true},"anchor":{"show":true,"itemStyle":{"color":"inherit"},"size":18,"showAbove":true},"emphasis":{"disabled":false},"progress":{"show":true,"roundCap":true,"overlap":true},"splitNumber":25,"detail":{"formatter":"{value}","backgroundColor":"inherit","color":"#fff","borderRadius":3,"width":20,"fontSize":12,"height":10},"title":{"fontSize":14},"animation":true}},
				chartVisiable2: false,
				addOrUpdateFlag:false,
				fenpeiweixiuCrossAddOrUpdateFlag: false,
				layouts: ["prev","pager","next"],
				previewImg: '',
				previewVisible: false,
			};
		},
		created() {
			this.init();
			this.getDataList();
			this.contentStyleChange();
		},
		mounted() {
		},
		filters: {
			htmlfilter: function (val) {
				return val.replace(/<[^>]*>/g).replace(/undefined/g,'');
			}
		},
		computed: {
			tablename(){
				return this.$storage.get('sessionTable')
			},
		},
		components: {
			AddOrUpdate,
			fenpeiweixiuCrossAddOrUpdate,
		},
		methods: {
			imgPreView(url){
				this.previewImg = url
				this.previewVisible = true
				
			},
			contentStyleChange() {
				this.contentPageStyleChange()
			},
			// 分页
			contentPageStyleChange(){
				let arr = []

				// if(this.contents.pageTotal) arr.push('total')
				// if(this.contents.pageSizes) arr.push('sizes')
				// if(this.contents.pagePrevNext){
				//   arr.push('prev')
				//   if(this.contents.pagePager) arr.push('pager')
				//   arr.push('next')
				// }
				// if(this.contents.pageJumper) arr.push('jumper')
				// this.layouts = arr.join()
				// this.contents.pageEachNum = 10
			},
			fenpeiweixiuCrossAddOrUpdateHandler(row,type,crossOptAudit,crossOptPay,statusColumnName,tips,statusColumnValue){
				if(crossOptAudit=='是'&&row.sfsh!='是') {
					this.$message({
						message: "请审核通过后再操作",
						type: "success",
						duration: 1500,
						onClose: () => {
						}
					});
					return
				}
				this.showFlag = false;
				this.addOrUpdateFlag = false;
				this.fenpeiweixiuCrossAddOrUpdateFlag = true;
				this.$storage.set('crossObj',row);
				this.$storage.set('crossTable','baoxiuxinxi');
				this.$storage.set('statusColumnName',statusColumnName);
				this.$storage.set('statusColumnValue',statusColumnValue);
				this.$storage.set('tips',tips);
				if(statusColumnName!=''&&!statusColumnName.startsWith("[")) {
					var obj = this.$storage.getObj('crossObj');
					for (var o in obj){
						if(o==statusColumnName && obj[o]==statusColumnValue){
							this.$message({
								message: tips,
								type: "success",
								duration: 1500,
								onClose: () => {
									this.getDataList();
								}
							});
							this.showFlag = true;
							this.fenpeiweixiuCrossAddOrUpdateFlag = false;
							return;
						}
					}
				}
				this.$nextTick(() => {
					this.$refs.fenpeiweixiuCrossaddOrUpdate.init(row.id,type);
				});
			},


			// 统计接口
			chartDialog1() {
				this.chartVisiable1 = !this.chartVisiable1;
				this.$nextTick(()=>{
					var weixiuleixingChart1 = echarts.init(document.getElementById("weixiuleixingChart1"),'macarons');
					this.$http({
						url: "baoxiuxinxi/group/weixiuleixing",
						method: "get",
					}).then(({ data }) => {
						if (data && data.code === 0) {
							let res = data.data;
							let xAxis = [];
							let yAxis = [];
							let pArray = []
							for(let i=0;i<res.length;i++){
								if(this.boardBase&&i==this.boardBase.barNum){
									break;
								}
								xAxis.push(res[i].weixiuleixing);
								yAxis.push(parseFloat((res[i].total)));
								pArray.push({
									value: parseFloat((res[i].total)),
									name: res[i].weixiuleixing
								})
							}
							var option = {};
							let titleObj = this.bar.title
							titleObj.text = '维修类型'
							
							const legendObj = this.bar.legend
							let tooltipObj = {trigger: 'item',formatter: '{b} : {c}'}
							tooltipObj = Object.assign(tooltipObj , this.bar.tooltip?this.bar.tooltip:{})
							let xAxisObj = this.bar.xAxis
							xAxisObj.type = 'category'
							xAxisObj.data = xAxis
							
							let yAxisObj = this.bar.yAxis
							yAxisObj.type = 'value'
							let seriesObj = {
								data: yAxis,
								type: 'bar',
							}
							seriesObj = Object.assign(seriesObj , this.bar.series)
							const gridObj = this.bar.grid
							option = {
								backgroundColor: this.bar.backgroundColor,
								color: this.bar.color,
								title: titleObj,
								legend: legendObj,
								grid: gridObj,
								tooltip: tooltipObj,
								xAxis: xAxisObj,
								yAxis: yAxisObj,
								series: [seriesObj]
							};
							// 使用刚指定的配置项和数据显示图表。
							weixiuleixingChart1.setOption(option);
							  //根据窗口的大小变动图表
							window.onresize = function() {
								weixiuleixingChart1.resize();
							};
						}else{
							this.$message({
								message: data.msg,
								type: "warning",
								duration: 1500,
							})
						}
					});
				})
			},

			// 统计接口
			chartDialog2() {
				this.chartVisiable2 = !this.chartVisiable2;
				this.$nextTick(()=>{

					var jinjichengduChart2 = echarts.init(document.getElementById("jinjichengduChart2"),'macarons');
					this.$http({
						url: "baoxiuxinxi/group/jinjichengdu",
						method: "get",
					}).then(({ data }) => {
						if (data && data.code === 0) {
							let res = data.data;
							let xAxis = [];
							let yAxis = [];
							let pArray = []
							for(let i=0;i<res.length;i++){
								if(this.boardBase&&i==this.boardBase.barNum){
									break;
								}
								xAxis.push(res[i].jinjichengdu);
								yAxis.push(parseFloat((res[i].total)));
								pArray.push({
									value: parseFloat((res[i].total)),
									name: res[i].jinjichengdu
								})
							}
							var option = {};
							let titleObj = this.bar.title
							titleObj.text = '紧急程度'
							
							const legendObj = this.bar.legend
							let tooltipObj = {trigger: 'item',formatter: '{b} : {c}'}
							tooltipObj = Object.assign(tooltipObj , this.bar.tooltip?this.bar.tooltip:{})
				
							let xAxisObj = this.bar.xAxis
							xAxisObj.type = 'category'
							xAxisObj.data = xAxis
							
							let yAxisObj = this.bar.yAxis
							yAxisObj.type = 'value'
							let seriesObj = {
								data: yAxis,
								type: 'bar',
							}
							seriesObj = Object.assign(seriesObj , this.bar.series)
							const gridObj = this.bar.grid

							option = {
								backgroundColor: this.bar.backgroundColor,
								color: this.bar.color,
								title: titleObj,
								legend: legendObj,
								tooltip: tooltipObj,
								xAxis: xAxisObj,
								yAxis: yAxisObj,
								series: [seriesObj],
								grid: gridObj
							};
							// 使用刚指定的配置项和数据显示图表。
							jinjichengduChart2.setOption(option);
							//根据窗口的大小变动图表
							window.onresize = function() {
								jinjichengduChart2.resize();
							};
						}else{
							this.$message({
								message: data.msg,
								type: "warning",
								duration: 1500,
							})
						}
					});
				})
			},


			init () {
				this.sfshOptions = "是,否,待审核".split(',');
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
			},
			search() {
				this.pageIndex = 1;
				this.getDataList();
			},

			// 获取数据列表
			getDataList() {
				this.dataListLoading = true;
				let params = {
					page: this.pageIndex,
					limit: this.pageSize,
					sort: 'id',
					order: 'desc',
				}
 				if(this.searchForm.yonghuxingming!='' && this.searchForm.yonghuxingming!=undefined){
					params['yonghuxingming'] = '%' + this.searchForm.yonghuxingming + '%'
				}
				if(this.searchForm.weixiuleixing!='' && this.searchForm.weixiuleixing!=undefined){
					params['weixiuleixing'] = this.searchForm.weixiuleixing
				}
				if(this.searchForm.baoxiuzhuangtai!='' && this.searchForm.baoxiuzhuangtai!=undefined){
					params['baoxiuzhuangtai'] = this.searchForm.baoxiuzhuangtai
				}
				if(this.searchForm.jinjichengdu!='' && this.searchForm.jinjichengdu!=undefined){
					params['jinjichengdu'] = this.searchForm.jinjichengdu
				}
				if(this.searchForm.sfsh!='' && this.searchForm.sfsh!=undefined){
					params['sfsh'] = this.searchForm.sfsh
				}
				let user = JSON.parse(this.$storage.getObj('userForm'))
				this.$http({
					url: "baoxiuxinxi/page",
					method: "get",
					params: params
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.dataList = data.data.list;
						this.totalPage = data.data.total;
					} else {
						this.dataList = [];
						this.totalPage = 0;
					}
					this.dataListLoading = false;
				});
			},
			// 每页数
			sizeChangeHandle(val) {
				this.pageSize = val;
				this.pageIndex = 1;
				this.getDataList();
			},
			// 当前页
			currentChangeHandle(val) {
				this.pageIndex = val;
				this.getDataList();
			},
			// 多选
			selectionChangeHandler(val) {
				this.dataListSelections = val;
			},
			// 添加/修改
			addOrUpdateHandler(id,type) {
				this.showFlag = false;
				this.addOrUpdateFlag = true;
				this.crossAddOrUpdateFlag = false;
				if(type!='info'&&type!='msg'){
					type = 'else';
				}
				this.$nextTick(() => {
					this.$refs.addOrUpdate.init(id,type);
				});
			},
			//批量审核窗口
			shBatchDialog(){
				for(let x in this.dataListSelections){
					if(this.dataListSelections[x].sfsh&&this.dataListSelections[x].sfsh!='待审核'){
						this.$message.error('存在已审核数据，不能继续操作');
						this.batchIds = []
						return false
					}
					this.batchIds.push(this.dataListSelections[x].id)
				}
				this.shList = this.dataListSelections
				this.sfshBatchVisiable = true
			},
			//批量审核
			shBatchHandler(){
				this.$refs["shBatchForm"].validate(valid => {
					if(valid){
						this.$confirm(`是否${this.batchIds.length>1?'一键审核':'审核'}选中数据?`, "提示", {
							confirmButtonText: "确定",
							cancelButtonText: "取消",
							type: "warning"
						}).then(() => {
							this.$http({
								url: "baoxiuxinxi/shBatch?sfsh="+this.shBatchForm.sfsh+"&shhf="+this.shBatchForm.shhf,
								method: "post",
								data: this.batchIds
							}).then(async ({ data }) => {
								if (data && data.code === 0) {
									if(this.shBatchForm.sfsh!='待审核'){
										for(let x in this.shList){
											await this.$http.get('yonghu/query',{params: {
												yonghuzhanghao: this.shList[x].yonghuzhanghao
											}}).then(async rs=>{
												let param = {
													userid: rs.data.data.id,
													title: '报修信息',
													type: '个人',
													brief: this.shBatchForm.sfsh=='是'?'审核通过':'审核不通过',
													content: `你提交的“报修信息”申请${this.shBatchForm.sfsh=='是'?'审核通过':'审核不通过'}`,
													remindtime: this.getCurDateTime(),
												}
												await this.$http.post('popupremind/add',param).then(rs=>{})
											})
										}
									}
									this.$message({
										message: "操作成功",
										type: "success",
										duration: 1500,
										onClose: () => {
											this.getDataList();
											this.sfshBatchVisiable = false
											this.batchIds = []
										}
									});
								} else {
									this.$message.error(data.msg);
								}
							});
						});
					}
				})
			},
			// 删除
			async deleteHandler(id ) {
				var ids = id? [Number(id)]: this.dataListSelections.map(item => {
					return Number(item.id);
				});
				await this.$confirm(`确定进行[${id ? "删除" : "批量删除"}]操作?`, "提示", {
					confirmButtonText: "确定",
					cancelButtonText: "取消",
					type: "warning"
				}).then(async () => {
					await this.$http({
						url: "baoxiuxinxi/delete",
						method: "post",
						data: ids
					}).then(async ({ data }) => {
						if (data && data.code === 0) {
							this.$message({
								message: "操作成功",
								type: "success",
								duration: 1500,
								onClose: () => {
									this.search();
								}
							});
			
						} else {
							this.$message.error(data.msg);
						}
					});
				});
			},


		}

	};
</script>
<style lang="scss" scoped>
	
	.center-form-pv {
		.el-date-editor.el-input {
			width: auto;
		}
	}
	
	.el-input {
		width: auto;
	}
	
	// form
	.center-form-pv .el-input {
		width: 100%;
	}
	.center-form-pv .el-input /deep/ .el-input__inner {
		border: 1px solid #E8E8E8;
		border-radius: 0px;
		padding: 0 12px;
		color: #666;
		width: 170px;
		font-size: 16px;
		height: 40px;
	}
	.center-form-pv .el-select {
		width: 100%;
	}
	.center-form-pv .el-select /deep/ .el-input__inner {
		border: 1px solid #E8E8E8;
		border-radius: 0px;
		padding: 0 10px;
		color: #666;
		width: 170px;
		font-size: 16px;
		height: 40px;
	}
	.center-form-pv .el-date-editor {
		width: 100%;
	}
	
	.center-form-pv .el-date-editor /deep/ .el-input__inner {
		border: 1px solid #E8E8E8;
		border-radius: 0px;
		padding: 0 10px 0 30px;
		color: #666;
		width: 170px;
		font-size: 16px;
		height: 40px;
	}
	
	.center-form-pv .search {
		border: 0;
		cursor: pointer;
		border-radius: 5px;
		padding: 0 15px;
		color: #fff;
		background: #179BD7;
		width: auto;
		font-size: 16px;
		height: 40px;
	}
	
	.center-form-pv .search:hover {
		opacity: 0.8;
	}
	
	.center-form-pv .actions .add {
		border: 1px solid #179BD7;
		cursor: pointer;
		border-radius: 5px;
		padding: 0 15px;
		margin: 4px;
		color: #fff;
		background: #179BD7;
		width: auto;
		font-size: inherit;
		height: 38px;
	}
	
	.center-form-pv .actions .add:hover {
		color: #aaa;
		opacity: 1;
	}
	
	.center-form-pv .actions .del {
		border: 1px solid #179BD7;
		cursor: pointer;
		border-radius: 5px;
		padding: 0 15px;
		margin: 4px;
		color: #179BD7;
		background: #fff;
		width: auto;
		font-size: inherit;
		height: 38px;
	}
	
	.center-form-pv .actions .del:hover {
		color: #AAA;
		opacity: 1;
	}
	
	.center-form-pv .actions .statis {
		border: 1px solid #179BD7;
		cursor: pointer;
		border-radius: 5px;
		padding: 0 15px;
		margin: 4px;
		color: #179BD7;
		background: #fff;
		width: auto;
		font-size: inherit;
		height: 38px;
	}
	
	.center-form-pv .actions .statis:hover {
		color: #AAA;
		opacity: 1;
	}
	
	.center-form-pv .actions .btn18 {
		border: 1px solid #179BD7;
		cursor: pointer;
		border-radius: 5px;
		padding: 0 15px;
		margin: 4px;
		color: #179BD7;
		background: #fff;
		width: auto;
		font-size: inherit;
		height: 38px;
	}
	
	.center-form-pv .actions .btn18:hover {
		color: #AAA;
		opacity: 1;
	}
	
	// table
	.el-table /deep/ .el-table__header-wrapper thead {
		color: #999;
		font-weight: 500;
		width: 100%;
	}
	
	.el-table /deep/ .el-table__header-wrapper thead tr {
		background: #179BD7;
	}
	
	.el-table /deep/ .el-table__header-wrapper thead tr th {
		padding: 10px 0;
		background: none;
		border-color: #eee;
		border-width: 0 1px 1px 0;
		border-style: solid;
		text-align: left;
	}

	.el-table /deep/ .el-table__header-wrapper thead tr th .cell {
		padding: 0 0 0 5px;
		word-wrap: normal;
		color: #fff;
		white-space: normal;
		font-weight: bold;
		display: flex;
		vertical-align: middle;
		font-size: 14px;
		line-height: 24px;
		text-overflow: ellipsis;
		word-break: break-all;
		width: 100%;
		align-items: center;
		position: relative;
		min-width: 110px;
	}

	.el-table /deep/ .el-table__body-wrapper {
		position: relative;
	}
	.el-table /deep/ .el-table__body-wrapper tbody {
		width: 100%;
	}

	.el-table /deep/ .el-table__body-wrapper tbody tr {
		background: #fff;
	}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td {
		padding: 4px 0;
		color: #333;
		background: #fff;
		font-size: inherit;
		border-color: #9E9E9E;
		border-width: 0 0px 1px 0;
		border-style: solid;
		text-align: left;
	}
	
		
	.el-table /deep/ .el-table__body-wrapper tbody tr:hover td {
		padding: 4px 0;
		color: #333;
		background: #f0f0f0;
		border-color: #9E9E9E;
		border-width: 0 0px 1px 0;
		border-style: solid;
		text-align: left;
	}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td {
		padding: 4px 0;
		color: #333;
		background: #fff;
		font-size: inherit;
		border-color: #9E9E9E;
		border-width: 0 0px 1px 0;
		border-style: solid;
		text-align: left;
	}

	.el-table /deep/ .el-table__body-wrapper tbody tr td .cell {
		padding: 0 0 0 5px;
		overflow: hidden;
		word-break: break-all;
		white-space: normal;
		font-size: inherit;
		line-height: 24px;
		text-overflow: ellipsis;
	}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .view {
		border: 1px solid #179BD7;
		cursor: pointer;
		border-radius: 5px;
		padding: 0 15px;
		box-shadow: 4px 4px 0 #179BD7;
		margin: 0 10px 10px 0;
		transform: skew(-15deg, 0deg);
		color: #179BD7;
		background: #fff;
		width: auto;
		font-size: 14px;
		height: 36px;
	}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .view:hover {
		color: #aaa;
		opacity: 1;
	}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .add {
	}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .add:hover {
	}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .edit {
		border: 1px solid #43B27F;
		cursor: pointer;
		border-radius: 5px;
		padding: 0 15px;
		box-shadow: 4px 4px 0 #43B27F;
		margin: 0 10px 10px 0;
		transform: skew(-15deg, 0deg);
		color: #43B27F;
		background: #fff;
		width: auto;
		font-size: 14px;
		height: 36px;
	}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .edit:hover {
		color: #aaa;
		opacity: 1;
	}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .del {
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
	}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .del:hover {
		color: #aaa;
		opacity: 1;
	}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .btn8 {
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
	}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td .btn8:hover {
		opacity: 0.8;
	}
	
	// pagination
	.main-content .el-pagination /deep/ .el-pagination__total {
		margin: 0 10px 0 0;
		color: #666;
		font-weight: 400;
		display: inline-block;
		vertical-align: top;
		font-size: inherit;
		line-height: 48px;
		height: 48px;
	}
	
	.main-content .el-pagination /deep/ .btn-prev {
		border: 1px solid #c2c2c2;
		border-radius: 2px;
		padding: 0 20px;
		margin: 0;
		color: #fff;
		background: #179BD7;
		display: inline-block;
		vertical-align: top;
		font-size: 20px;
		line-height: auto;
		min-width: 35px;
		height: 60px;
	}
	
	.main-content .el-pagination /deep/ .btn-next {
		border: 1px solid #c2c2c2;
		border-radius: 2px;
		padding: 0 20px;
		margin: 0;
		color: #fff;
		background: #179BD7;
		display: inline-block;
		vertical-align: top;
		font-size: 20px;
		line-height: auto;
		min-width: 35px;
		height: 60px;
	}
	
	.main-content .el-pagination /deep/ .btn-prev:disabled {
		border: 1px solid #c2c2c2;
		cursor: not-allowed;
		border-radius: 0;
		padding: 0 20px;
		margin: 0;
		color: #fff;
		background: #179BD7;
		display: inline-block;
		vertical-align: top;
		font-size: 20px;
		line-height: auto;
		height: 60px;
	}
	
	.main-content .el-pagination /deep/ .btn-next:disabled {
		border: 1px solid #c2c2c2;
		cursor: not-allowed;
		border-radius: 0;
		padding: 0 20px;
		margin: 0;
		color: #fff;
		background: #179BD7;
		display: inline-block;
		vertical-align: top;
		font-size: 20px;
		line-height: auto;
		height: 60px;
	}

	.main-content .el-pagination /deep/ .el-pager {
		padding: 0;
		margin: 0 10px;
		display: flex;
		vertical-align: top;
		align-items: center;
	}

	.main-content .el-pagination /deep/ .el-pager .number {
		cursor: pointer;
		border-radius: 2px;
		padding: 0 15px;
		margin: 0 10px;
		color: #666;
		background: none;
		display: inline-block;
		vertical-align: top;
		font-size: 16px;
		line-height: 40px;
		text-align: center;
		height: 40px;
	}
	
	.main-content .el-pagination /deep/ .el-pager .number:hover {
		cursor: pointer;
		border-radius: 50%;
		padding: 0 15px;
		margin: 0 10px;
		color: #fff;
		background: #179BD7;
		display: inline-block;
		vertical-align: top;
		font-size: 16px;
		line-height: 40px;
		text-align: center;
		height: 40px;
	}
	
	.main-content .el-pagination /deep/ .el-pager .number.active {
		cursor: pointer;
		border-radius: 50%;
		padding: 0 15px;
		margin: 0 10px;
		color: #fff;
		background: #179BD7;
		display: inline-block;
		vertical-align: top;
		font-size: 16px;
		line-height: 40px;
		text-align: center;
		height: 40px;
	}
	
	.main-content .el-pagination /deep/ .el-pagination__sizes {
		display: inline-block;
		vertical-align: top;
		font-size: 16px;
		line-height: 48px;
		height: 48px;
	}
	
	.main-content .el-pagination /deep/ .el-pagination__sizes .el-input {
		margin: 0 5px;
		width: 100px;
		position: relative;
	}
	
	.main-content .el-pagination /deep/ .el-pagination__sizes .el-input .el-input__inner {
		border: 1px solid #DCDFE6;
		cursor: pointer;
		padding: 0 25px 0 8px;
		color: #606266;
		display: inline-block;
		font-size: 16px;
		line-height: 28px;
		border-radius: 3px;
		outline: 0;
		background: #FFF;
		width: 100%;
		text-align: center;
		height: 28px;
	}
	
	.main-content .el-pagination /deep/ .el-pagination__sizes .el-input span.el-input__suffix {
		top: 0;
		position: absolute;
		right: 0;
		height: 100%;
	}
	
	.main-content .el-pagination /deep/ .el-pagination__sizes .el-input .el-input__suffix .el-select__caret {
		cursor: pointer;
		color: #C0C4CC;
		width: 25px;
		font-size: 14px;
		line-height: 48px;
		text-align: center;
	}
	
	.main-content .el-pagination /deep/ .el-pagination__jump {
		margin: 0 0 0 24px;
		color: #606266;
		display: inline-block;
		vertical-align: top;
		font-size: 16px;
		line-height: 48px;
		height: 48px;
	}
	
	.main-content .el-pagination /deep/ .el-pagination__jump .el-input {
		border-radius: 3px;
		padding: 0 2px;
		margin: 0 2px;
		display: inline-block;
		width: 50px;
		font-size: 14px;
		line-height: 18px;
		position: relative;
		text-align: center;
		height: 28px;
	}
	
	.main-content .el-pagination /deep/ .el-pagination__jump .el-input .el-input__inner {
		border: 1px solid #DCDFE6;
		cursor: pointer;
		padding: 0 3px;
		color: #606266;
		display: inline-block;
		font-size: 16px;
		line-height: 28px;
		border-radius: 3px;
		outline: 0;
		background: #FFF;
		width: 100%;
		text-align: center;
		height: 28px;
	}
	
	// list one
	.one .list1-view {
		border: 1px solid #179BD7;
		cursor: pointer;
		border-radius: 5px;
		padding: 0 15px;
		box-shadow: 4px 4px 0 #179BD7;
		margin: 0 10px 10px 0;
		transform: skew(-15deg, 0deg);
		color: #179BD7;
		background: #fff;
		width: auto;
		font-size: 14px;
		height: 36px;
	}
	
	.one .list1-view:hover {
		box-shadow: 4px 4px 0 #aaa;
		color: #aaa;
		border-color: #aaa;
		opacity: 1;
	}
	
	.one .list1-edit {
		border: 1px solid #43B27F;
		cursor: pointer;
		border-radius: 5px;
		padding: 0 15px;
		box-shadow: 4px 4px 0 #43B27F;
		margin: 0 10px 10px 0;
		transform: skew(-15deg, 0deg);
		color: #43B27F;
		background: #fff;
		width: auto;
		font-size: 14px;
		height: 36px;
	}
	
	.one .list1-edit:hover {
		box-shadow: 4px 4px 0 #aaa;
		color: #aaa;
		border-color: #aaa;
		opacity: 1;
	}
	
	.one .list1-del {
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
	}
	
	.one .list1-del:hover {
		box-shadow: 4px 4px 0 #aaa;
		color: #aaa;
		border-color: #aaa;
		opacity: 1;
	}
	
	.one .list1-btn8 {
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
	}
	
	.one .list1-btn8:hover {
		box-shadow: 4px 4px 0 #aaa;
		color: #aaa;
		border-color: #aaa;
		opacity: 1;
	}
	
	.main-content .el-table .el-switch {
		display: inline-flex;
		vertical-align: middle;
		line-height: 30px;
		position: relative;
		align-items: center;
		height: 30px;
	}
	.main-content .el-table .el-switch /deep/ .el-switch__label--left {
		cursor: pointer;
		margin: 0 10px 0 0;
		color: #333;
		font-weight: 500;
		display: inline-block;
		vertical-align: middle;
		font-size: 16px;
		transition: .2s;
		height: 30px;
	}
	.main-content .el-table .el-switch /deep/ .el-switch__label--right {
		cursor: pointer;
		margin: 0 0 0 10px;
		color: #333;
		font-weight: 500;
		display: inline-block;
		vertical-align: middle;
		font-size: 16px;
		transition: .2s;
		height: 30px;
	}
	.main-content .el-table .el-switch /deep/ .el-switch__core {
		border: 1px solid #75c0d6;
		cursor: pointer;
		border-radius: 15px;
		margin: 0;
		background: #75c0d6;
		display: inline-block;
		width: 42px;
		box-sizing: border-box;
		transition: border-color .3s,background-color .3s;
		height: 20px;
	}
	.main-content .el-table .el-switch /deep/ .el-switch__core::after {
		border-radius: 100%;
		top: 1px;
		left: 1px;
		background: #fff;
		width: 16px;
		position: absolute;
		transition: all .3s;
		height: 16px;
	}
	.main-content .el-table .el-switch.is-checked /deep/ .el-switch__core::after {
		margin: 0 0 0 -18px;
		left: 100%;
	}
	
	.main-content .el-table .el-rate /deep/ .el-rate__item {
		cursor: pointer;
		display: inline-block;
		vertical-align: middle;
		font-size: 0;
		position: relative;
	}
	.main-content .el-table .el-rate /deep/ .el-rate__item .el-rate__icon {
		margin: 0 3px;
		display: inline-block;
		font-size: 18px;
		position: relative;
		transition: .3s;
	}

</style>
