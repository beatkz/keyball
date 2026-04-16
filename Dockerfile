FROM ghcr.io/qmk/qmk_cli@sha256:2dc05fc9f32efebd6b05c2b8676ee548358bc7e151e9dbf4dac6b6eed4513b07

WORKDIR /usr/src

RUN git clone --recursive --branch 0.22.14 https://github.com/qmk/qmk_firmware.git __qmk__

RUN qmk setup --home __qmk__ --yes

# PEP 668対応：--break-system-packages を追加
RUN /usr/bin/python3 -m pip install -r __qmk__/requirements.txt --break-system-packages