{% from "lightdm/map.jinja" import lightdm with context %}

main_config:
  file.managed:
    - name: {{ lightdm.configfile }}
    - source: salt://lightdm/files/lightdm.conf.jinja
    - template: jinja
    - mode: 644
    - user: root
    - group: root

keys_config:
  file.managed:
    - name: {{ lightdm.configfile_keys }}
    - source: salt://lightdm/files/keys.conf.jinja
    - template: jinja
    - mode: 644
    - user: root
    - group: root

users_config:
  file.managed:
    - name: {{ lightdm.configfile_users }}
    - source: salt://lightdm/files/users.conf.jinja
    - template: jinja
    - mode: 644
    - user: root
    - group: root

{% if lightdm.config.general['greeter-session'] is defined -%}
{% if "gtk" in lightdm.config.general['greeter-session'] -%}
greeter_gtk_config:
  file.managed:
    - name: {{ lightdm.configfile_gtk }}
    - source: salt://lightdm/files/lightdm-gtk-greeter.conf.jinja
    - template: jinja
    - mode: 644
    - user: root
    - group: root
{%  endif %}
{% if "qt" in lightdm.config.general['greeter-session'] -%}
greeter_qt_config:
  file.managed:
    - name: {{ lightdm.configfile_qt }}
    - source: salt://lightdm/files/lightdm-qt-greeter.conf.jinja
    - template: jinja
    - mode: 644
    - user: root
    - group: root
{%  endif %}
{%  endif %}