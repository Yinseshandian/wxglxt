#coding:utf-8
from django.db import models

from .model import BaseModel

from datetime import datetime



class yonghu(BaseModel):
    __doc__ = u'''yonghu'''
    __tablename__ = 'yonghu'

    __loginUser__='yonghuzhanghao'


    __authTables__={}
    __authPeople__='是'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __loginUserColumn__='yonghuzhanghao'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='否'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    yonghuzhanghao=models.CharField ( max_length=255,null=False,unique=True, verbose_name='用户账号' )
    mima=models.CharField ( max_length=255,null=False, unique=False, verbose_name='密码' )
    yonghuxingming=models.CharField ( max_length=255,null=False, unique=False, verbose_name='用户姓名' )
    xingbie=models.CharField ( max_length=255, null=True, unique=False, verbose_name='性别' )
    nianling=models.CharField ( max_length=255, null=True, unique=False, verbose_name='年龄' )
    touxiang=models.TextField   (  null=True, unique=False, verbose_name='头像' )
    mobile=models.CharField ( max_length=255, null=True, unique=False, verbose_name='手机号' )
    pquestion=models.CharField ( max_length=255, null=True, unique=False, verbose_name='密保问题' )
    panswer=models.CharField ( max_length=255, null=True, unique=False, verbose_name='密保答案' )
    '''
    yonghuzhanghao=VARCHAR
    mima=VARCHAR
    yonghuxingming=VARCHAR
    xingbie=VARCHAR
    nianling=VARCHAR
    touxiang=Text
    mobile=VARCHAR
    pquestion=VARCHAR
    panswer=VARCHAR
    '''
    class Meta:
        db_table = 'yonghu'
        verbose_name = verbose_name_plural = '用户'
class weixiurenyuan(BaseModel):
    __doc__ = u'''weixiurenyuan'''
    __tablename__ = 'weixiurenyuan'

    __loginUser__='weixiuzhanghao'


    __authTables__={}
    __authPeople__='是'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __loginUserColumn__='weixiuzhanghao'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='否'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    weixiuzhanghao=models.CharField ( max_length=255,null=False,unique=True, verbose_name='维修账号' )
    mima=models.CharField ( max_length=255,null=False, unique=False, verbose_name='密码' )
    weixiuxingming=models.CharField ( max_length=255,null=False, unique=False, verbose_name='维修姓名' )
    xingbie=models.CharField ( max_length=255, null=True, unique=False, verbose_name='性别' )
    nianling=models.CharField ( max_length=255, null=True, unique=False, verbose_name='年龄' )
    shoujihao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='手机号' )
    weixiujineng=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修技能' )
    weixiushenfen=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修身份' )
    touxiang=models.TextField   (  null=True, unique=False, verbose_name='头像' )
    pquestion=models.CharField ( max_length=255, null=True, unique=False, verbose_name='密保问题' )
    panswer=models.CharField ( max_length=255, null=True, unique=False, verbose_name='密保答案' )
    '''
    weixiuzhanghao=VARCHAR
    mima=VARCHAR
    weixiuxingming=VARCHAR
    xingbie=VARCHAR
    nianling=VARCHAR
    shoujihao=VARCHAR
    weixiujineng=VARCHAR
    weixiushenfen=VARCHAR
    touxiang=Text
    pquestion=VARCHAR
    panswer=VARCHAR
    '''
    class Meta:
        db_table = 'weixiurenyuan'
        verbose_name = verbose_name_plural = '维修人员'
class weixiuleixing(BaseModel):
    __doc__ = u'''weixiuleixing'''
    __tablename__ = 'weixiuleixing'



    __authTables__={}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='否'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    weixiuleixing=models.CharField ( max_length=255, null=True,unique=True, verbose_name='维修类型' )
    '''
    weixiuleixing=VARCHAR
    '''
    class Meta:
        db_table = 'weixiuleixing'
        verbose_name = verbose_name_plural = '维修类型'
class baoxiuxinxi(BaseModel):
    __doc__ = u'''baoxiuxinxi'''
    __tablename__ = 'baoxiuxinxi'



    __authTables__={'yonghuzhanghao':'yonghu',}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='是'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='否'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    yonghuzhanghao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户账号' )
    yonghuxingming=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户姓名' )
    lianxifangshi=models.CharField ( max_length=255, null=True, unique=False, verbose_name='联系方式' )
    weixiuleixing=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修类型' )
    weixiuwupin=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修物品' )
    baoxiushijian=models.DateTimeField  (  null=True, unique=False, verbose_name='报修时间' )
    guzhangmiaoshu=models.CharField ( max_length=255, null=True, unique=False, verbose_name='故障描述' )
    baoxiutupian=models.TextField   (  null=True, unique=False, verbose_name='报修图片' )
    guzhangdidian=models.CharField ( max_length=255, null=True, unique=False, verbose_name='故障地点' )
    baoxiuxiangqing=models.TextField   (  null=True, unique=False, verbose_name='报修详情' )
    baoxiuzhuangtai=models.CharField ( max_length=255, null=True, unique=False, verbose_name='报修状态' )
    jinjichengdu=models.CharField ( max_length=255, null=True, unique=False, verbose_name='紧急程度' )
    sfsh=models.CharField ( max_length=255, null=True, unique=False,default='待审核', verbose_name='是否审核' )
    shhf=models.TextField   (  null=True, unique=False, verbose_name='审核回复' )
    '''
    yonghuzhanghao=VARCHAR
    yonghuxingming=VARCHAR
    lianxifangshi=VARCHAR
    weixiuleixing=VARCHAR
    weixiuwupin=VARCHAR
    baoxiushijian=DateTime
    guzhangmiaoshu=VARCHAR
    baoxiutupian=Text
    guzhangdidian=VARCHAR
    baoxiuxiangqing=Text
    baoxiuzhuangtai=VARCHAR
    jinjichengdu=VARCHAR
    sfsh=VARCHAR
    shhf=Text
    '''
    class Meta:
        db_table = 'baoxiuxinxi'
        verbose_name = verbose_name_plural = '报修信息'
class fenpeiweixiu(BaseModel):
    __doc__ = u'''fenpeiweixiu'''
    __tablename__ = 'fenpeiweixiu'



    __authTables__={'yonghuzhanghao':'yonghu','weixiuzhanghao':'weixiurenyuan',}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='是'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='否'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    yonghuzhanghao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户账号' )
    yonghuxingming=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户姓名' )
    lianxifangshi=models.CharField ( max_length=255, null=True, unique=False, verbose_name='联系方式' )
    weixiuleixing=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修类型' )
    weixiuwupin=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修物品' )
    baoxiushijian=models.CharField ( max_length=255, null=True, unique=False, verbose_name='报修时间' )
    guzhangmiaoshu=models.CharField ( max_length=255, null=True, unique=False, verbose_name='故障描述' )
    baoxiutupian=models.TextField   (  null=True, unique=False, verbose_name='报修图片' )
    guzhangdidian=models.CharField ( max_length=255, null=True, unique=False, verbose_name='故障地点' )
    weixiuzhanghao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修账号' )
    weixiuxingming=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修姓名' )
    weixiushenfen=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修身份' )
    shoujihao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='手机号' )
    fenpeishijian=models.DateTimeField  (  null=True, unique=False, verbose_name='分配时间' )
    zhuangtai=models.CharField ( max_length=255, null=True, unique=False, verbose_name='状态' )
    jinjichengdu=models.CharField ( max_length=255, null=True, unique=False, verbose_name='紧急程度' )
    baoxiuxiangqing=models.TextField   (  null=True, unique=False, verbose_name='报修详情' )
    sfsh=models.CharField ( max_length=255, null=True, unique=False,default='待审核', verbose_name='是否审核' )
    shhf=models.TextField   (  null=True, unique=False, verbose_name='审核回复' )
    '''
    yonghuzhanghao=VARCHAR
    yonghuxingming=VARCHAR
    lianxifangshi=VARCHAR
    weixiuleixing=VARCHAR
    weixiuwupin=VARCHAR
    baoxiushijian=VARCHAR
    guzhangmiaoshu=VARCHAR
    baoxiutupian=Text
    guzhangdidian=VARCHAR
    weixiuzhanghao=VARCHAR
    weixiuxingming=VARCHAR
    weixiushenfen=VARCHAR
    shoujihao=VARCHAR
    fenpeishijian=DateTime
    zhuangtai=VARCHAR
    jinjichengdu=VARCHAR
    baoxiuxiangqing=Text
    sfsh=VARCHAR
    shhf=Text
    '''
    class Meta:
        db_table = 'fenpeiweixiu'
        verbose_name = verbose_name_plural = '分配维修'
class weixiujilu(BaseModel):
    __doc__ = u'''weixiujilu'''
    __tablename__ = 'weixiujilu'



    __authTables__={'yonghuzhanghao':'yonghu','weixiuzhanghao':'weixiurenyuan',}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='否'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    yonghuzhanghao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户账号' )
    yonghuxingming=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户姓名' )
    lianxifangshi=models.CharField ( max_length=255, null=True, unique=False, verbose_name='联系方式' )
    weixiuleixing=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修类型' )
    weixiuwupin=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修物品' )
    baoxiushijian=models.CharField ( max_length=255, null=True, unique=False, verbose_name='报修时间' )
    guzhangmiaoshu=models.CharField ( max_length=255, null=True, unique=False, verbose_name='故障描述' )
    weixiutupian=models.TextField   (  null=True, unique=False, verbose_name='维修图片' )
    guzhangdidian=models.CharField ( max_length=255, null=True, unique=False, verbose_name='故障地点' )
    weixiuzhanghao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修账号' )
    weixiuxingming=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修姓名' )
    weixiushenfen=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修身份' )
    shoujihao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='手机号' )
    weixiushijian=models.DateTimeField  (  null=True, unique=False, verbose_name='维修时间' )
    weixiujieguo=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修结果' )
    weixiujilu=models.TextField   (  null=True, unique=False, verbose_name='维修记录' )
    '''
    yonghuzhanghao=VARCHAR
    yonghuxingming=VARCHAR
    lianxifangshi=VARCHAR
    weixiuleixing=VARCHAR
    weixiuwupin=VARCHAR
    baoxiushijian=VARCHAR
    guzhangmiaoshu=VARCHAR
    weixiutupian=Text
    guzhangdidian=VARCHAR
    weixiuzhanghao=VARCHAR
    weixiuxingming=VARCHAR
    weixiushenfen=VARCHAR
    shoujihao=VARCHAR
    weixiushijian=DateTime
    weixiujieguo=VARCHAR
    weixiujilu=Text
    '''
    class Meta:
        db_table = 'weixiujilu'
        verbose_name = verbose_name_plural = '维修记录'
class weixiuzhishiku(BaseModel):
    __doc__ = u'''weixiuzhishiku'''
    __tablename__ = 'weixiuzhishiku'



    __authTables__={}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='否'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    weixiubiaoti=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修标题' )
    fengmian=models.TextField   (  null=True, unique=False, verbose_name='封面' )
    guzhangbujian=models.CharField ( max_length=255, null=True, unique=False, verbose_name='故障部件' )
    guzhangyuanyin=models.TextField   (  null=True, unique=False, verbose_name='故障原因' )
    jiejuefangan=models.TextField   (  null=True, unique=False, verbose_name='解决方案' )
    weixiuxiangqing=models.TextField   (  null=True, unique=False, verbose_name='维修详情' )
    fabushijian=models.DateTimeField  (  null=True, unique=False, verbose_name='发布时间' )
    '''
    weixiubiaoti=VARCHAR
    fengmian=Text
    guzhangbujian=VARCHAR
    guzhangyuanyin=Text
    jiejuefangan=Text
    weixiuxiangqing=Text
    fabushijian=DateTime
    '''
    class Meta:
        db_table = 'weixiuzhishiku'
        verbose_name = verbose_name_plural = '维修知识库'
class weixiujieguo(BaseModel):
    __doc__ = u'''weixiujieguo'''
    __tablename__ = 'weixiujieguo'



    __authTables__={'yonghuzhanghao':'yonghu','weixiuzhanghao':'weixiurenyuan',}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='否'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    yonghuzhanghao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户账号' )
    yonghuxingming=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户姓名' )
    lianxifangshi=models.CharField ( max_length=255, null=True, unique=False, verbose_name='联系方式' )
    weixiuleixing=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修类型' )
    weixiuwupin=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修物品' )
    baoxiushijian=models.CharField ( max_length=255, null=True, unique=False, verbose_name='报修时间' )
    guzhangmiaoshu=models.CharField ( max_length=255, null=True, unique=False, verbose_name='故障描述' )
    weixiutupian=models.TextField   (  null=True, unique=False, verbose_name='维修图片' )
    guzhangdidian=models.CharField ( max_length=255, null=True, unique=False, verbose_name='故障地点' )
    weixiuzhanghao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修账号' )
    weixiuxingming=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修姓名' )
    weixiushenfen=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修身份' )
    shoujihao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='手机号' )
    querenshijian=models.DateTimeField  (  null=True, unique=False, verbose_name='确认时间' )
    querenbeizhu=models.CharField ( max_length=255, null=True, unique=False, verbose_name='确认备注' )
    weixiujilu=models.TextField   (  null=True, unique=False, verbose_name='维修记录' )
    '''
    yonghuzhanghao=VARCHAR
    yonghuxingming=VARCHAR
    lianxifangshi=VARCHAR
    weixiuleixing=VARCHAR
    weixiuwupin=VARCHAR
    baoxiushijian=VARCHAR
    guzhangmiaoshu=VARCHAR
    weixiutupian=Text
    guzhangdidian=VARCHAR
    weixiuzhanghao=VARCHAR
    weixiuxingming=VARCHAR
    weixiushenfen=VARCHAR
    shoujihao=VARCHAR
    querenshijian=DateTime
    querenbeizhu=VARCHAR
    weixiujilu=Text
    '''
    class Meta:
        db_table = 'weixiujieguo'
        verbose_name = verbose_name_plural = '维修结果'
class weixiupingjia(BaseModel):
    __doc__ = u'''weixiupingjia'''
    __tablename__ = 'weixiupingjia'



    __authTables__={'yonghuzhanghao':'yonghu','weixiuzhanghao':'weixiurenyuan',}
    __authPeople__='否'#用户表，表属性loginUserColumn对应的值就是用户名字段，mima就是密码字段
    __sfsh__='否'#表sfsh(是否审核，”是”或”否”)字段和sfhf(审核回复)字段，后台列表(page)的操作中要多一个”审核”按钮，点击”审核”弹出一个页面，包含”是否审核”和”审核回复”，点击确定调用update接口，修改sfsh和sfhf两个字段。
    __authSeparate__='否'#后台列表权限
    __thumbsUp__='否'#表属性thumbsUp[是/否]，新增thumbsupnum赞和crazilynum踩字段
    __intelRecom__='否'#智能推荐功能(表属性：[intelRecom（是/否）],新增clicktime[前端不显示该字段]字段（调用info/detail接口的时候更新），按clicktime排序查询)
    __browseClick__='否'#表属性[browseClick:是/否]，点击字段（clicknum），调用info/detail接口的时候后端自动+1）、投票功能（表属性[vote:是/否]，投票字段（votenum）,调用vote接口后端votenum+1
    __foreEndListAuth__='否'#前台列表权限foreEndListAuth[是/否]；当foreEndListAuth=是，刷的表新增用户字段userid，前台list列表接口仅能查看自己的记录和add接口后台赋值userid的值
    __foreEndList__='否'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    __isAdmin__='否'#表属性isAdmin=”是”,刷出来的用户表也是管理员，即page和list可以查看所有人的考试记录(同时应用于其他表)
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    yonghuzhanghao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户账号' )
    yonghuxingming=models.CharField ( max_length=255, null=True, unique=False, verbose_name='用户姓名' )
    lianxifangshi=models.CharField ( max_length=255, null=True, unique=False, verbose_name='联系方式' )
    weixiuleixing=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修类型' )
    weixiufenlei=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修分类' )
    baoxiushijian=models.CharField ( max_length=255, null=True, unique=False, verbose_name='报修时间' )
    guzhangmiaoshu=models.CharField ( max_length=255, null=True, unique=False, verbose_name='故障描述' )
    weixiutupian=models.TextField   (  null=True, unique=False, verbose_name='维修图片' )
    guzhangdidian=models.CharField ( max_length=255, null=True, unique=False, verbose_name='故障地点' )
    weixiuzhanghao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修账号' )
    weixiuxingming=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修姓名' )
    weixiushenfen=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修身份' )
    shoujihao=models.CharField ( max_length=255, null=True, unique=False, verbose_name='手机号' )
    pingjiashijian=models.DateTimeField  (  null=True, unique=False, verbose_name='评价时间' )
    weixiupingfen=models.CharField ( max_length=255, null=True, unique=False, verbose_name='维修评分' )
    pingjianeirong=models.TextField   (  null=True, unique=False, verbose_name='评价内容' )
    '''
    yonghuzhanghao=VARCHAR
    yonghuxingming=VARCHAR
    lianxifangshi=VARCHAR
    weixiuleixing=VARCHAR
    weixiufenlei=VARCHAR
    baoxiushijian=VARCHAR
    guzhangmiaoshu=VARCHAR
    weixiutupian=Text
    guzhangdidian=VARCHAR
    weixiuzhanghao=VARCHAR
    weixiuxingming=VARCHAR
    weixiushenfen=VARCHAR
    shoujihao=VARCHAR
    pingjiashijian=DateTime
    weixiupingfen=VARCHAR
    pingjianeirong=Text
    '''
    class Meta:
        db_table = 'weixiupingjia'
        verbose_name = verbose_name_plural = '维修评价'
class popupremind(BaseModel):
    __doc__ = u'''popupremind'''
    __tablename__ = 'popupremind'



    __authTables__={}
    __authSeparate__='是'#后台列表权限
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    userid=models.BigIntegerField  ( null=False, unique=False, verbose_name='发布人id' )
    title=models.CharField ( max_length=255,null=False, unique=False, verbose_name='标题' )
    type=models.CharField ( max_length=255, null=True, unique=False,default='个人', verbose_name='类型' )
    brief=models.TextField   (  null=True, unique=False, verbose_name='简介' )
    content=models.TextField   ( null=False, unique=False, verbose_name='内容' )
    remindtime=models.DateTimeField  (  null=True, unique=False, verbose_name='提醒时间' )
    '''
    userid=BigInteger
    title=VARCHAR
    type=VARCHAR
    brief=Text
    content=Text
    remindtime=DateTime
    '''
    class Meta:
        db_table = 'popupremind'
        verbose_name = verbose_name_plural = '弹窗提醒'
class storeup(BaseModel):
    __doc__ = u'''storeup'''
    __tablename__ = 'storeup'



    __authTables__={}
    __authSeparate__='是'#后台列表权限
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    userid=models.BigIntegerField  ( null=False, unique=False, verbose_name='用户id' )
    refid=models.BigIntegerField  (  null=True, unique=False, verbose_name='商品id' )
    tablename=models.CharField ( max_length=255, null=True, unique=False, verbose_name='表名' )
    name=models.CharField ( max_length=255,null=False, unique=False, verbose_name='名称' )
    picture=models.TextField   (  null=True, unique=False, verbose_name='图片' )
    type=models.CharField ( max_length=255, null=True, unique=False,default='1', verbose_name='类型' )
    inteltype=models.CharField ( max_length=255, null=True, unique=False, verbose_name='推荐类型' )
    remark=models.CharField ( max_length=255, null=True, unique=False, verbose_name='备注' )
    '''
    userid=BigInteger
    refid=BigInteger
    tablename=VARCHAR
    name=VARCHAR
    picture=Text
    type=VARCHAR
    inteltype=VARCHAR
    remark=VARCHAR
    '''
    class Meta:
        db_table = 'storeup'
        verbose_name = verbose_name_plural = '收藏表'
class smsregistercode(BaseModel):
    __doc__ = u'''smsregistercode'''
    __tablename__ = 'smsregistercode'



    __authTables__={}
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    mobile=models.CharField ( max_length=255,null=False, unique=False, verbose_name='手机' )
    role=models.CharField ( max_length=255,null=False, unique=False, verbose_name='角色' )
    code=models.CharField ( max_length=255,null=False, unique=False, verbose_name='验证码' )
    '''
    mobile=VARCHAR
    role=VARCHAR
    code=VARCHAR
    '''
    class Meta:
        db_table = 'smsregistercode'
        verbose_name = verbose_name_plural = '短信验证码'
class menu(BaseModel):
    __doc__ = u'''menu'''
    __tablename__ = 'menu'



    __authTables__={}
    __foreEndList__='是'#表属性[foreEndList]前台list:和后台默认的list列表页相似,只是摆在前台,否:指没有此页,是:表示有此页(不需要登陆即可查看),前要登:表示有此页且需要登陆后才能查看
    addtime = models.DateTimeField(auto_now_add=False, verbose_name=u'创建时间')
    menujson=models.TextField   (  null=True, unique=False, verbose_name='菜单' )
    '''
    menujson=Text
    '''
    class Meta:
        db_table = 'menu'
        verbose_name = verbose_name_plural = '菜单'
