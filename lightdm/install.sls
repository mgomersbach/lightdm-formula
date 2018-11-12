{% from "lightdm/map.jinja" import lightdm with context %}

lightdm-pkg:
  pkg.installed:
    - name: {{ lightdm.pkg }}
  service.running:
    - name: {{ lightdm.svc }}
    - enable: {{ lightdm.enable_service }}
    - require:
      - pkg: lightdm-pkg
    - watch:
      - pkg: lightdm-pkg

{% if (lightdm.config.general['greeter-session'] is defined) and lightdm.config.general['greeter-session'] -%}
{% if "gtk" in lightdm.config.general['greeter-session'] -%}
lightdm-gtk-greeter-pkg:
  pkg.installed:
    - name: {{ lightdm.gtkgreeterpkg }}
{%  endif %}
{% if "qt" in lightdm.config.general['greeter-session'] -%}
lightdm-qt-greeter-pkg:
  pkg.installed:
    - name: {{ lightdm.qtgreeterpkg }}
{%  endif %}
{%  endif %}