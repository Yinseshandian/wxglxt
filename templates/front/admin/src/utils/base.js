const base = {
    get() {
        return {
            url : "http://localhost:8080/wxglxt/",
            name: "wxglxt",
            // 退出到首页链接
            indexUrl: ''
        };
    },
    getProjectName(){
        return {
            projectName: "基于Django的高校后勤报修信息管理系统的设计与实现"
        } 
    }
}
export default base
