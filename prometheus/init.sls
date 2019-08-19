prometheus:
  pkg.installed:
    - name: prometheus
  service.running:
    - name: prometheus
    - enable: True
    - reload: True
    - watch:
      - file: /etc/prometheus/prometheus.yml

prometheus_conf:
  file.managed:
    - name: /etc/prometheus/prometheus.yml
    - template: jinja
    - source: salt://prometheus/templates/prometheus.j2
    - watch_in:
      - service: prometheus
