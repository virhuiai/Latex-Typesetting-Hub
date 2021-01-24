# docker run -itd --rm --name node-test node:12.13.0
# 指定镜像的tag比较好
FROM node:12.13.0
# Yarn是Facebook发布的node.js包管理器，比npm更快、更高效，可以使用Yarn替代npm。
RUN npm install -g npm -verbose --registry=https://registry.npm.taobao.org && \
npm i webpack -g -verbose --registry=https://registry.npm.taobao.org  && \
npm i vue -g -verbose --registry=https://registry.npm.taobao.org  && \
npm i vue-cli -g -verbose --registry=https://registry.npm.taobao.org  && \
# 安装Element
npm i element-ui -g -verbose --registry=https://registry.npm.taobao.org  && \
# 安装SCSS
npm i sass-loader -g -verbose --registry=https://registry.npm.taobao.org  && \
# 安装 node-sass 时在 node scripts/install 阶段会从 github.com 上下载一个 .node 文件，大部分安装不成功的原因都源自这里
npm install -g cnpm --registry=https://registry.npm.taobao.org  && cnpm install node-sass -g  && \
# axios
npm i axios -g -verbose --registry=https://registry.npm.taobao.org  && \
# mockjs
npm i mockjs -g -verbose --registry=https://registry.npm.taobao.org  && \
# yarn add js-cookie --registry=https://registry.npm.taobao.org
npm i js-cookie -g -verbose --registry=https://registry.npm.taobao.org  && \
npm i font-awesome -g -verbose --registry=https://registry.npm.taobao.org  && \
npm i vue-i18n -g -verbose --registry=https://registry.npm.taobao.org  && \
npm i vuex -g -verbose --registry=https://registry.npm.taobao.org

## npm list -g --depth=0
#/usr/local/lib
#+-- axios@0.21.1
#+-- cnpm@6.1.1
#+-- element-ui@2.15.0
#+-- font-awesome@4.7.0
#+-- js-cookie@2.2.1
#+-- mockjs@1.1.0
#+-- node-sass@5.0.0
#+-- npm@6.14.11
#+-- sass-loader@10.1.1
#+-- vue@2.6.12
#+-- vue-cli@2.9.6
#+-- vue-i18n@8.22.4
#+-- vuex@3.6.0
#`-- webpack@5.17.0

#容器启动时执行的命令 每个Dockerfile只有一个CMD命令 多了则会覆盖之前的CMD
CMD ["npm", "run","dev"]
# docker run --rm -itd --name vue-test -v /Users/virhuiaivirhuiai/Documents/virhuiai-github/teaching_gf_web_develop_element/:/web-proj/ -w /web-proj/ -p 80:8080 virhuiai/teaching_gf_web_develop_element:version-0.0.1 bash
# docker run --rm -itd --name vue-test -v /Users/virhuiaivirhuiai/Documents/virhuiai-github/teaching_gf_web_develop_element/:/web-proj/ -w /web-proj/ -p 80:8080 teaching_gf_web_develop_vue_element:latest bash
#teaching_gf_web_develop_vue_element:latest
# vue init webpack 项目名
# docker run --rm -itd --name vue-test -v /Users/virhuiaivirhuiai/Documents/virhuiai-github/teaching_gf_web_develop_element/:/web-proj/ -w /web-proj/ -p 80:8080 virhuiai/teaching_gf_web_develop_element:version-0.0.1
# 参考 https://www.toutiao.com/a6911515329197834766/