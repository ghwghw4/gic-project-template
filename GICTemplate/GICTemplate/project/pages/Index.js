require('/js/common/HttpRequest.js');

class IndexPage {
    constructor() {
        this.title = 'GICTemplate';
        this.dataInfo = null;
        this.getDateInfo();
    }

    // 请求日期信息
    getDateInfo() {
        httpRequest({
            method: 'GET',
            url: 'https://www.sojson.com/open/api/lunar/json.shtml',
            data: null,
            success:  (rspstr) => {
                const jsonData = JSON.parse(rspstr);
                if(jsonData.status === 200){
                    this.dataInfo = jsonData.data;
                }else{
                    this.showError('请求失败，请稍后重试！');
                }
            },
            error: (ss)=>{
                this.showError('请求失败，请稍后重试！');
            }
        });
    }

    // 显示错误信息
    showError(errMsg){
        const t = Toast.create('toast');
        t.show({ params: { text:errMsg } });
    }
}