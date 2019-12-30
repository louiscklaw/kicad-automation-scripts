#!/usr/bin/env python
import sys
import os
import logging
import argparse
from xvfbwrapper import Xvfb

pcbnew_dir = os.path.dirname(os.path.abspath(__file__))
repo_root = os.path.dirname(pcbnew_dir)

sys.path.append(repo_root)

from util import file_util
from util.ui_automation import (
    PopenContext,
    xdotool,
    wait_for_window,
    recorded_xvfb,
    clipboard_store
)

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

def sleep_some_seconds(second_s):
    from time import sleep
    sleep(second_s)

def try_open_3d_viewer():
    logger.info('open 3d viewer')
    xdotool(['key', 'alt+3'])
    window = wait_for_window('3D Viewer', '3D Viewer')
    # xdotool(['windowsize', '--sync', window, '1024', '768'])
    sleep_some_seconds(1)

def try_zoom_to_fit():
    logger.info('zoom to fit')
    window = wait_for_window('3D Viewer', '3D Viewer')
    xdotool(['key', 'Alt_L+v','f'])
    sleep_some_seconds(1)

def save_png(out_dir, filename):
    logger.info('save png')
    window = wait_for_window('3D Viewer', '3D Viewer')
    xdotool(['key', 'Alt_L+f','Return'])
    sleep_some_seconds(1)

    logger.info('Pasting output dir')
    # xdotool(['key', *out_dir])
    # xdotool(['key', 'slash'])
    # xdotool(['key', *filename])
    save_to_filename = out_dir+'/'+filename
    clipboard_store(bytearray(save_to_filename.encode('utf-8')))
    xdotool(['key', 'ctrl+v'])
    sleep_some_seconds(1)

    xdotool(['key', 'Return'])
    sleep_some_seconds(1)

def get_view(view_direction):
    window = wait_for_window('3D Viewer', '3D Viewer')
    xdotool(['key', view_direction])
    sleep_some_seconds(1)

def try_render_six_side(out_dir, second_s=0,  filename_prefix='basic_'):
    for view_dir in ['x','X','y','Y','z','Z']:
        save_to_filename_prefix = filename_prefix+view_dir
        logger.info(f'getting {view_dir} ... ')
        get_view(view_dir)
        sleep_some_seconds(second_s)
        save_png(out_dir, save_to_filename_prefix)

def try_reset_default_settings():
    logger.info('try reset default settings')
    xdotool(['key', 'Alt_L+p'])
    # sleep_some_seconds(1)
    xdotool(['key', 'Up','Return'])

def try_turn_on_ray_tracing():
    logger.info('try turn on raytracing')
    xdotool(['key', 'Alt_L+p'])
    # sleep_some_seconds(1)
    xdotool(['key', 'Down','Return'])

def try_render_ray_tracing_six_side(out_dir, raytracing_render_s=5):
    try_turn_on_ray_tracing()
    try_render_six_side(out_dir, raytracing_render_s, 'ray_tracing_')

def try_exit():
    sys.exit()

def try_start_PCBNEW():
    window = wait_for_window('pcbnew', 'Pcbnew', 10, False)

    logger.info('Focus main pcbnew window')
    wait_for_window('pcbnew', 'Pcbnew')

    # Needed to rebuild the menu, making sure it is actually built
    xdotool(['windowsize', '--sync', window, '1024', '768'])

    wait_for_window('pcbnew', 'Pcbnew')

def run_gen_3d(pcb_file, output_dir, record=True):
    file_util.mkdir_p(output_dir)

    recording_file = os.path.join(output_dir, 'run_drc_screencast.ogv')
    drc_output_file = os.path.join(os.path.abspath(output_dir), 'drc_result.rpt')

    print(f'recorded file {recording_file}')

    with recorded_xvfb(recording_file, width=1024, height=768, colordepth=24):
        try:
            with PopenContext(['pcbnew', pcb_file], close_fds=True) as pcbnew_proc:
                try_start_PCBNEW()

                try_open_3d_viewer()

                try_reset_default_settings()

                try_zoom_to_fit()
                try_render_six_side(output_dir)
                try_render_ray_tracing_six_side(output_dir, 5)

                try_exit()
        except Exception as e:
            raise e
            pass

def main():
    print('helloworld 3d generator')
    parser = argparse.ArgumentParser(description='KiCad automated 3d generator')

    parser.add_argument('kicad_pcb_file', help='KiCad layout file')
    parser.add_argument('output_dir', help='Output directory')
    # parser.add_argument('--ignore_unconnected', '-i', help='Ignore unconnected paths',
    #     action='store_true'
    # )
    parser.add_argument('--record', help='Record the UI automation',
        action='store_true'
    )

    args = parser.parse_args()

    run_gen_3d(args.kicad_pcb_file, args.output_dir, args.record)

    # try:
    #     drc_result = parse_drc(run_drc(args.kicad_pcb_file, args.output_dir, args.record))
    #     pass
    # except Exception as e:
    #     os.system('ls -l '+args.kicad_pcb_file)
    #     print(f'input kicad_pcb file path: {args.kicad_pcb_file}')
    #     pass

    # logging.info(drc_result);
    # if drc_result['drc_errors'] == 0 and drc_result['unconnected_pads'] == 0:
    #     exit(0)
    # else:

    #     logger.error('Found {} DRC errors and {} unconnected pads'.format(
    #         drc_result['drc_errors'],
    #         drc_result['unconnected_pads']
    #     ))
    #     exit(drc_result['drc_errors']+drc_result['unconnected_pads'])


if __name__ == '__main__':
  main()