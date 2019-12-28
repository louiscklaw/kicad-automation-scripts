FROM logickee/kicad

COPY src/requirements.txt .

RUN apt-get -y update && \
    apt-get install -y python python-pip xvfb recordmydesktop xdotool xclip && \
    apt-get install -y dbus-x11 && \
    apt-get install -y at-spi2-core && \
    pip install -r requirements.txt

# Use a UTF-8 compatible LANG because KiCad 5 uses UTF-8 in the PCBNew title
# This causes a "failure in conversion from UTF8_STRING to ANSI_X3.4-1968" when
# attempting to look for the window name with xdotool.
ENV LANG C.UTF-8

# Copy default configuration and fp_lib_table to prevent first run dialog
COPY ./config/* /root/.config/kicad/

COPY src /usr/lib/python2.7/dist-packages/kicadAutomation
