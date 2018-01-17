#! /usr/bin/python
from sys import stdout, stderr
from time import sleep

# TODO: reduce CPU usage
# TODO: min_widths
# TODO: click events

def configure():
    # Configure
    dt = 1.0 # seconds
    global COLOR_LABEL, COLOR_LABEL_ON, COLOR_LABEL_OFF, COLOR_LABEL_WARNING
    global COLOR_TEXT, COLOR_TEXT_ON, COLOR_TEXT_OFF, COLOR_TEXT_WARNING
    global COLOR_SPECIAL
    COLOR_LABEL = Color(0x00, 0xee, 0xdd)
    COLOR_LABEL_ON = Color(0x00, 0xee, 0xdd)
    COLOR_LABEL_OFF = Color(0x66, 0x77, 0x88)
    COLOR_LABEL_WARNING = Color(0xbb, 0x88, 0x44)
    COLOR_TEXT = Color(0xcc, 0xcc, 0xcc)
    COLOR_TEXT_ON = Color(0xcc, 0xcc, 0xcc)
    COLOR_TEXT_OFF = Color(0x88, 0x88, 0x88)
    COLOR_TEXT_WARNING = Color(0xbb, 0x99, 0x66)
    COLOR_SPECIAL = Color(0x88, 0xee, 0xdd)

    separator_small = Block(' ', separator_block_width=4)
    separator_large = Block(' ', separator_block_width=32)

    date = Date()
    updates = Updates()

    music = Music()
    volume = Volume()
    bluetooth = Bluetooth()
    wifi = Wifi()
    vpn = VPN()
    netspeed = Netspeed(2)
    disk = Disk('/home/')
    diskio = DiskIO(2)
    ram = RAM()
    cpu = CPU()
    fan = Fan()
    temperature = Temperature()
    brightness = Brightness()
    battery = Battery()
    date = Date()
    xkblayout = XKBLayout()
    updates = Updates()
    modules = (
            (   5/dt, music),
            (   5/dt, volume),
            (  10/dt, bluetooth),
            (  10/dt, wifi),
            (  10/dt, vpn),
            (   2/dt, netspeed),
            ( 300/dt, disk),
            (   2/dt, diskio),
            (   2/dt, ram),
            (   2/dt, cpu),
            (  10/dt, fan),
            (  10/dt, temperature),
            (  10/dt, brightness),
            (   5/dt, battery),
            (   1/dt, date),
            (   5/dt, xkblayout),
            (1800/dt, updates),
            )

    blocks = (
            music,
            separator_large,
            volume,
            separator_large,
            bluetooth,
            separator_small,
            wifi,
            vpn,
            netspeed,
            separator_large,
            disk,
            diskio,
            separator_large,
            ram,
            separator_small,
            cpu,
            separator_small,
            fan,
            temperature,
            separator_large,
            brightness,
            separator_small,
            battery,
            separator_large,
            date,
            separator_small,
            xkblayout,
            separator_small,
            updates,
            )
    return dt, modules, blocks

if __name__ == '__main__':
    stdout.write('{"version":1} [\n')
    stdout.write('[{"full_text":"loading i3bar..."}],')
    stdout.flush()

def sanitize(s):
    new_s = str(s).replace('"', r'\"')
    return new_s

class Color(object):
    def __init__(self, r, g, b):
        def clamp(x):
            if x <= 0:
                return 0
            if x >= 255:
                return 255
            return x
        self._r = clamp(r)
        self._g = clamp(g)
        self._b = clamp(b)
        return
    def __str__(self):
        return '#{:02x}{:02x}{:02x}'.format(self._r, self._g, self._b)

class Block(object):
    def __init__(self, full_text,
                 short_text=None,
                 color=None,
                 background=None,
                 border=None,
                 min_width=None,
                 align=None,
                 name=None,
                 instance=None,
                 urgent=False,
                 separator=False,
                 separator_block_width=3):
        self._full_text = full_text
        self._short_text = short_text
        self._color = color
        self._background = background
        self._border = border
        self._min_width = min_width
        self._align = align
        self._name = name
        self._instance = instance
        self._urgent = urgent
        self._separator = separator
        self._separator_block_width = separator_block_width
        
        self._up_to_date = False
        self._output = None
        pass
    def _gen(self):
        attribs_output = []
        if self.full_text != None:
            attribs_output.append('"full_text":"{}"'.format(sanitize(self.full_text)))
        if self.short_text != None:
            attribs_output.append('"short_text":"{}"'.format(sanitize(self.short_text)))
        if self.color != None:
            attribs_output.append('"color":"{}"'.format(sanitize(self.color)))
        if self.background != None:
            attribs_output.append('"background":"{}"'.format(sanitize(self.background)))
        if self.border != None:
            attribs_output.append('"border":"{}"'.format(sanitize(self.border)))
        if self.min_width != None:
            attribs_output.append('"min_width":{}'.format(sanitize(self.min_width)))
        if self.align != None:
            attribs_output.append('"align":"{}"'.format(sanitize(self.align)))
        if self.name != None:
            attribs_output.append('"name":"{}"'.format(sanitize(self.name)))
        if self.instance != None:
            attribs_output.append('"instance":"{}"'.format(sanitize(self.instance)))
        if self.urgent == True:
            attribs_output.append('"urgent":true')
        if self.separator == False:
            attribs_output.append('"separator":false')
        if self.separator_block_width != None:
            attribs_output.append('"separator_block_width":{}'.format(int(self.separator_block_width)))
        self._output = '{' + ','.join(attribs_output) + '}'
        self._up_to_date = True
        return
    def __str__(self):
        if not self._up_to_date:
            self._gen()
        return self._output
    @property
    def full_text(self):
        return self._full_text
    @full_text.setter
    def full_text(self, val):
        self._full_text = val
        self._up_to_date = False
    @property
    def short_text(self):
        return self._short_text
    @short_text.setter
    def short_text(self, val):
        self._short_text = val
        self._up_to_date = False
    @property
    def color(self):
        return self._color
    @color.setter
    def color(self, val):
        self._color = val
        self._up_to_date = False
    @property
    def background(self):
        return self._background
    @background.setter
    def background(self, val):
        self._background = val
        self._up_to_date = False
    @property
    def border(self):
        return self._border
    @border.setter
    def border(self, val):
        self._border = val
        self._up_to_date = False
    @property
    def min_width(self):
        return self._min_width
    @min_width.setter
    def min_width(self, val):
        self._min_width = val
        self._up_to_date = False
    @property
    def align(self):
        return self._align
    @align.setter
    def align(self, val):
        self._align = val
        self._up_to_date = False
    @property
    def name(self):
        return self._name
    @name.setter
    def name(self, val):
        self._name = val
        self._up_to_date = False
    @property
    def instance(self):
        return self._instance
    @instance.setter
    def instance(self, val):
        self._instance = val
        self._up_to_date = False
    @property
    def urgent(self):
        return self._urgent
    @urgent.setter
    def urgent(self, val):
        self._urgent = val
        self._up_to_date = False
    @property
    def separator(self):
        return self._separator
    @separator.setter
    def separator(self, val):
        self._separator = val
        self._up_to_date = False
    @property
    def separator_block_width(self):
        return self._separator_block_width
    @separator_block_width.setter
    def separator_block_width(self, val):
        self._separator_block_width = val
        self._up_to_date = False

class Module(object):
    def __init__(self):
        self.blocks = []
    def __str__(self):
        return ','.join(str(block) for block in self.blocks)
    def update(self):
        pass

class Music(Module):
    def __init__(self):
        self.blocks = [
                Block(full_text='', color=COLOR_LABEL),
                Block(full_text='', short_text='', color=COLOR_TEXT),
                ]
        self.update()
    def update(self):
        # TODO
        #write('♫', color=color_label)
        pass

from subprocess import getstatusoutput
import re
class Volume(Module):
    def __init__(self):
        self.blocks = [
                Block(full_text='', color=COLOR_LABEL),
                Block(full_text='--%', short_text='', color=COLOR_TEXT),
                ]
        self.volume_regex = re.compile('^.*\[([0-9]*)%\] \[(on|off)\]$')
        self.update()
    def update(self):
        volumes = []
        status, output = getstatusoutput('amixer get Master')
        if status != 0:
            print(output, file=stderr)
            self.blocks[0].full_text = ''
            self.blocks[1].full_text = ''
            return
        for line in output.split('\n'):
            tmp = self.volume_regex.match(line)
            if tmp != None:
                volumes.append(tmp.groups())
        if len(volumes) == 0:
            self.blocks[0].full_text = ''
            self.blocks[1].full_text = ''
            return
        # If everything is at the same state, collapse into one summary
        if all(x == volumes[0] for x in volumes):
            volumes = (volumes[0],)
        # Show icon mute/speaker/headphone
        # TODO: headphone detection -> 
        if all(x[1] == 'off' for x in volumes):
            self.blocks[0].full_text = ''
            self.blocks[0].color = COLOR_LABEL_OFF
            self.blocks[1].color = COLOR_TEXT_OFF
        else:
            self.blocks[0].full_text = ''
            self.blocks[0].color = COLOR_LABEL_ON
            self.blocks[1].color = COLOR_TEXT_ON
        volumes_text = []
        for (vol,mute) in volumes:
            if mute == 'on':
                volumes_text.append(str(vol) + '%')
            else:
                volumes_text.append('(' + str(vol) + '%)')
        self.blocks[1].full_text = ' '.join(volumes_text)

from subprocess import getstatusoutput
class Bluetooth(Module):
    def __init__(self):
        self.blocks = [
                Block(full_text='', color=COLOR_LABEL_OFF),
                ]
        self.update()
    def update(self):
        status, output = getstatusoutput('bluetooth')
        if status != 0:
            self.blocks[0].full_text = ''
            return
        if output == 'bluetooth = on':
            self.blocks[0].full_text = ''
            self.blocks[0].color = COLOR_LABEL_OFF
            # TODO: show dark icon if on, blue if connected
        else:
            self.blocks[0].full_text = ''

from subprocess import getstatusoutput
class Wifi(Module):
    def __init__(self):
        self.blocks = [
                Block(full_text='', color=COLOR_LABEL),
                Block(full_text='', short_text='', color=COLOR_TEXT),
                ]
        self.update()
    def update(self):
        status, output = getstatusoutput('nmcli --terse --mode tabular --field CONNECTIVITY,WIFI general')
        if status != 0:
            print(output, file=stderr)
            self.blocks[0].full_text = ''
            self.blocks[1].full_text = ''
            return
        (connectivity, wifi) = output.split(':')
        status, output = getstatusoutput('nmcli --terse --mode tabular --field NAME connection show --active')
        if status != 0:
            print(output, file=stderr)
            output = ''
        connection = output
        if wifi == 'enabled':
            self.blocks[0].full_text = ''
            if connectivity == 'portal':
                self.blocks[0].color = COLOR_LABEL_WARNING
            elif connectivity == 'limited':
                self.blocks[0].color = COLOR_LABEL_WARNING
            elif connectivity == 'full':
                self.blocks[0].color = COLOR_LABEL
            else: # unknown or none
                self.blocks[0].color = COLOR_LABEL_OFF
        else:
            self.blocks[0].full_text = ''
        self.blocks[1].full_text = connection

from os.path import exists
class VPN(Module):
    def __init__(self):
        self.blocks = [
                Block(full_text='', color=COLOR_LABEL),
                ]
        self.update()
    def update(self):
        # TODO
        if exists('/proc/sys/net/ipv4/conf/tun0'):
            self.blocks[0].full_text = 'VPN'
        else:
            self.blocks[0].full_text = ''

from psutil import net_io_counters
class Netspeed(Module):
    def __init__(self, dt):
        self.blocks = [
                Block(full_text='↓', color=COLOR_LABEL),
                Block(full_text='', short_text='', color=COLOR_TEXT),
                Block(full_text='↑', color=COLOR_LABEL),
                Block(full_text='', short_text='', color=COLOR_TEXT),
                ]
        self.dt = dt
        self.recv_counter = 0
        self.sent_counter = 0
        self.update()
    def update(self):
        io_counter = net_io_counters(nowrap=True)
        down_speed = (io_counter.bytes_recv - self.recv_counter) / self.dt / 1024
        self.recv_counter = io_counter.bytes_recv
        up_speed = (io_counter.bytes_sent - self.sent_counter) / self.dt / 1024
        self.sent_counter = io_counter.bytes_sent
        self.blocks[1].full_text = '{}ki/s'.format(int(down_speed))
        if down_speed < 5:
            self.blocks[0].color = COLOR_LABEL_OFF
            self.blocks[1].color = COLOR_TEXT_OFF
        else:
            self.blocks[0].color = COLOR_LABEL_ON
            self.blocks[1].color = COLOR_TEXT_ON
        self.blocks[3].full_text = '{}ki/s'.format(int(up_speed))
        if up_speed < 5:
            self.blocks[2].color = COLOR_LABEL_OFF
            self.blocks[3].color = COLOR_TEXT_OFF
        else:
            self.blocks[2].color = COLOR_LABEL_ON
            self.blocks[3].color = COLOR_TEXT_ON

from psutil import disk_usage
class Disk(Module):
    def __init__(self, path):
        self.blocks = [
                Block(full_text='', color=COLOR_LABEL),
                Block(full_text='--Gi', color=COLOR_TEXT),
                ]
        self.path = path
        self.update()
    def update(self):
        try:
            disk = disk_usage(self.path)
        except OSError as e:
            print(e, file=stderr)
            return
        free_gi = int(disk.free / 1024**3)
        self.blocks[1].full_text = '{}Gi'.format(free_gi)
        if disk.percent > 90:
            self.blocks[0].color = COLOR_LABEL_WARNING
            self.blocks[1].color = COLOR_TEXT_WARNING
        else:
            self.blocks[0].color = COLOR_LABEL
            self.blocks[1].color = COLOR_TEXT

from psutil import disk_io_counters
class DiskIO(Module):
    def __init__(self, dt):
        self.blocks = [
                Block(full_text='↓', short_text='', color=COLOR_LABEL),
                Block(full_text='', short_text='', color=COLOR_TEXT),
                Block(full_text='↑', short_text='', color=COLOR_LABEL),
                Block(full_text='', short_text='', color=COLOR_TEXT),
                ]
        self.dt = dt
        self.read_counter = 0
        self.write_counter = 0
        self.update()
    def update(self):
        io_counter = disk_io_counters(nowrap=True)
        read_speed = (io_counter.read_bytes - self.read_counter) / self.dt / 1024**2
        self.read_counter = io_counter.read_bytes
        write_speed = (io_counter.write_bytes - self.write_counter) / self.dt / 1024**2
        self.write_counter = io_counter.write_bytes
        self.blocks[1].full_text = '{}Mi/s'.format(int(write_speed))
        if write_speed < 10:
            self.blocks[0].color = COLOR_LABEL_OFF
            self.blocks[1].color = COLOR_TEXT_OFF
        else:
            self.blocks[0].color = COLOR_LABEL_ON
            self.blocks[1].color = COLOR_TEXT_ON
        self.blocks[3].full_text = '{}Mi/s'.format(int(read_speed))
        if read_speed < 10:
            self.blocks[2].color = COLOR_LABEL_OFF
            self.blocks[3].color = COLOR_TEXT_OFF
        else:
            self.blocks[2].color = COLOR_LABEL_ON
            self.blocks[3].color = COLOR_TEXT_ON

from psutil import virtual_memory, swap_memory
class RAM(Module):
    def __init__(self):
        self.blocks = [
                Block(full_text='', color=COLOR_LABEL),
                Block(full_text='--%', color=COLOR_TEXT),
                Block(full_text='✚', color=COLOR_LABEL_OFF),
                Block(full_text='--%', short_text='', color=COLOR_TEXT_OFF),
                ]
        self.update()
    def update(self):
        ram = virtual_memory()
        swap = swap_memory()
        self.blocks[1].full_text = '{}%'.format(int(ram.percent))
        if ram.percent < 20:
            self.blocks[1].color = COLOR_TEXT_OFF
        elif ram.percent < 80:
            self.blocks[1].color = COLOR_TEXT_ON
        else:
            self.blocks[1].color = COLOR_TEXT_WARNING
        if swap.percent < 1:
            self.blocks[2].full_text = ''
            self.blocks[2].color = COLOR_LABEL_OFF
            self.blocks[3].full_text = ''
            self.blocks[3].color = COLOR_TEXT_OFF
        elif swap.percent < 50:
            self.blocks[2].full_text = '✚'
            self.blocks[2].color = COLOR_LABEL_ON
            self.blocks[3].full_text = '{}%'.format(int(swap.percent))
            self.blocks[3].color = COLOR_TEXT_ON
        else:
            self.blocks[2].full_text = '✚'
            self.blocks[2].color = COLOR_LABEL_WARNING
            self.blocks[3].full_text = '{}%'.format(int(swap.percent))
            self.blocks[3].color = COLOR_TEXT_WARNING

from psutil import cpu_percent
class CPU(Module):
    def __init__(self):
        self.blocks = [
                Block(full_text='', color=COLOR_LABEL),
                Block(full_text='--%', color=COLOR_TEXT),
                ]
        self.update()
    def update(self):
        cpu = cpu_percent()
        self.blocks[1].full_text = '{}%'.format(int(cpu))
        if cpu < 10:
            self.blocks[1].color = COLOR_TEXT_OFF
        elif cpu < 90:
            self.blocks[1].color = COLOR_TEXT_ON
        else:
            self.blocks[1].color = COLOR_TEXT_WARNING

from psutil import sensors_fans
class Fan(Module):
    def __init__(self):
        self.blocks = [
                Block(full_text='∗', short_text='', color=COLOR_LABEL_OFF),
                ]
        self.update()
    def update(self):
        fans = sensors_fans()
        if len(fans) == 0:
            self.blocks[0].full_text = ''
            return
        self.blocks[0].full_text = '∗'
        speed = 0
        for (name, entries) in fans.items():
            for entry in entries:
                speed = max(speed, entry.current)
        if speed > 0:
            self.blocks[0].color = COLOR_LABEL_ON
        else:
            self.blocks[0].color = COLOR_LABEL_OFF

from psutil import sensors_temperatures
class Temperature(Module):
    def __init__(self):
        self.blocks = [
                Block(full_text='', color=COLOR_LABEL),
                Block(full_text='--℃', color=COLOR_TEXT),
                ]
        self.update()
    def update(self):
        temps = sensors_temperatures()
        if len(temps) == 0:
            self.blocks[0].full_text = ''
            self.blocks[1].full_text = ''
            return
        temp = 0
        for (name, entries) in temps.items():
            for entry in entries:
                temp = max(temp, entry.current)
        if temp < 50:
            self.blocks[0].full_text = ''
            self.blocks[0].color = COLOR_LABEL
        elif temp < 60:
            self.blocks[0].full_text = ''
            self.blocks[0].color = COLOR_LABEL
        elif temp < 70:
            self.blocks[0].full_text = ''
            self.blocks[0].color = COLOR_LABEL
        elif temp < 80:
            self.blocks[0].full_text = ''
            self.blocks[0].color = COLOR_LABEL_WARNING
        else:
            self.blocks[0].full_text = ''
            self.blocks[0].color = COLOR_LABEL_WARNING
        if temp < 70:
            self.blocks[1].full_text = '{}℃'.format(int(temp))
            self.blocks[1].color = COLOR_TEXT
        else:
            self.blocks[1].full_text = '{}℃'.format(int(temp))
            self.blocks[1].color = COLOR_TEXT_WARNING

from subprocess import getstatusoutput
class Brightness(Module):
    def __init__(self):
        self.blocks = [
                Block(full_text='☀', color=COLOR_LABEL),
                Block(full_text='--%', color=COLOR_TEXT),
                ]
        self.update()
    def update(self):
        status, output = getstatusoutput('cat /sys/class/backlight/*/brightness')
        if status != 0:
            print(output, file=stderr)
            self.blocks[1].full_text = ''
            return
        brightness = int(output.split('\n')[0])
        status, output = getstatusoutput('cat /sys/class/backlight/*/max_brightness')
        if status != 0:
            print(output, file=stderr)
            self.blocks[1].full_text = str(brightness)
            return
        max_brightness = int(output.split('\n')[0])
        brightness_percent = int(100 * brightness / max_brightness)
        self.blocks[1].full_text = '{}%'.format(brightness_percent) 

from psutil import sensors_battery
class Battery(Module):
    def __init__(self):
        self.blocks = [
                Block(full_text='', color=COLOR_LABEL_OFF),
                Block(full_text='--%', color=COLOR_TEXT),
                ]
        self.secsleft = 0
        self.alpha = 0.9
        self.update()
    def update(self):
        bat = sensors_battery()
        if bat == None:
            self.blocks[0].full_text = ''
            self.blocks[1].full_text = ''
            return
        if bat.power_plugged:
            self.blocks[0].full_text = '⚉'
            self.blocks[0].color = COLOR_LABEL
        elif bat.percent < 20:
            self.blocks[0].full_text = ''
            self.blocks[0].color = COLOR_LABEL_WARNING
        elif bat.percent < 40:
            self.blocks[0].full_text = ''
            self.blocks[0].color = COLOR_LABEL
        elif bat.percent < 60:
            self.blocks[0].full_text = ''
            self.blocks[0].color = COLOR_LABEL
        elif bat.percent < 80:
            self.blocks[0].full_text = ''
            self.blocks[0].color = COLOR_LABEL
        else:
            self.blocks[0].full_text = ''
            self.blocks[0].color = COLOR_LABEL
        short_text = str(int(bat.percent)) + '%'
        long_text = short_text
        if not bat.power_plugged:
            self.secsleft = int((1-self.alpha) * self.secsleft + self.alpha*bat.secsleft)
            minutes, _ = divmod(self.secsleft, 60)
            hour, minutes = divmod(minutes, 60)
            self.blocks[1].full_text = '{}% ({}:{:0>2})'.format(int(bat.percent), hour, minutes)
        else:
            self.secsleft = 0
            self.blocks[1].full_text = '{}%'.format(int(bat.percent))
        self.blocks[1].short_text = '{}%'.format(int(bat.percent))

from datetime import datetime
class Date(Module):
    def __init__(self):
        self.blocks = [
                Block(full_text='Day.', color=COLOR_LABEL),
                Block(full_text='----.--.--', short_text='--.--', color=COLOR_TEXT_OFF),
                Block(full_text='--:--:--', short_text='--:--', color=COLOR_TEXT),
                ]
        self.update()
    def update(self):
        now = datetime.now()
        self.blocks[0].full_text = now.strftime('%a.')
        self.blocks[1].full_text = now.strftime('%Y.%m.%d')
        self.blocks[1].short_text = now.strftime('%m.%d')
        self.blocks[2].full_text = now.strftime('%H:%M:%S')
        self.blocks[2].short_text = now.strftime('%H:%M')

from subprocess import getstatusoutput
class XKBLayout(Module):
    def __init__(self):
        self.blocks = [
                Block(full_text='', color=COLOR_TEXT_OFF),
                ]
        self.update()
    def update(self):
        status, output = getstatusoutput('xkblayout-state print "%e"')
        if status != 0:
            print(output, file=stderr)
            self.blocks[0].full_text = ''
        else:
            self.blocks[0].full_text = output

from subprocess import getstatusoutput
class Updates(Module):
    def __init__(self):
        self.blocks = [
                Block(full_text='', color=COLOR_SPECIAL),
                ]
        #self.update()
    def update(self):
        status, output = getstatusoutput('checkupdates | wc -l')
        if status != 0:
            print(output, file=stderr)
            count = 0
        else:
            count = int(output)
        if count < 10:
            self.blocks[0].full_text = ''
        else:
            self.blocks[0].full_text = '☰' + str(count)

from threading import Thread
if __name__ == '__main__':

    dt, modules, blocks = configure()

    counter = 0
    while True:
        # Update
        for (upmod, module) in modules:
            if counter % upmod == 0:
                Thread(target=module.update).start()

        # Print
        stdout.write('[')
        stdout.write(','.join(str(block) for block in blocks))
        stdout.write('],\n')
        stdout.flush()
        
        counter += 1
        sleep(dt)

