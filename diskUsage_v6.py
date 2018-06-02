import sys
import os
import optparse
from pprint import pprint
from datetime import datetime
import json
from multiprocessing import Process


def helper_func():
    usage = """%prog [options] <arg1> <arg2> [<arg3>...]"""
    parser = optparse.OptionParser(usage=usage)
    parser.add_option("-n", "--noarg", dest="noarg", action="store_true", default=False, help="Scan current directory")
    parser.add_option("-d", "--dir", dest="directory", help="Specify the directory to scan *WITHOUT* '/' at end")
    parser.add_option("-f", "--file", dest="filename", help="Specify the filename to check *WITHOUT* '/' at end")
    parser.add_option("-r", "--rhuman", dest="humanread", action="store_true", default=False,
                      help="Display size in human readable")

    opts, args = parser.parse_args()
    file_or_dir = None
    if opts.noarg is True:
        file_or_dir = os.getcwd()
    elif opts.directory is not None:
        if os.path.exists(opts.directory) is True:
            file_or_dir = opts.directory
        else:
            print("Not a valid directory")
    elif opts.filename is not None:
        if os.path.isfile(opts.filename) is True:
            file_or_dir = opts.filename
        else:
            print("Not a valid file")
    else:
        print("use help: {} '-h' or '--help'".format(sys.argv[0]))
        sys.exit()

    return file_or_dir, opts.humanread


def disk_usage(path):
    scan_result = get_dir_file_size_master(path)
    return scan_result


def get_file_info(files):
    result = []
    try:
        filesize_bytes = os.path.getsize(files)
        filesize_human = human_readable(filesize_bytes)
        file_created = os.path.getctime(files)
        file_created = datetime.fromtimestamp(file_created).strftime('%Y-%m-%d %H:%M:%S')
        file_modified = os.path.getmtime(files)
        file_modified = datetime.fromtimestamp(file_modified).strftime('%Y-%m-%d %H:%M:%S')
        result = [files, filesize_bytes, filesize_human, file_created, file_modified]
    except FileNotFoundError:
        pass
    return result


def get_dir_info(dirpath, total_dir_size, scan_result):
    dir_total_size_bytes = total_dir_size
    dir_total_size_human = human_readable(dir_total_size_bytes)
    dir_created = os.path.getctime(dirpath)
    dir_created = datetime.fromtimestamp(dir_created).strftime('%Y-%m-%d %H:%M:%S')
    dir_modified = os.path.getmtime(dirpath)
    dir_modified = datetime.fromtimestamp(dir_modified).strftime('%Y-%m-%d %H:%M:%S')

    result = [dirpath, dir_total_size_bytes, dir_total_size_human, dir_created, dir_modified]
    if dirpath not in scan_result:
        scan_result[dirpath] = result[1:]
    return scan_result


def load_backup_file():
    result_file = 'result.json'
    if os.path.isfile(result_file):
        with open('result.json') as file:
            scan_result = json.load(file)
    else:
        return {}
    return scan_result


def form_result(file_path, scan_result):
    result = {file_path: scan_result[file_path]}
    for dirpath, dirnames, filenames in os.walk(file_path):
        for files in filenames:
            try:
                file = os.path.join(dirpath, files)
                result[file] = scan_result[file]
            except KeyError:
                pass
    return result


def get_info(dirpath, filenames, scan_result):
    total_dir_size = 0
    for each_file in filenames:
        file = os.path.join(dirpath, each_file)
        try:
            if file not in scan_result:
                file_info = get_file_info(file)
                total_dir_size += file_info[1]
                scan_result[file] = file_info[1:]
            else:
                total_dir_size += scan_result[file[1]]
        except KeyError:
            pass
        except IndexError:
            pass
    return scan_result, total_dir_size


def get_dir_file_size_master(file_path):
    scan_result = load_backup_file()
    if bool(scan_result) and file_path in scan_result:
        try:
            modified_date = os.path.getmtime(file_path)
            modified_date = datetime.fromtimestamp(modified_date).strftime('%Y-%m-%d %H:%M:%S')
            if scan_result[file_path][3] == modified_date:
                print('PRINTING from backup')
                result = form_result(file_path, scan_result)
                return result

        except FileNotFoundError:
            pass
    else:
        dir_size = 0
        for dirpath, dirnames, filenames in os.walk(file_path):
            scan_result, current_dir_size = get_info(dirpath, filenames, scan_result)

            if dirpath != file_path:
                get_dir_info(dirpath, current_dir_size, scan_result)
            dir_size += current_dir_size
        # get_parent_dir_info
        get_dir_info(file_path, dir_size, scan_result)

    write_to_backup(scan_result)
    return scan_result


def human_readable(value_bytes):
    symbols = ('KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB')
    prefix = {}
    for i, s in enumerate(symbols):
        prefix[s] = 1 << (i + 1) * 10
    for s in reversed(symbols):
        if value_bytes >= prefix[s]:
            value = float(value_bytes) / prefix[s]
            return '%.1f%s' % (value, s)
    return "%sB" % value_bytes


def write_to_backup(scan_result):
    with open('result.json', 'w') as file:
        json.dump(scan_result, file)


def print_to_console(scan_result):
    pprint(scan_result)


def main():
    file_or_dir, human_readable_option = helper_func()
    json_output = disk_usage(file_or_dir)
    print_to_console(json_output)


main()
