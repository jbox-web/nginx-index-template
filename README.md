# Nginx Index Template

Bootstrap version of : [dirlist.xslt](https://gist.github.com/wilhelmy/5a59b8eea26974a468c9) with breadcrumb

To use it :

```nginx
server {
  server_name   foo.bar.baz;
  listen        80;
  root          /home/aptly/endpoints;

  autoindex     on;
  autoindex_format xml;

  access_log    /var/log/nginx/aptly.access.log;
  error_log     /var/log/nginx/aptly.error.log;


  location / {
    try_files $uri @autoindex;
  }

  location @autoindex {
    xslt_stylesheet /home/aptly/nginx_template.xslt path='$uri';
  }
}

```

![Screenshot](/images/screenshot.png?raw=true "Screenshot")
