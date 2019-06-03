#### WSGI 背景
  Python Web 开发中，服务端程序可以分为两个部分，一是服务器程序，二是应用程序。前者负责把客户端请求接收，整理，后者负责具体的逻辑处理。为了方便应用程序的开发，我们把常用的功能封装起来，成为各种Web开发框架，例如 Django, Flask, Tornado。不同的框架有不同的开发方式，但是无论如何，开发出的应用程序都要和服务器程序配合，才能为用户提供服务。这样，服务器程序就需要为不同的框架提供不同的支持。这样混乱的局面无论对于服务器还是框架，都是不好的。对服务器来说，需要支持各种不同框架，对框架来说，只有支持它的服务器才能被开发出的应用使用。

  这时候，标准化就变得尤为重要。我们可以设立一个标准，只要服务器程序支持这个标准，框架也支持这个标准，那么他们就可以配合使用。一旦标准确定，双方各自实现。这样，服务器可以支持更多支持标准的框架，框架也可以使用更多支持标准的服务器。

  gunicorn只支持linux系统 不支持windows 和 Mac

  Python Web开发中，这个标准就是 The Web Server Gateway Interface, 即 WSGI. 这个标准在PEP 333中描述，后来，为了支持 Python 3.x, 并且修正一些问题，新的版本在PEP 3333中描述。

  - Website:[http://wsgi.tutorial.codepoint.net/](http://wsgi.tutorial.codepoint.net/)


#### WSGI 是什么
  WSGI 是服务器程序与应用程序的一个约定，它规定了双方各自需要实现什么接口，提供什么功能，以便二者能够配合使用。

  WSGI 不能规定的太复杂，否则对已有的服务器来说，实现起来会困难，不利于WSGI的普及。同时WSGI也不能规定的太多，例如cookie处理就没有在WSGI中规定，这是为了给框架最大的灵活性。要知道WSGI最终的目的是为了方便服务器与应用程序配合使用，而不是成为一个Web框架的标准。

  另一方面，WSGI需要使得middleware（是中间件么？）易于实现。middleware处于服务器程序与应用程序之间，对服务器程序来说，它相当于应用程序，对应用程序来说，它相当于服务器程序。这样，对用户请求的处理，可以变成多个 middleware 叠加在一起，每个middleware实现不同的功能。请求从服务器来的时候，依次通过middleware，响应从应用程序返回的时候，反向通过层层middleware。我们可以方便地添加，替换middleware，以便对用户请求作出不同的处理。


#### Gunicorn 概要
  Gunicorn 绿色独角兽'是一个Python WSGI UNIX的HTTP服务器。这是一个预先叉工人模式，从Ruby的独角兽（Unicorn ）项目移植。该Gunicorn服务器大致与各种Web框架兼容，只需非常简单的执行，轻量级的资源消耗，以及相当迅速。
  gunicorn 默认作为一个监听 127.0.0.1:8000 的web server，可以在本机通过： http://127.0.0.1:8000 访问。  
  如果要通过网络访问，则需要绑定不同的地址（也可以同时设置监听端口），设置0.0.0.0可以监听到所有ip的请求  

  - Website :[http://gunicorn.org/](http://gunicorn.org/)
  - Source code :[https://github.com/benoitc/gunicorn](https://github.com/benoitc/gunicorn)
  - Doc:[http://docs.gunicorn.org/en/stable/](http://docs.gunicorn.org/en/stable/)
  - 本身支持WSGI、Django、Paster
  - 自动辅助进程管理
  - 简单的 Python配置
  - 允许配置多个工作环境
  - 各种服务器的可扩展钩子
  - 与Python Python 2.x >= 2.6 or 3.x >= 3.2 兼容

#### 创建
  ``` bash
  # cd 到 run.py
  pipenv install gunicorn  
  ```
  
#### 配置文件
  - 通过脚本启动(未验证)  
    不能都用默认的配置，因为可能后续还会在扩展，要安装在项目使用的虚拟环境中
    ``` python
    import os
    import multiprocessing

    bind = "127.0.0.1:8000"#此处的地址和绑定的端口 和 Nginx 绑定的地址一样
    workers = multiprocessing.cpu_count() * 2 + 1 #worker数量
    backlog=2048
    debug=True
    proc_name='gunicorn.pid'
    pidfile='/var/log/gunicorn/debug.log'
    loglevel='debug'
    ```
    - 命令  
    gunicorn -c deploy_config.py myapp:app
    - Supervisor  
    /var/proj/xxx/venv/bin/python /usr/bin/gunicorn -c /var/proj/xxx/deploy_config.py myapp:app

  - 通过 supervisor 启动
    - 使用virtualenvs
      ``` bash
      [program:higunicorn]
      command=/home/androllen/hiflask/hiflaskEnv/bin/python3 /home/androllen/hiflask/hiflaskEnv/bin/gunicorn -w 4 -b 127.0.0.1:8000 myapp:app
      directory=/home/androllen/hiflask/src
      autostart=true
      autorestart=true
      startsecs=1
      startretries=3
      stdout_capture_maxbytes=1MB
      stderr_capture_maxbytes=1MB
      stdout_logfile=/var/log/supervisor/higunicorn_out.log	
      stderr_logfile=/var/log/supervisor/higunicorn_err.log

      ```

    - 使用pipenv
      ``` bash
          sudo find -type f -mount -name gunicorn
          /home/androllen/.local/share/virtualenvs/hiflask-sYW1TGXP/bin/gunicorn
      ```  

      ``` bash
      [program:higunicorn]
      command=/home/androllen/.local/share/virtualenvs/webflask-sYW1TGXP/bin/python3 /home/androllen/.local/share/virtualenvs/webflask-sYW1TGXP/bin/gunicorn -w 4 -b 127.0.0.1:8000 run:app
      directory=/home/androllen/hiflask/src
      autostart=true
      autorestart=true
      startsecs=1
      startretries=3
      stdout_capture_maxbytes=1MB
      stderr_capture_maxbytes=1MB
      stdout_logfile=/var/log/supervisor/higunicorn_out.log	
      stderr_logfile=/var/log/supervisor/higunicorn_err.log      
      ```



#### 相关链接
 - [Wsgi介绍](https://blog.csdn.net/on_1y/article/details/18803563)
 - [百度百科](https://baike.baidu.com/item/wsgi)
 - [知乎Wsgi](https://www.zhihu.com/question/19998865)
 - [https://gunicorn.org/](https://gunicorn.org/)
 - [Gunicorn入门](https://www.cnblogs.com/ArtsCrafts/p/gunicorn.html)
 - [Gunicorn专题](https://www.zhihu.com/topic/19810964/hot)


#### QA
  - Nginx、Gunicorn在服务器中分别起什么作用？
    [参考地址](https://www.zhihu.com/question/38528616)
  
  - can't find command 'gunicorn'
    我不知道是不是我坑
    创建的虚拟环境里 gunicorn 竟然不能使用，我使用的是pipenv install gunicorn
    好像是 没有映射到虚拟环境里。
    解决方法：
    使用绝对路径 /home/androllen/.local/share/virtualenvs/webflask-sYW1TGXP/bin/python3 /home/androllen/.local/share/virtualenvs/webflask-sYW1TGXP/bin/gunicorn 
