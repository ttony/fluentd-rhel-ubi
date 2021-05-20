FROM registry.access.redhat.com/ubi8/ruby-27:1-28

COPY --chown=1001:root fluent.conf /opt/app-root/etc/fluentd/

RUN gem install oj -v 3.10.18 \
 && gem install json -v 2.4.1 \
 && gem install async-http -v 0.54.0 \
 && gem install ext_monitor -v 0.1.2 \
 && gem install fluentd -v 1.12.3 \
 && gem install bigdecimal -v 1.4.4 \
 && rm -rf  /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem /usr/lib/ruby/gems/2.*/gems/fluentd-*/test

EXPOSE 24224

CMD fluentd -c ../etc/fluentd/fluent.conf
