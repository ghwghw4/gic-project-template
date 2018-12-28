const { httpRequest, httpRequestAsync } = require('../js/common/HttpRequest');
/**
 * NOTE：可以使用axios来请求数据。步骤如下：
 * 1. 下载axios的JS文件。 地址如下：https://unpkg.com/axios@0.18.0/dist/axios.min.js
 * 2. 将下载的JS文件拷贝到工程的js文件夹下面。
 * 3. 使用require函数已非module模式引入axios，比如：require('./axios.js', false);
 * 4. 直接在代码中使用
 * NOTE:其他的第三方类库都可以使用这样的方式引入
 */


class IndexPage {
    constructor() {
        this.title = 'GICTemplate';
        this.dataInfo = null;
    }

    // 使用async 和 await 请求数据
    async getDateInfoAsync() {
        const { response, error } = await httpRequestAsync({
            method: 'GET',
            url: 'https://www.sojson.com/open/api/lunar/json.shtml',
            data: null
        });
        if (error) {
            this.showError('请求失败，请稍后重试！');
            return;
        }

        if (response) {
            const jsonData = JSON.parse(response);
            if (jsonData.status === 200) {
                this.dataInfo = jsonData.data;
            } else {
                this.showError('请求失败，该接口是第三方的接口，有调用限制！等3秒后再试！');
            }
        }

    }

    // 请求日期信息
    getDateInfo() {
        httpRequest({
            method: 'GET',
            url: 'https://www.sojson.com/open/api/lunar/json.shtml',
            data: null,
            success: (rspstr) => {
                const jsonData = JSON.parse(rspstr);
                if (jsonData.status === 200) {
                    this.dataInfo = jsonData.data;
                } else {
                    this.showError('请求失败，该接口是第三方的接口，有调用限制！等3秒后再试！');
                }
            },
            error: (ss) => {
                this.showError('请求失败，请稍后重试！');
            }
        });
    }

    // 显示错误信息
    showError(errMsg) {
        const t = Toast.create('toast');
        t.show({ params: { text: errMsg } });
    }
}